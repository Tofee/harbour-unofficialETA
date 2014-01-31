# The name of your app.
# NOTICE: name defined in TARGET has a corresponding QML filename.
#         If name defined in TARGET is changed, following needs to be
#         done to match new name:
#         - corresponding QML filename must be changed
#         - desktop icon filename must be changed
#         - desktop filename must be changed
#         - icon definition filename in desktop file must be changed
TARGET = harbour-unofficialETA

CONFIG += sailfishapp

SOURCES += src/harbour-unofficialETA.cpp

OTHER_FILES += qml/harbour-unofficialETA.qml \
    qml/cover/CoverPage.qml \
    qml/pages/FirstPage.qml \
    rpm/harbour-unofficialETA.spec \
    rpm/harbour-unofficialETA.yaml \
    harbour-unofficialETA.desktop \
    qml/js/timerLogic.js \
    qml/pages/JsonListModel.qml

