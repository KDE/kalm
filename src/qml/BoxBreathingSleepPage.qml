// SPDX-FileCopyrightText: 2023 Plata Hill <plata.hill@kdemail.net>
// SPDX-License-Identifier: LGPL-2.1-or-later

import QtQuick

BreathingPage {
    id: page

    padding: 0
    title: i18nc("@title", "Box Breathing (sleep)")
    infoText: i18n("A Box Breathing variant with a longer breathe-out phase helps to relax before going to sleep.\
                    <br>\
                    <ul>\
                    <li>Breathe in through your nose (4s).</li>\
                    <li>Hold (4s).</li>\
                    <li>Breathe out through your nose (6s).</li>\
                    <li>Hold (2s).</li>\
                    </ul>\
                    <br>\
                    Repeat at least 6 times.")

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
                duration: 6000
            }

            ScriptAction {
                script: page.instructionText = i18nc("Breathing instruction, as in 'hold your breath'", "hold")
            }

            PauseAnimation {
                duration: 2000
            }
        }

        gradient: BreathingGradient {
            id: gradient
        }
    }
}
