// SPDX-FileCopyrightText: 2023 Plata Hill <plata.hill@kdemail.net>
// SPDX-License-Identifier: LGPL-2.1-or-later

import QtQuick 2.15

BreathingPage {
    id: page

    padding: 0
    infoText: i18n("Nadi Shodhana (Alternate Nostril Breathing) reduces blood pressure and helps to keep a calm mind.\
                    <br>\
                    <ul>\
                    <li>Place the thumb of your right hand on your right nostril, your index and middle finger between your eyebrows and ring finger on the left nostril.</li>\
                    <li>Close your right nostril with your thumb and breathe in through your left nostril.</li>\
                    <li>Close both nostrils with your thumb and ring finger. Hold.</li>\
                    <li>Lift your thumb and breath out through the right nostril.</li>\
                    <li>Close both nostrils with your thumb and ring finger. Hold.</li>\
                    <li>Lift your thumb and breath in through your right nostril.</li>\
                    <li>Close both nostrils with your thumb and ring finger. Hold.</li>\
                    <li>Close your right nostril with your thumb and breathe out through your left nostril.</li>\
                    </ul>\
                    <br>\
                    Repeat 5-10 times.")

    Rectangle {
        id: rect

        property bool leftNostril: true

        anchors.top: parent.top
        anchors.left: parent.left
        width: parent.width / 2
        height: parent.height
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
                duration: 4000
            }

            ScriptAction {
                script: {
                    if (rect.leftNostril)
                        rect.anchors.left = rect.parent.horizontalCenter;
                    else
                        rect.anchors.left = rect.parent.left;
                    rect.leftNostril = !rect.leftNostril;
                    page.instructionText = i18n("out");
                }
            }

            NumberAnimation {
                target: gradient
                properties: "posOut"
                to: 0
                duration: 4000
            }

            ScriptAction {
                script: page.instructionText = i18n("hold")
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
