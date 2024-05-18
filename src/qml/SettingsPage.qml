// SPDX-FileCopyrightText: 2023 Plata Hill <plata.hill@kdemail.net>
// SPDX-License-Identifier: LGPL-2.1-or-later

import QtQuick.Controls as Controls
import QtQuick.Layouts
import org.kde.kirigami as Kirigami

Kirigami.ScrollablePage {
    title: i18n("Settings")

    Kirigami.FormLayout {
        Kirigami.Separator {
            Kirigami.FormData.isSection: true
            Kirigami.FormData.label: i18n("General")
        }

        RowLayout {
            Kirigami.FormData.label: i18n("Show info button")

            Controls.CheckBox {
                checked: _settings.showInfoButton
                onCheckedChanged: _settings.showInfoButton = checked
            }
        }

        Kirigami.Separator {
            Kirigami.FormData.isSection: true
            Kirigami.FormData.label: i18n("Coordinated Breathing")
        }

        RowLayout {
            Kirigami.FormData.label: i18n("Breathe out duration")

            Controls.SpinBox {
                from: 0
                to: 120
                editable: true
                value: _settings.breatheOutDuration
                onValueModified: _settings.breatheOutDuration = value
            }

            Controls.Label {
                text: i18n("s")
            }
        }
    }
}
