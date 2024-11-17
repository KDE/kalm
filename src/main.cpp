// SPDX-FileCopyrightText: 2023 Plata Hill <plata.hill@kdemail.net>
// SPDX-License-Identifier: LGPL-2.1-or-later

#include "config-kalm.h"
#include "kalm-version.h"

#include "KalmSettings.h"

#include <KAboutData>
#if HAVE_KCRASH
#include <KCrash>
#endif
#include <KLocalizedContext>
#include <KLocalizedString>

#include <QCommandLineParser>
#include <QIcon>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQuickStyle>
#include <QString>
#include <QTimer>

#ifdef Q_OS_ANDROID
#include <QGuiApplication>
#else
#include <QApplication>
#endif

#ifdef Q_OS_ANDROID
Q_DECL_EXPORT
#endif

int main(int argc, char *argv[])
{
#ifdef Q_OS_ANDROID
    QGuiApplication app(argc, argv);
    QQuickStyle::setStyle(QStringLiteral("org.kde.breeze"));
#else
    QApplication app(argc, argv);
    if (qEnvironmentVariableIsEmpty("QT_QUICK_CONTROLS_STYLE")) {
        QQuickStyle::setStyle(QStringLiteral("org.kde.desktop"));
    }
#endif

#if HAVE_KCRASH
    KCrash::initialize();
#endif

    KLocalizedString::setApplicationDomain("kalm");

    // about
    const QString applicationDescription = i18n("Breathing techniques");

    KAboutData about(QStringLiteral("kalm"),
                     i18n("Kalm"),
                     QStringLiteral(KALM_VERSION_STRING),
                     applicationDescription,
                     KAboutLicense::LGPL_V2_1,
                     i18n("© 2023 KDE Community"));
    about.addAuthor(QStringLiteral("Plata Hill"), QString(), QStringLiteral("plata.hill@kdemail.net"));
    KAboutData::setApplicationData(about);

    QGuiApplication::setWindowIcon(QIcon::fromTheme(QStringLiteral("org.kde.kalm")));

    // command line parser
    QCommandLineParser parser;

    QCommandLineOption selfTestOpt(QStringLiteral("self-test"), QStringLiteral("internal, for automated testing"));
    parser.addOption(selfTestOpt);

    about.setupCommandLine(&parser);
    parser.process(app);
    about.processCommandLine(&parser);

    // setup engine
    QQmlApplicationEngine engine;
    engine.rootContext()->setContextObject(new KLocalizedContext(&engine));

    QObject::connect(&app, &QCoreApplication::aboutToQuit, KalmSettings::self(), &KalmSettings::save);

    engine.load(QUrl(QStringLiteral("qrc:/qml/main.qml")));

    if (engine.rootObjects().isEmpty()) {
        return -1;
    }

    if (parser.isSet(selfTestOpt)) {
        QTimer::singleShot(std::chrono::milliseconds(250), &app, &QCoreApplication::quit);
    }

    return app.exec();
}
