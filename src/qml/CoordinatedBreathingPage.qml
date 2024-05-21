// SPDX-FileCopyrightText: 2023 Plata Hill <plata.hill@kdemail.net>
// SPDX-License-Identifier: LGPL-2.1-or-later

import QtQuick
import org.kde.kalm.settings

BreathingPage {
    id: page

    padding: 0
    title: i18nc("@title", "Coordinated Breathing")
    infoText: i18n("Coordinated Breathing improves the efficiency of your breathing by amplifying the movement of the diaphragm.\
                    It is often used in sports or singing.\
                    <br>\
                    <ul>\
                    <li>Sit upright with your chin in a 90° angle to your body.</li>\
                    <li>Breathe in gently through your nose.</li>\
                    <li>Breathe out while repeatedly, silently counting to 10.</li>\
                    <li>When finished breathing out, continue counting but whisper. Let your voice fade out until your lungs are completely empty.</li>\
                    </ul>\
                    <br>\
                    Repeat at least 10-30 times.")

    Timer {
        id: timer

        property int counter: 0

        interval: 1000
        running: false
        repeat: true
        onTriggered: {
            page.instructionText = (counter % 10) + 1;
            counter++;
            if (counter === Settings.breatheOutDuration)
                stop();
        }
    }

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
                script: page.instructionText = "1"
            }

            ParallelAnimation {
                ScriptAction {
                    script: {
                        timer.counter = 1;
                        timer.start();
                    }
                }

                NumberAnimation {
                    target: gradient
                    properties: "posOut"
                    to: 0
                    duration: Settings.breatheOutDuration * 1000
                }
            }
        }

        gradient: BreathingGradient {
            id: gradient
        }
    }
}
