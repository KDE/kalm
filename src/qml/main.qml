// SPDX-FileCopyrightText: 2023 Plata Hill <plata.hill@kdemail.net>
// SPDX-License-Identifier: LGPL-2.1-or-later

import QtQuick
import QtQuick.Controls as Controls
import org.kde.kirigami as Kirigami
import org.kde.kirigamiaddons.formcard as FormCard
import org.kde.config as KConfig

Kirigami.ApplicationWindow {
    title: "Kalm"
    pageStack.initialPage: boxBreathing

    BoxBreathingPage {
        id: boxBreathing
    }

    globalDrawer: KalmGlobalDrawer {}

    contextDrawer: Kirigami.ContextDrawer {
        id: contextDrawer
    }

    KConfig.WindowStateSaver {
        configGroupName: "Main"
    }
}
