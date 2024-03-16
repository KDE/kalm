// SPDX-FileCopyrightText: 2023 Plata Hill <plata.hill@kdemail.net>
// SPDX-License-Identifier: LGPL-2.1-or-later

import QtQuick
import QtQuick.Controls as Controls
import org.kde.kirigami as Kirigami
import org.kde.kirigamiaddons.formcard as FormCard

Kirigami.ApplicationWindow {
    title: "Kalm"
    pageStack.initialPage: boxBreathing

    Component {
        id: aboutPage

        FormCard.AboutPage {
            aboutData: _aboutData
        }

    }

    BoxBreathingPage {
        id: boxBreathing
    }

    globalDrawer: KalmGlobalDrawer {
    }

    contextDrawer: Kirigami.ContextDrawer {
        id: contextDrawer
    }

}
