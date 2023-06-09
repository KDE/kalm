// SPDX-FileCopyrightText: 2023 Plata Hill <plata.hill@kdemail.net>
// SPDX-License-Identifier: LGPL-2.1-or-later

import QtQuick 2.15

BreathingPage {
    id: page

    padding: 0
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
                duration: 6000
            }

            ScriptAction {
                script: page.instructionText = i18n("hold")
            }

            PauseAnimation {
                duration: 2000
            }

            PropertyAction {
                target: rect
                properties: "posIn, posOut"
                value: 1
            }

        }

        gradient: BreathingGradient {
            posIn: rect.posIn
            posOut: rect.posOut
        }

    }

}
