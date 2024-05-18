// SPDX-FileCopyrightText: 2023 Plata Hill <plata.hill@kdemail.net>
// SPDX-License-Identifier: LGPL-2.1-or-later

import QtQuick
import QtQuick.Controls as Controls
import QtQuick.Layouts
import org.kde.kirigami as Kirigami

Kirigami.Page {
    property alias infoText: overlayText.text
    property alias instructionText: instruction.text

    padding: 0

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
        z: 100
        onClicked: overlay.open()
    }

    Text {
        id: instruction

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        horizontalAlignment: Text.AlignHCenter
        z: 100
        font.bold: true
        font.pixelSize: 80
        color: Kirigami.Theme.textColor

        FadeBehavior on text {}
    }

    Kirigami.OverlaySheet {
        id: overlay

        Text {
            id: overlayText

            Layout.fillWidth: true
            color: Kirigami.Theme.textColor
            wrapMode: Text.WordWrap
        }
    }
}
