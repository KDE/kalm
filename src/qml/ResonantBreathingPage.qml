// SPDX-FileCopyrightText: 2023 Plata Hill <plata.hill@kdemail.net>
// SPDX-License-Identifier: LGPL-2.1-or-later

import QtQuick

BreathingPage {
    id: page

    padding: 0
    infoText: i18n("Resonant Breathing relaxes the body by coupling heart rate, blood pressure and respiration.\
                    <br>\
                    <ul>\
                    <li>Sit upright and relaxed.</li>\
                    <li>Breathe in (5.5s). Expand your belly as the air fills your lungs.</li>\
                    <li>Breathe out (5.5s). Contract your belly as your lungs are emptied.</li>\
                    </ul>\
                    <br>\
                    Repeat at least 10 times.")

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
                duration: 5500
            }

            ScriptAction {
                script: page.instructionText = i18n("out")
            }

            NumberAnimation {
                target: gradient
                properties: "posOut"
                to: 0
                duration: 5500
            }
        }

        gradient: BreathingGradient {
            id: gradient
        }
    }
}
