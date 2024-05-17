// SPDX-FileCopyrightText: 2023 Plata Hill <plata.hill@kdemail.net>
// SPDX-License-Identifier: LGPL-2.1-or-later

import QtQuick
import QtQuick.Controls as Controls
import org.kde.kirigami as Kirigami

Kirigami.GlobalDrawer {
    isMenu: true
    actions: [
        Kirigami.Action {
            text: i18n("4-7-8 Breathing")
            icon.name: "media-playback-start-symbolic"
            onTriggered: {
                pageStack.layers.clear();
                pageStack.clear();
                pageStack.push("qrc:/qml/478BreathingPage.qml");
            }
        },
        Kirigami.Action {
            text: i18n("Coordinated Breathing")
            icon.name: "media-playback-start-symbolic"
            onTriggered: {
                pageStack.layers.clear();
                pageStack.clear();
                pageStack.push("qrc:/qml/CoordinatedBreathingPage.qml");
            }
        },
        Kirigami.Action {
            text: i18n("Box Breathing")
            icon.name: "media-playback-start-symbolic"
            onTriggered: {
                pageStack.layers.clear();
                pageStack.clear();
                pageStack.push("qrc:/qml/BoxBreathingPage.qml");
            }
        },
        Kirigami.Action {
            text: i18n("Box Breathing (sleep)")
            icon.name: "media-playback-start-symbolic"
            onTriggered: {
                pageStack.layers.clear();
                pageStack.clear();
                pageStack.push("qrc:/qml/BoxBreathingSleepPage.qml");
            }
        },
        Kirigami.Action {
            text: i18n("Resonant Breathing")
            icon.name: "media-playback-start-symbolic"
            onTriggered: {
                pageStack.layers.clear();
                pageStack.clear();
                pageStack.push("qrc:/qml/ResonantBreathingPage.qml");
            }
        },
        Kirigami.Action {
            text: i18n("Nadi Shodhana")
            icon.name: "media-playback-start-symbolic"
            onTriggered: {
                pageStack.layers.clear();
                pageStack.clear();
                pageStack.push("qrc:/qml/NadiShodhanaPage.qml");
            }
        },
        Kirigami.Action {
            text: i18n("Yogic Breathing")
            icon.name: "media-playback-start-symbolic"
            onTriggered: {
                pageStack.layers.clear();
                pageStack.clear();
                pageStack.push("qrc:/qml/YogicBreathingPage.qml");
            }
        },
        Kirigami.Action {
            text: i18n("Settings")
            icon.name: "settings-configure"
            onTriggered: pageStack.layers.push("qrc:/qml/SettingsPage.qml")
            enabled: pageStack.layers.currentItem.title !== i18n("Settings")
        },
        Kirigami.Action {
            text: i18n("About")
            icon.name: "help-about-symbolic"
            onTriggered: pageStack.layers.push(Qt.createComponent('org.kde.kirigamiaddons.formcard', 'AboutPage'))
            enabled: pageStack.layers.currentItem.title !== i18n("About")
        }
    ]
}
