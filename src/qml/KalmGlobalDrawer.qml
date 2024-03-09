// SPDX-FileCopyrightText: 2023 Plata Hill <plata.hill@kdemail.net>
// SPDX-License-Identifier: LGPL-2.1-or-later

import QtQuick 2.14
import QtQuick.Controls 2.14 as Controls
import org.kde.kirigami 2.19 as Kirigami

Kirigami.GlobalDrawer {
    isMenu: true
    actions: [
        Kirigami.Action {
            text: i18n("4-7-8 Breathing")
            icon.name: "media-playback-start-symbolic"
            onTriggered: {
                pageStack.layers.clear();
                pageStack.clear();
                pageStack.push("qrc:/478BreathingPage.qml");
            }
        },
        Kirigami.Action {
            text: i18n("Coordinated Breathing")
            icon.name: "media-playback-start-symbolic"
            onTriggered: {
                pageStack.layers.clear();
                pageStack.clear();
                pageStack.push("qrc:/CoordinatedBreathingPage.qml");
            }
        },
        Kirigami.Action {
            text: i18n("Box Breathing")
            icon.name: "media-playback-start-symbolic"
            onTriggered: {
                pageStack.layers.clear();
                pageStack.clear();
                pageStack.push("qrc:/BoxBreathingPage.qml");
            }
        },
        Kirigami.Action {
            text: i18n("Box Breathing (sleep)")
            icon.name: "media-playback-start-symbolic"
            onTriggered: {
                pageStack.layers.clear();
                pageStack.clear();
                pageStack.push("qrc:/BoxBreathingSleepPage.qml");
            }
        },
        Kirigami.Action {
            text: i18n("Resonant Breathing")
            icon.name: "media-playback-start-symbolic"
            onTriggered: {
                pageStack.layers.clear();
                pageStack.clear();
                pageStack.push("qrc:/ResonantBreathingPage.qml");
            }
        },
        Kirigami.Action {
            text: i18n("Nadi Shodhana")
            icon.name: "media-playback-start-symbolic"
            onTriggered: {
                pageStack.layers.clear();
                pageStack.clear();
                pageStack.push("qrc:/NadiShodhanaPage.qml");
            }
        },
        Kirigami.Action {
            text: i18n("Yogic Breathing")
            icon.name: "media-playback-start-symbolic"
            onTriggered: {
                pageStack.layers.clear();
                pageStack.clear();
                pageStack.push("qrc:/YogicBreathingPage.qml");
            }
        },
        Kirigami.Action {
            text: i18n("Settings")
            icon.name: "settings-configure"
            onTriggered: pageStack.layers.push("qrc:/SettingsPage.qml")
            enabled: pageStack.layers.currentItem.title !== i18n("Settings")
        },
        Kirigami.Action {
            text: i18n("About")
            icon.name: "help-about-symbolic"
            onTriggered: pageStack.layers.push(aboutPage)
            enabled: pageStack.layers.currentItem.title !== i18n("About")
        }
    ]
}
