// SPDX-FileCopyrightText: 2023 Plata Hill <plata.hill@kdemail.net>
// SPDX-License-Identifier: LGPL-2.1-or-later

import QtQuick
import QtQuick.Controls as Controls
import QtQuick.Layouts
import org.kde.kirigami as Kirigami
import org.kde.kalm

Kirigami.Page {
    property alias infoText: dialog.subtitle
    property alias instructionText: instruction.text

    padding: 0

    actions: Kirigami.Action {
        visible: KalmSettings.showInfoButton
        icon.name: "help-about-symbolic"
        onTriggered: dialog.open()
    }

    Controls.Label {
        id: instruction

        anchors.fill: parent
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        z: 100
        font.bold: true
        font.pixelSize: 80
        fontSizeMode: Text.Fit
        padding: Kirigami.Units.largeSpacing

        FadeBehavior on text {}
    }

    Kirigami.PromptDialog {
        id: dialog

        title: i18nc("@title:dialog", "Information")
        standardButtons: Controls.Dialog.Close
    }
}
