// SPDX-FileCopyrightText: 2023 Plata Hill <plata.hill@kdemail.net>
// SPDX-License-Identifier: LGPL-2.1-or-later

import QtQuick

Behavior {
    id: root

    property Item fadeTarget: targetProperty.object

    SequentialAnimation {
        NumberAnimation {
            target: root.fadeTarget
            property: "opacity"
            to: 0
            easing.type: Easing.InQuad
        }

        PropertyAction {}

        NumberAnimation {
            target: root.fadeTarget
            property: "opacity"
            to: 1
            easing.type: Easing.OutQuad
        }
    }
}
