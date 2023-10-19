// SPDX-FileCopyrightText: 2023 Plata Hill <plata.hill@kdemail.net>
// SPDX-License-Identifier: LGPL-2.1-or-later

import QtQuick 2.15

BreathingPage {
    id: page

    padding: 0
    infoText: i18n("Yogic Breathing is a standard pranayama technique to revitalize the body.\
                    <br>\
                    <ul>\
                    <li>Place a hand on your navel. Breathe into your belly and feel the expansion.</li>\
                    <li>Move your hand up above your lower ribs. Breathe into your mid-torso and feel the expansion.</li>\
                    <li>Move your hand up to your upper chest. Breathe in and feel your collarbones lift slightly.</li>\
                    <li>Breathe out. Feel your collarbones sink.</li>\
                    <li>Move your hand down to your lower ribs. Breathe out and feel your mid-torso retreat.</li>\
                    <li>Move your hand down to your navel. Breathe out and feel your belly retreat.</li>\
                    </ul>\
                    <br>\
                    Repeat up to 15 minutes.\
                    <br>\
                    <br>\
                    The steps should form a single, fluent breath.\
                    <br>\
                    At the beginning, it might be helpful to practice the three stages (belly, mid-torso, upper chest) individually\
                    (i.e. breathe only into your belly, then breathe out again etc.).")

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
                script: page.instructionText = i18n("in\n(belly)")
            }

            NumberAnimation {
                target: gradient
                properties: "posIn"
                to: 0.66
                duration: 2000
            }

            ScriptAction {
                script: page.instructionText = i18n("in\n(mid-torso)")
            }

            NumberAnimation {
                target: gradient
                properties: "posIn"
                to: 0.33
                duration: 2000
            }

            ScriptAction {
                script: page.instructionText = i18n("in\n(upper chest)")
            }

            NumberAnimation {
                target: gradient
                properties: "posIn"
                to: 0
                duration: 2000
            }

            PauseAnimation {
                duration: 500
            }

            ScriptAction {
                script: page.instructionText = i18n("out\n(upper chest)")
            }

            NumberAnimation {
                target: gradient
                properties: "posIn"
                to: 0.33
                duration: 2000
            }

            ScriptAction {
                script: page.instructionText = i18n("out\n(mid-torso)")
            }

            NumberAnimation {
                target: gradient
                properties: "posIn"
                to: 0.66
                duration: 2000
            }

            ScriptAction {
                script: page.instructionText = i18n("out\n(belly)")
            }

            NumberAnimation {
                target: gradient
                properties: "posIn"
                to: 1
                duration: 2000
            }

            PauseAnimation {
                duration: 500
            }

        }

        gradient: BreathingGradient {
            id: gradient
        }

    }

}
