// SPDX-FileCopyrightText: 2023 Plata Hill <plata.hill@kdemail.net>
// SPDX-License-Identifier: LGPL-2.1-or-later

import QtQuick
import org.kde.kirigami as Kirigami

Gradient {
    property double posOut: 0
    property double posIn: 0

    GradientStop {
        position: 0
        color: "transparent"
    }

    GradientStop {
        position: posIn - 0.001
        color: "transparent"
    }

    GradientStop {
        position: posOut <= posIn ? 0 : posIn + 0.001
        color: Qt.darker(Kirigami.Theme.highlightColor)
    }

    GradientStop {
        position: posOut <= posIn ? 0 : posOut - 0.001
        color: Kirigami.Theme.highlightColor
    }

    GradientStop {
        position: posOut + 0.001
        color: "transparent"
    }

    GradientStop {
        position: 1
        color: "transparent"
    }
}
