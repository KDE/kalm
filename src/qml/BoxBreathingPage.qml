// SPDX-FileCopyrightText: 2023 Plata Hill <plata.hill@kdemail.net>
// SPDX-License-Identifier: LGPL-2.1-or-later

import QtQuick

BreathingPage {
    id: page

    padding: 0
    title: i18nc("@title", "Box Breathing")
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

        anchors.fill: parent
        Component.onCompleted: animation.start()

        SequentialAnimation {
            id: animation

            loops: Animation.Infinite

            PropertyAction {
                target: gradient
                properties: "posIn, posOut"
                value: 1
            }

            ScriptAction {
                script: page.instructionText = i18nc("Breathing instruction, as in 'breathe in'", "in")
            }

            NumberAnimation {
                target: gradient
                properties: "posIn"
                to: 0
                duration: 4000
            }

            ScriptAction {
                script: page.instructionText = i18nc("Breathing instruction, as in 'hold your breath'", "hold")
            }

            PauseAnimation {
                duration: 4000
            }

            ScriptAction {
                script: page.instructionText = i18nc("Breathing instruction, as in 'breathe out'", "out")
            }

            NumberAnimation {
                target: gradient
                properties: "posOut"
                to: 0
                duration: 4000
            }

            ScriptAction {
                script: page.instructionText = i18nc("Breathing instruction, as in 'hold your breath'", "hold")
            }

            PauseAnimation {
                duration: 4000
            }
        }

        gradient: BreathingGradient {
            id: gradient
        }
    }
}
