// SPDX-FileCopyrightText: 2023 Plata Hill <plata.hill@kdemail.net>
// SPDX-License-Identifier: LGPL-2.1-or-later

import QtQuick 2.15
import QtQuick.Controls 2.15 as Controls
import QtQuick.Layouts 1.14
import org.kde.kirigami 2.19 as Kirigami

Kirigami.Page {
    padding: 0

    Rectangle {
        id: rect

        property double posIn: 1
        property double posOut: 1

        anchors.fill: parent
        Component.onCompleted: animation.start()

        SequentialAnimation {
            id: animation

            loops: Animation.Infinite

            NumberAnimation {
                target: rect
                properties: "posIn"
                from: 1
                to: 0
                duration: 4000
            }

            PauseAnimation {
                duration: 4000
            }

            NumberAnimation {
                target: rect
                properties: "posOut"
                from: 1
                to: 0
                duration: 4000
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
                position: rect.posOut == 0 ? 0 : rect.posIn + 0.001
                color: "#002b59"
            }

            GradientStop {
                position: rect.posOut == 0 ? 0 : rect.posOut - 0.001
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

    Controls.RoundButton {
        visible: _settings.showInfoButton
        icon.name: "help-about-symbolic"
        flat: true
        icon.height: 30
        icon.width: 30
        leftInset: 5
        rightInset: 5
        topInset: 5
        bottomInset: 5
        onClicked: overlay.open()
    }

    Kirigami.OverlaySheet {
        id: overlay

        Text {
            text: i18n("Box Breathing is used by the Navy SEALs to quickly and effectively reduce stress.\
                        <br>\
                        <ul>\
                        <li>Breathe in through the nose as the blue area fills up (4s)</li>\
                        <li>Hold (4s)</li>\
                        <li>Breathe out through the nose as the blue are is emptied (4s)</li>\
                        <li>Hold (4s)</li>\
                        </ul>\
                        <br>\
                        Repeat for at least 5-10 minutes.")
            Layout.fillWidth: true
            color: Kirigami.Theme.textColor
            wrapMode: Text.WordWrap
        }

    }

}
