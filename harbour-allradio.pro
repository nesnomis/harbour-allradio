# NOTICE:
#
# Application name defined in TARGET has a corresponding QML filename.
# If name defined in TARGET is changed, the following needs to be done
# to match new name:
#   - corresponding QML filename must be changed
#   - desktop icon filename must be changed
#   - desktop filename must be changed
#   - icon definition filename in desktop file must be changed
#   - translation filenames have to be changed

# The name of your application
TARGET = harbour-allradio

CONFIG += sailfishapp

SOURCES += src/harbour-allradio.cpp

OTHER_FILES += qml/harbour-allradio.qml \
    qml/cover/CoverPage.qml \
    rpm/harbour-allradio.changes.in \
    rpm/harbour-allradio.spec \
    rpm/harbour-allradio.yaml \
    translations/*.ts \
    harbour-allradio.desktop \
    qml/Denmark.png \
    qml/Finland.png \
    qml/harbour-nettiradio-DK.png \
    qml/Norway.png \
    qml/Sweden.png \
    qml/pages/About.qml \
    qml/pages/CountryChooser.qml \
    qml/pages/Help.qml \
    qml/pages/RadioPlayer.qml \
    qml/stations/StationsListFI.qml \
    qml/stations/StationsListNO.qml \
    qml/stations/StationsListSV.qml \
    qml/pages/RadioWeb.qml \
    qml/js/favorites.js \
    qml/stations/StationsListUK.qml \
    qml/stations/StationsListGE.qml \
    qml/stations/StationsListDK.qml \
    qml/js/stream.js \
    qml/stations/StationsListSP.qml \
    qml/stations/StationsListRU.qml \
    qml/pages/Debug.qml \
    qml/pages/PullMenu.qml \
    qml/stations/StationsLisBS.qml \
    qml/stations/StationsLisAZ.qml \
    qml/stations/StationsLisAR.qml \
    qml/stations/StationsLisAN.qml \
    qml/stations/StationsLisAU.qml \
    qml/stations/StationsListAR.qml \
    qml/stations/StationsListAN.qml \
    qml/stations/StationsListAL.qml \
    qml/stations/StationsListBE.qml \
    qml/stations/Denmark.qml \
    qml/stations/Finland.qml \
    qml/stations/Germany.qml \
    qml/stations/Norway.qml \
    qml/stations/Russia.qml \
    qml/stations/Spain.qml \
    qml/stations/Sweden.qml \
    qml/stations/UK.qml \
    qml/stations/Vatican.qml \
    qml/stations/Ukraine.qml \
    qml/stations/Turkey.qml \
    qml/stations/Switzerland.qml \
    qml/stations/Slovenia.qml \
    qml/stations/Slovakia.qml \
    qml/stations/Serbia.qml \
    qml/stations/Romania.qml \
    qml/stations/Portugal.qml \
    qml/stations/Poland.qml \
    qml/stations/Netherlands.qml \
    qml/stations/Montenegro.qml \
    qml/stations/Monaco.qml \
    qml/stations/Moldova.qml \
    qml/stations/Malta.qml \
    qml/stations/Macedonia.qml \
    qml/stations/Luxembourg.qml \
    qml/stations/Lithuania.qml \
    qml/stations/Liechtenstein.qml \
    qml/stations/Latvia.qml \
    qml/stations/Italy.qml \
    qml/stations/Ireland.qml \
    qml/stations/Iceland.qml \
    qml/stations/Hungary.qml \
    qml/stations/Greece.qml \
    qml/stations/Gibraltar.qml \
    qml/stations/Georgia.qml \
    qml/stations/France.qml \
    qml/stations/Faroe.qml \
    qml/stations/Estonia.qml \
    qml/stations/Czechrepublic.qml \
    qml/stations/Cyprus.qml \
    qml/stations/Croatia.qml \
    qml/stations/Bulgaria.qml \
    qml/stations/Bosnia.qml \
    qml/stations/Belgium.qml \
    qml/stations/Belarus.qml \
    qml/stations/Azerbaijan.qml \
    qml/stations/Austria.qml \
    qml/stations/Armenia.qml \
    qml/stations/Andorra.qml \
    qml/stations/Albania.qml \
    qml/pages/SleepTimerPage.qml \
    qml/pages/PlayerPanel.qml \
    qml/pages/ValuePicker.qml

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n

# German translation is enabled as an example. If you aren't
# planning to localize your app, remember to comment out the
# following TRANSLATIONS line. And also do not forget to
# modify the localized app name in the the .desktop file.
TRANSLATIONS += translations/harbour-allradio-de.ts

