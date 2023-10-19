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
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQuickStyle>
#include <QString>

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
    QQuickStyle::setStyle(QStringLiteral("Material"));
#else
    QApplication app(argc, argv);
    if (qEnvironmentVariableIsEmpty("QT_QUICK_CONTROLS_STYLE")) {
        QQuickStyle::setStyle(QStringLiteral("org.kde.desktop"));
    }
#endif

#if HAVE_KCRASH
    KCrash::initialize();
#endif

    // about
    QCoreApplication::setOrganizationName(QStringLiteral("KDE"));
    QCoreApplication::setOrganizationDomain(QStringLiteral("kde.org"));
    QCoreApplication::setApplicationName(QStringLiteral("Kalm"));

    KLocalizedString::setApplicationDomain("kalm");

    const QString applicationDescription = i18n("Breathing techniques");

    KAboutData about(QStringLiteral("kalm"),
                     i18n("Kalm"),
                     QStringLiteral(KALM_VERSION_STRING),
                     applicationDescription,
                     KAboutLicense::GPL,
                     i18n("© 2023 KDE Community"));
    about.addAuthor("Plata Hill", QString(), QStringLiteral("plata.hill@kdemail.net"));
    KAboutData::setApplicationData(about);

    // command line parser
    QCommandLineParser parser;
    parser.setApplicationDescription(applicationDescription);
    parser.addHelpOption();
    parser.addVersionOption();
    parser.process(app);

    // setup engine
    QQmlApplicationEngine engine;
    engine.rootContext()->setContextObject(new KLocalizedContext(&engine));

    engine.rootContext()->setContextProperty(QStringLiteral("_aboutData"), QVariant::fromValue(about));

    engine.rootContext()->setContextProperty(QStringLiteral("_settings"), KalmSettings::self());

    QObject::connect(&app, &QCoreApplication::aboutToQuit, KalmSettings::self(), &KalmSettings::save);

    engine.load(QUrl(QStringLiteral("qrc:///main.qml")));

    if (engine.rootObjects().isEmpty()) {
        return -1;
    }

    return app.exec();
}
