// SPDX-FileCopyrightText: 2023 Plata Hill <plata.hill@kdemail.net>
// SPDX-License-Identifier: LGPL-2.1-or-later

import QtQuick 2.14
import QtQuick.Controls 2.14 as Controls
import org.kde.kirigami 2.19 as Kirigami
import org.kde.kirigamiaddons.formcard 1.0 as FormCard

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
