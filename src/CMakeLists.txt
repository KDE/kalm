# SPDX-FileCopyrightText: 2023 Plata Hill <plata.hill@kdemail.net>
# SPDX-License-Identifier: BSD-2-Clause

configure_file(${CMAKE_CURRENT_SOURCE_DIR}/config-kalm.h.cmake ${CMAKE_CURRENT_BINARY_DIR}/config-kalm.h)

add_executable(kalm
    main.cpp
)

ecm_add_qml_module(kalm URI org.kde.kalm
    NO_RESOURCE_TARGET_PATH
    QML_FILES
        qml/main.qml
        qml/478BreathingPage.qml
        qml/CoordinatedBreathingPage.qml
        qml/BoxBreathingPage.qml
        qml/BoxBreathingSleepPage.qml
        qml/BreathingGradient.qml
        qml/BreathingPage.qml
        qml/FadeBehavior.qml
        qml/ResonantBreathingPage.qml
        qml/NadiShodhanaPage.qml
        qml/SettingsPage.qml
        qml/KalmGlobalDrawer.qml
        qml/YogicBreathingPage.qml
)

kconfig_add_kcfg_files(kalm KalmSettings.kcfgc GENERATE_MOC)

target_include_directories(kalm PRIVATE ${CMAKE_BINARY_DIR})
target_link_libraries(kalm PUBLIC Qt::Core Qt::Qml Qt::Quick Qt::QuickControls2 KF${QT_MAJOR_VERSION}::CoreAddons KF${QT_MAJOR_VERSION}::ConfigGui KF${QT_MAJOR_VERSION}::I18n)

if(ANDROID)
    target_link_libraries(kalm PUBLIC KF${QT_MAJOR_VERSION}::Kirigami2)

    kirigami_package_breeze_icons(ICONS
        help-about-symbolic
        media-playback-start-symbolic
        settings-configure
    )
    ecm_add_android_apk(kalm ANDROID_DIR ${CMAKE_SOURCE_DIR}/android)
else()
    target_link_libraries(kalm PUBLIC Qt::Widgets)
endif()

if(TARGET KF${QT_MAJOR_VERSION}::Crash)
    target_link_libraries(kalm PRIVATE KF${QT_MAJOR_VERSION}::Crash)
endif()

install(TARGETS kalm ${KF${QT_MAJOR_VERSION}_INSTALL_TARGETS_DEFAULT_ARGS})
