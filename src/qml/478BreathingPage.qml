// SPDX-FileCopyrightText: 2023 Plata Hill <plata.hill@kdemail.net>
// SPDX-License-Identifier: LGPL-2.1-or-later

import QtQuick

BreathingPage {
    id: page

    padding: 0
    infoText: i18n("4-7-8 Breathing puts the body into a deep relaxation state, e.g. to better fall asleep on a flight.\
                    <br>\
                    <ul>\
                    <li>Breathe in through your nose (4s).</li>\
                    <li>Hold (7s).</li>\
                    <li>Breathe out through your mouth making a whooshing sound (8s).</li>\
                    </ul>\
                    <br>\
                    Repeat at least 4 times.")

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
                script: page.instructionText = i18n("in")
            }

            NumberAnimation {
                target: gradient
                properties: "posIn"
                to: 0
                duration: 4000
            }

            ScriptAction {
                script: page.instructionText = i18n("hold")
            }

            PauseAnimation {
                duration: 7000
            }

            ScriptAction {
                script: page.instructionText = i18n("out")
            }

            NumberAnimation {
                target: gradient
                properties: "posOut"
                to: 0
                duration: 8000
            }
        }

        gradient: BreathingGradient {
            id: gradient
        }
    }
}
