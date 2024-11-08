# SPDX-FileCopyrightText: 2024 Plata Hill <plata.hill@kdemail.net>
# SPDX-License-Identifier: BSD-2-Clause

add_test(NAME kalm-self-test COMMAND kalm --self-test)
if (NOT BUILD_SHARED_LIBS)
    set_tests_properties(kalm-self-test PROPERTIES
        ENVIRONMENT "QT_QUICK_CONTROLS_STYLE=org.kde.breeze"
    )
endif()
