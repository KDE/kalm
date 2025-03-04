// SPDX-FileCopyrightText: 2023 Plata Hill <plata.hill@kdemail.net>
// SPDX-License-Identifier: LGPL-2.1-or-later

import QtQuick.Controls as Controls
import QtQuick.Layouts
import org.kde.kirigami as Kirigami
import org.kde.kirigamiaddons.formcard as FormCard
import org.kde.kalm

FormCard.FormCardPage {
    title: i18n("Settings")

    FormCard.FormHeader {
        title: i18nc("@title:group", "General")
    }

    FormCard.FormCard {
        FormCard.FormCheckDelegate {
            text: i18nc("@option:check", "Show info button")
            checked: KalmSettings.showInfoButton
            onCheckedChanged: {
                KalmSettings.showInfoButton = checked;
                KalmSettings.save();
            }
        }
    }

    FormCard.FormHeader {
        title: i18nc("@title:group", "Coordinated Breathing")
    }

    FormCard.FormCard {
        FormCard.FormSpinBoxDelegate {
            label: i18nc("@label:spinbox", "Breathe out duration:")
            from: 0
            to: 120
            value: KalmSettings.breatheOutDuration
            onValueChanged: {
                KalmSettings.breatheOutDuration = value;
                KalmSettings.save();
            }

            textFromValue: (value, locale) => {
                return i18nc("Number in seconds", "%1s", value);
            }

            valueFromText: (text, locale) => {
                return text.substring(0, text.length - 1);
            }
        }
    }
}
