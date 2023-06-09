// SPDX-FileCopyrightText: 2023 Plata Hill <plata.hill@kdemail.net>
// SPDX-License-Identifier: LGPL-2.1-or-later

import QtQuick 2.15

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
        color: "#002b59"
    }

    GradientStop {
        position: posOut <= posIn ? 0 : posOut - 0.001
        color: "#3daee9"
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
