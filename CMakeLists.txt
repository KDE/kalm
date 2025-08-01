# SPDX-FileCopyrightText: 2023 Plata Hill <plata.hill@kdemail.net>
# SPDX-License-Identifier: BSD-2-Clause

cmake_minimum_required(VERSION 3.16)

# KDE Applications version, managed by release script.
set(RELEASE_SERVICE_VERSION_MAJOR "25")
set(RELEASE_SERVICE_VERSION_MINOR "11")
set(RELEASE_SERVICE_VERSION_MICRO "70")
set(RELEASE_SERVICE_VERSION "${RELEASE_SERVICE_VERSION_MAJOR}.${RELEASE_SERVICE_VERSION_MINOR}.${RELEASE_SERVICE_VERSION_MICRO}")

project(kalm VERSION ${RELEASE_SERVICE_VERSION})

set(KF_MIN_VERSION "6.4.0")
set(QT_MIN_VERSION "6.6.0")

include(FeatureSummary)

################# KDE settings #################

find_package(ECM ${KF_MIN_VERSION} REQUIRED NO_MODULE)

# where to look first for CMake modules, before ${CMAKE_ROOT}/Modules/ is checked
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${ECM_MODULE_PATH} ${ECM_KDE_MODULE_DIR})

include(ECMAddAndroidApk)
include(ECMAddTests)
include(ECMSetupVersion)
include(ECMGenerateHeaders)
include(KDEInstallDirs)
include(KDEClangFormat)
include(KDECMakeSettings)
include(KDEGitCommitHooks)
include(ECMPoQmTools)
include(KDECompilerSettings NO_POLICY_SCOPE)
include(QmlFormat.cmake)

ecm_setup_version(${PROJECT_VERSION}
    VARIABLE_PREFIX KALM
    VERSION_HEADER ${CMAKE_CURRENT_BINARY_DIR}/kalm-version.h
)

################# dependencies #################

find_package(Qt${QT_MAJOR_VERSION} ${QT_MIN_VERSION} REQUIRED NO_MODULE COMPONENTS Core Quick Test Gui QuickControls2)
qt_policy(SET QTP0001 NEW)

find_package(KF${QT_MAJOR_VERSION} ${KF_MIN_VERSION} REQUIRED COMPONENTS CoreAddons Config I18n)

if(ANDROID)
    find_package(KF${QT_MAJOR_VERSION} ${KF_MIN_VERSION} REQUIRED COMPONENTS Kirigami2)
else()
    find_package(KF${QT_MAJOR_VERSION} ${KF_MIN_VERSION} OPTIONAL_COMPONENTS Crash)
    find_package(Qt${QT_MAJOR_VERSION} ${QT_MIN_VERSION} REQUIRED COMPONENTS Widgets)
endif()

if(TARGET KF${QT_MAJOR_VERSION}::Crash)
    set(HAVE_KCRASH TRUE)
endif()

find_package(KF${QT_MAJOR_VERSION}KirigamiAddons REQUIRED)
set_package_properties(KF${QT_MAJOR_VERSION}KirigamiAddons PROPERTIES
    TYPE REQUIRED
    PURPOSE "Provides additional visual components"
)

if (NOT ANDROID)
    find_package(KF${QT_MAJOR_VERSION}QQC2DesktopStyle ${KF_MIN_VERSION} REQUIRED)
    set_package_properties(KF${QT_MAJOR_VERSION}QQC2DesktopStyle PROPERTIES
        TYPE RUNTIME
    )
endif()

include(ECMQmlModule)

################# compiler #################

set(CMAKE_CXX_STANDARD 11)
if(MSVC)
    add_compile_options(/W3 /WX)
else()
    add_compile_options(-Wall -Wextra -Wconversion -Wsign-conversion -pedantic)

    if (CMAKE_CXX_COMPILER_ID STREQUAL "GNU" AND CMAKE_CXX_COMPILER_VERSION VERSION_GREATER_EQUAL 14.0.0)
        add_compile_options(-Wno-error=hardened)
    endif()
endif()

################# build and install #################

add_subdirectory(autotests)
add_subdirectory(src)

ki18n_install(po)

install(PROGRAMS org.kde.kalm.desktop DESTINATION ${KDE_INSTALL_APPDIR})
install(FILES org.kde.kalm.appdata.xml DESTINATION ${KDE_INSTALL_METAINFODIR})
install(FILES org.kde.kalm.svg DESTINATION ${KDE_INSTALL_FULL_ICONDIR}/hicolor/scalable/apps)

feature_summary(WHAT ALL INCLUDE_QUIET_PACKAGES FATAL_ON_MISSING_REQUIRED_PACKAGES)

################# format sources #################

file(GLOB_RECURSE ALL_CLANG_FORMAT_SOURCE_FILES
    src/*.cpp src/*.h
)
kde_clang_format(${ALL_CLANG_FORMAT_SOURCE_FILES})
add_custom_target(clang-format-always ALL DEPENDS ${ALL_CLANG_FORMAT_SOURCE_FILES})
add_dependencies(clang-format-always clang-format)

kde_configure_git_pre_commit_hook(CHECKS CLANG_FORMAT)

file(GLOB_RECURSE ALL_QML_FORMAT_SOURCE_FILES src/qml/*.qml)
qml_format(${ALL_QML_FORMAT_SOURCE_FILES})

add_custom_target(qml-format-always ALL DEPENDS ${ALL_QML_FORMAT_SOURCE_FILES})
add_dependencies(qml-format-always qml-format)
