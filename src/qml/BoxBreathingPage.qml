// SPDX-FileCopyrightText: 2023 Plata Hill <plata.hill@kdemail.net>
// SPDX-License-Identifier: LGPL-2.1-or-later

import QtQuick 2.15

BreathingPage {
    id: page

    padding: 0
    infoText: i18n("Box Breathing is used by the Navy SEALs to quickly and effectively reduce stress.\
                    <br>\
                    <ul>\
                    <li>Breathe in through your nose (4s).</li>\
                    <li>Hold (4s).</li>\
                    <li>Breathe out through your nose (4s).</li>\
                    <li>Hold (4s).</li>\
                    </ul>\
                    <br>\
                    Repeat for at least 5-10 minutes.")

    Rectangle {
        id: rect

        property double posIn: 1
        property double posOut: 1

        anchors.fill: parent
        Component.onCompleted: animation.start()

        SequentialAnimation {
            id: animation

            loops: Animation.Infinite

            ScriptAction {
                script: page.instructionText = i18n("in")
            }

            NumberAnimation {
                target: rect
                properties: "posIn"
                from: 1
                to: 0
                duration: 4000
            }

            ScriptAction {
                script: page.instructionText = i18n("hold")
            }

            PauseAnimation {
                duration: 4000
            }

            ScriptAction {
                script: page.instructionText = i18n("out")
            }

            NumberAnimation {
                target: rect
                properties: "posOut"
                from: 1
                to: 0
                duration: 4000
            }

            ScriptAction {
                script: page.instructionText = i18n("hold")
            }

            PauseAnimation {
                duration: 4000
            }

            PropertyAction {
                target: rect
                property: "posIn"
                value: 1
            }

            PropertyAction {
                target: rect
                property: "posOut"
                value: 1
            }

        }

        gradient: Gradient {
            GradientStop {
                position: 0
                color: "transparent"
            }

            GradientStop {
                position: rect.posIn - 0.001
                color: "transparent"
            }

            GradientStop {
                position: rect.posOut === 0 ? 0 : rect.posIn + 0.001
                color: "#002b59"
            }

            GradientStop {
                position: rect.posOut === 0 ? 0 : rect.posOut - 0.001
                color: "#3daee9"
            }

            GradientStop {
                position: rect.posOut + 0.001
                color: "transparent"
            }

            GradientStop {
                position: 1
                color: "transparent"
            }

        }

    }

}
