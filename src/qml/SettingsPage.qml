// SPDX-FileCopyrightText: 2023 Plata Hill <plata.hill@kdemail.net>
// SPDX-License-Identifier: LGPL-2.1-or-later

import QtQuick.Controls 2.15 as Controls
import QtQuick.Layouts 1.14
import org.kde.kirigami 2.19 as Kirigami

Kirigami.ScrollablePage {
    title: i18n("Settings")

    Kirigami.FormLayout {
        Kirigami.Separator {
            Kirigami.FormData.isSection: true
            Kirigami.FormData.label: i18n("UI")
        }

        RowLayout {
            Kirigami.FormData.label: i18n("Show info button")

            Controls.CheckBox {
                checked: _settings.showInfoButton
                onCheckedChanged: _settings.showInfoButton = checked
            }

        }

    }

}
