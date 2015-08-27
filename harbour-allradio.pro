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

# App version
DEFINES += APP_VERSION=\"\\\"$${VERSION}\\\"\"

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
    qml/pages/ValuePicker.qml \
    translations/harbour-allradio-da.ts \
    translations/harbour-allradio-en.ts \
    translations/harbour-allradio-sv.ts \
    qml/harbour-allradio.png \
    qml/stations/Vatican.png \
    qml/stations/Ukraine.png \
    qml/stations/UK.png \
    qml/stations/Turkey.png \
    qml/stations/Switzerland.png \
    qml/stations/Sweden.png \
    qml/stations/Spain.png \
    qml/stations/Slovenia.png \
    qml/stations/Slovakia.png \
    qml/stations/Serbia.png \
    qml/stations/Russia.png \
    qml/stations/Romania.png \
    qml/stations/Portugal.png \
    qml/stations/Poland.png \
    qml/stations/Norway.png \
    qml/stations/Netherlands.png \
    qml/stations/Montenegro.png \
    qml/stations/Monaco.png \
    qml/stations/Moldova.png \
    qml/stations/Malta.png \
    qml/stations/Macedonia.png \
    qml/stations/Luxembourg.png \
    qml/stations/Lithuania.png \
    qml/stations/Liechtenstein.png \
    qml/stations/Latvia.png \
    qml/stations/Italy.png \
    qml/stations/Ireland.png \
    qml/stations/Iceland.png \
    qml/stations/Hungary.png \
    qml/stations/harbour-allradio.png \
    qml/stations/Greece.png \
    qml/stations/Gibraltar.png \
    qml/stations/Germany.png \
    qml/stations/Georgia.png \
    qml/stations/France.png \
    qml/stations/Finland.png \
    qml/stations/Faroe.png \
    qml/stations/Estonia.png \
    qml/stations/Denmark.png \
    qml/stations/Czechrepublic.png \
    qml/stations/Cyprus.png \
    qml/stations/Croatia.png \
    qml/stations/Bulgaria.png \
    qml/stations/Bosnia.png \
    qml/stations/Belgium.png \
    qml/stations/Belarus.png \
    qml/stations/Azerbaijan.png \
    qml/stations/Austria.png \
    qml/stations/Armenia.png \
    qml/stations/Andorra.png \
    qml/stations/Albania.png \
    qml/stations/Kosovo.qml \
    qml/stations/Kosovo.png \
    qml/JSONListModel/jsonpath.js \
    qml/JSONListModel/jsonData.json \
    qml/JSONListModel/JSONListModel.qml \
    qml/JSONListModel/example.qml \
    qml/JSONListModel/JSONListModel.qmlproject \
    qml/JSONListModel/jsonData.txt \
    qml/JSONListModel/README \
    qml/JSONListModel/LICENSE \
    qml/js/jsonpath.js \
    qml/stations/vatican.json \
    qml/stations/ukraine.json \
    qml/stations/uk.json \
    qml/stations/turkey.json \
    qml/stations/switzerland.json \
    qml/stations/sweden.json \
    qml/stations/spain.json \
    qml/stations/slovenia.json \
    qml/stations/slovakia.json \
    qml/stations/serbia.json \
    qml/stations/russia.json \
    qml/stations/romania.json \
    qml/stations/portugal.json \
    qml/stations/poland.json \
    qml/stations/norway.json \
    qml/stations/netherlands.json \
    qml/stations/montenegro.json \
    qml/stations/monaco.json \
    qml/stations/moldova.json \
    qml/stations/malta.json \
    qml/stations/macedonia.json \
    qml/stations/luxembourg.json \
    qml/stations/lithuania.json \
    qml/stations/liechtenstein.json \
    qml/stations/latvia.json \
    qml/stations/kosovo.json \
    qml/stations/italy.json \
    qml/stations/ireland.json \
    qml/stations/iceland.json \
    qml/stations/hungary.json \
    qml/stations/greece.json \
    qml/stations/gibraltar.json \
    qml/stations/germany.json \
    qml/stations/georgia.json \
    qml/stations/finland.json \
    qml/stations/faroe.json \
    qml/stations/estonia.json \
    qml/stations/denmark.json \
    qml/stations/czech-republic.json \
    qml/stations/cyprus.json \
    qml/stations/croatia.json \
    qml/stations/bulgaria.json \
    qml/stations/bosnia.json \
    qml/stations/belgium.json \
    qml/stations/belarus.json \
    qml/stations/azerbaijan.json \
    qml/stations/austria.json \
    qml/stations/armenia.json \
    qml/stations/andorra.json \
    qml/stations/albania.json \
    qml/pages/CountryModel.qml \
    qml/stations/france.json

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n

# German translation is enabled as an example. If you aren't
# planning to localize your app, remember to comment out the
# following TRANSLATIONS line. And also do not forget to
# modify the localized app name in the the .desktop file.
#TRANSLATIONS += translations/harbour-allradio-en.ts
TRANSLATIONS += translations/harbour-allradio-da.ts
TRANSLATIONS += translations/harbour-allradio-sv.ts

