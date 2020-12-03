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
    qml/stations/france.json \
    qml/stations/albania.png \
    qml/stations/andorra.png \
    qml/stations/armenia.png \
    qml/stations/austria.png \
    qml/stations/azerbaijan.png \
    qml/stations/belarus.png \
    qml/stations/belgium.png \
    qml/stations/bosnia.png \
    qml/stations/bulgaria.png \
    qml/stations/croatia.png \
    qml/stations/cyprus.png \
    qml/stations/czech-republic.png \
    qml/stations/denmark.png \
    qml/stations/estonia.png \
    qml/stations/faroe.png \
    qml/stations/finland.png \
    qml/stations/france.png \
    qml/stations/georgia.png \
    qml/stations/germany.png \
    qml/stations/gibraltar.png \
    qml/stations/greece.png \
    qml/stations/hungary.png \
    qml/stations/iceland.png \
    qml/stations/ireland.png \
    qml/stations/italy.png \
    qml/stations/kosovo.png \
    qml/stations/latvia.png \
    qml/stations/liechtenstein.png \
    qml/stations/lithuania.png \
    qml/stations/luxembourg.png \
    qml/stations/macedonia.png \
    qml/stations/malta.png \
    qml/stations/moldova.png \
    qml/stations/monaco.png \
    qml/stations/montenegro.png \
    qml/stations/netherlands.png \
    qml/stations/norway.png \
    qml/stations/poland.png \
    qml/stations/portugal.png \
    qml/stations/romania.png \
    qml/stations/russia.png \
    qml/stations/serbia.png \
    qml/stations/slovakia.png \
    qml/stations/slovenia.png \
    qml/stations/spain.png \
    qml/stations/sweden.png \
    qml/stations/switzerland.png \
    qml/stations/turkey.png \
    qml/stations/uk.png \
    qml/stations/ukraine.png \
    qml/stations/vatican.png

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
TRANSLATIONS += translations/harbour-allradio-it.ts
TRANSLATIONS += translations/harbour-allradio-nl.ts
TRANSLATIONS += translations/harbour-allradio-es.ts
TRANSLATIONS += translations/harbour-allradio-ru.ts
TRANSLATIONS += translations/harbour-allradio-tr.ts

DISTFILES += \
    qml/pages/CountryNameModel.qml \
    qml/timepicker.png \
    qml/pages/Favorites.qml \
    qml/allradio-data/images/albania.png \
    qml/allradio-data/images/andorra.png \
    qml/allradio-data/images/armenia.png \
    qml/allradio-data/images/austria.png \
    qml/allradio-data/images/azerbaijan.png \
    qml/allradio-data/images/belarus.png \
    qml/allradio-data/images/belgium.png \
    qml/allradio-data/images/bosnia.png \
    qml/allradio-data/images/bulgaria.png \
    qml/allradio-data/images/croatia.png \
    qml/allradio-data/images/cyprus.png \
    qml/allradio-data/images/czech-republic.png \
    qml/allradio-data/images/denmark.png \
    qml/allradio-data/images/estonia.png \
    qml/allradio-data/images/faroe.png \
    qml/allradio-data/images/finland.png \
    qml/allradio-data/images/france.png \
    qml/allradio-data/images/georgia.png \
    qml/allradio-data/images/germany.png \
    qml/allradio-data/images/gibraltar.png \
    qml/allradio-data/images/greece.png \
    qml/allradio-data/images/harbour-allradio.png \
    qml/allradio-data/images/hungary.png \
    qml/allradio-data/images/iceland.png \
    qml/allradio-data/images/ireland.png \
    qml/allradio-data/images/italy.png \
    qml/allradio-data/images/kosovo.png \
    qml/allradio-data/images/latvia.png \
    qml/allradio-data/images/liechtenstein.png \
    qml/allradio-data/images/lithuania.png \
    qml/allradio-data/images/luxembourg.png \
    qml/allradio-data/images/macedonia.png \
    qml/allradio-data/images/malta.png \
    qml/allradio-data/images/moldova.png \
    qml/allradio-data/images/monaco.png \
    qml/allradio-data/images/montenegro.png \
    qml/allradio-data/images/netherlands.png \
    qml/allradio-data/images/norway.png \
    qml/allradio-data/images/poland.png \
    qml/allradio-data/images/portugal.png \
    qml/allradio-data/images/romania.png \
    qml/allradio-data/images/russia.png \
    qml/allradio-data/images/serbia.png \
    qml/allradio-data/images/slovakia.png \
    qml/allradio-data/images/slovenia.png \
    qml/allradio-data/images/spain.png \
    qml/allradio-data/images/sweden.png \
    qml/allradio-data/images/switzerland.png \
    qml/allradio-data/images/turkey.png \
    qml/allradio-data/images/uk.png \
    qml/allradio-data/images/ukraine.png \
    qml/allradio-data/images/vatican.png \
    qml/allradio-data/stations/albania.json \
    qml/allradio-data/stations/andorra.json \
    qml/allradio-data/stations/armenia.json \
    qml/allradio-data/stations/austria.json \
    qml/allradio-data/stations/azerbaijan.json \
    qml/allradio-data/stations/belarus.json \
    qml/allradio-data/stations/belgium.json \
    qml/allradio-data/stations/bosnia.json \
    qml/allradio-data/stations/bulgaria.json \
    qml/allradio-data/stations/croatia.json \
    qml/allradio-data/stations/cyprus.json \
    qml/allradio-data/stations/czech-republic.json \
    qml/allradio-data/stations/denmark.json \
    qml/allradio-data/stations/estonia.json \
    qml/allradio-data/stations/faroe.json \
    qml/allradio-data/stations/finland.json \
    qml/allradio-data/stations/france.json \
    qml/allradio-data/stations/georgia.json \
    qml/allradio-data/stations/germany.json \
    qml/allradio-data/stations/gibraltar.json \
    qml/allradio-data/stations/greece.json \
    qml/allradio-data/stations/hungary.json \
    qml/allradio-data/stations/iceland.json \
    qml/allradio-data/stations/ireland.json \
    qml/allradio-data/stations/italy.json \
    qml/allradio-data/stations/kosovo.json \
    qml/allradio-data/stations/latvia.json \
    qml/allradio-data/stations/liechtenstein.json \
    qml/allradio-data/stations/lithuania.json \
    qml/allradio-data/stations/luxembourg.json \
    qml/allradio-data/stations/macedonia.json \
    qml/allradio-data/stations/malta.json \
    qml/allradio-data/stations/moldova.json \
    qml/allradio-data/stations/monaco.json \
    qml/allradio-data/stations/montenegro.json \
    qml/allradio-data/stations/netherlands.json \
    qml/allradio-data/stations/norway.json \
    qml/allradio-data/stations/poland.json \
    qml/allradio-data/stations/portugal.json \
    qml/allradio-data/stations/romania.json \
    qml/allradio-data/stations/russia.json \
    qml/allradio-data/stations/serbia.json \
    qml/allradio-data/stations/slovakia.json \
    qml/allradio-data/stations/slovenia.json \
    qml/allradio-data/stations/spain.json \
    qml/allradio-data/stations/sweden.json \
    qml/allradio-data/stations/switzerland.json \
    qml/allradio-data/stations/turkey.json \
    qml/allradio-data/stations/uk.json \
    qml/allradio-data/stations/ukraine.json \
    qml/allradio-data/stations/vatican.json \
    qml/pages/AddOwnRadio.qml \
    qml/allradio-data/images/allradio.png \
    qml/allradio-data/images/bosnia and herzegovina.png \
    qml/allradio-data/images/algeria.png \
    qml/allradio-data/images/argentina.png \
    qml/allradio-data/images/australia.png \
    qml/allradio-data/images/bahamas.png \
    qml/allradio-data/images/brazil.png \
    qml/allradio-data/images/cape verde.png \
    qml/allradio-data/images/canada.png \
    qml/allradio-data/images/cameroun.png \
    qml/allradio-data/images/czech republic.png \
    qml/allradio-data/images/bosnia and herzegovina.png \
    qml/allradio-data/images/cape verde.png \
    qml/allradio-data/images/czech republic.png \
    qml/allradio-data/images/united kingdom \
    qml/pages/CountryModelCommunity.qml \
    qml/pages/CountryModel.qml \
    qml/allradio-data/images/bosnia and herzegovina.png \
    qml/allradio-data/images/cape verde.png \
    qml/allradio-data/images/czech republic.png \
    qml/allradio-data/images/united kingdom \
    qml/allradio-data/images/united kingdom.png \
    qml/allradio-data/images/bosnia and herzegovina.png \
    qml/allradio-data/images/cape verde.png \
    qml/allradio-data/images/chile.png \
    qml/allradio-data/images/colombia.png \
    qml/allradio-data/images/congo.png \
    qml/allradio-data/images/costa rica.png \
    qml/allradio-data/images/czech republic.png \
    qml/allradio-data/images/dominican republic.png \
    qml/allradio-data/images/ecuador.png \
    qml/allradio-data/images/egypt.png \
    qml/allradio-data/images/ghana.png \
    qml/allradio-data/images/guatemala.png \
    qml/allradio-data/images/guinea.png \
    qml/allradio-data/images/hong kong.png \
    qml/allradio-data/images/india.png \
    qml/allradio-data/images/united kingdom \
    qml/allradio-data/images/united kingdom.png \
    qml/allradio-data/images/bosnia and herzegovina.png \
    qml/allradio-data/images/cape verde.png \
    qml/allradio-data/images/costa rica.png \
    qml/allradio-data/images/czech republic.png \
    qml/allradio-data/images/dominican republic.png \
    qml/allradio-data/images/hong kong.png \
    qml/allradio-data/images/indonesia.png \
    qml/allradio-data/images/international.png \
    qml/allradio-data/images/iran.png \
    qml/allradio-data/images/united kingdom \
    qml/allradio-data/images/united kingdom.png \
    qml/allradio-data/images/bosnia and herzegovina.png \
    qml/allradio-data/images/cape verde.png \
    qml/allradio-data/images/costa rica.png \
    qml/allradio-data/images/czech republic.png \
    qml/allradio-data/images/dominican republic.png \
    qml/allradio-data/images/hong kong.png \
    qml/allradio-data/images/iraq.png \
    qml/allradio-data/images/israel.png \
    qml/allradio-data/images/japan.png \
    qml/allradio-data/images/jordan.png \
    qml/allradio-data/images/kenya.png \
    qml/allradio-data/images/kuwait.png \
    qml/allradio-data/images/madagascar.png \
    qml/allradio-data/images/mauritius.png \
    qml/allradio-data/images/mexico.png \
    qml/allradio-data/images/morocco.png \
    qml/allradio-data/images/namibia.png \
    qml/allradio-data/images/new zealand.png \
    qml/allradio-data/images/nicaragua.png \
    qml/allradio-data/images/palau.png \
    qml/allradio-data/images/peru.png \
    qml/allradio-data/images/phillipines.png \
    qml/allradio-data/images/puerto rico.png \
    qml/allradio-data/images/united kingdom \
    qml/allradio-data/images/united kingdom.png \
    qml/allradio-data/images/bosnia and herzegovina.png \
    qml/allradio-data/images/cape verde.png \
    qml/allradio-data/images/costa rica.png \
    qml/allradio-data/images/czech republic.png \
    qml/allradio-data/images/dominican republic.png \
    qml/allradio-data/images/hong kong.png \
    qml/allradio-data/images/new zealand.png \
    qml/allradio-data/images/philippines.png \
    qml/allradio-data/images/puerto rico.png \
    qml/allradio-data/images/united kingdom \
    qml/allradio-data/images/united kingdom.png \
    qml/allradio-data/images/bosnia and herzegovina.png \
    qml/allradio-data/images/cape verde.png \
    qml/allradio-data/images/costa rica.png \
    qml/allradio-data/images/czech republic.png \
    qml/allradio-data/images/dominican republic.png \
    qml/allradio-data/images/hong kong.png \
    qml/allradio-data/images/new zealand.png \
    qml/allradio-data/images/puerto rico.png \
    qml/allradio-data/images/saudi arabia.png \
    qml/allradio-data/images/scotland.png \
    qml/allradio-data/images/south africa.png \
    qml/allradio-data/images/suriname.png \
    qml/allradio-data/images/syria.png \
    qml/allradio-data/images/trinidad and tobago.png \
    qml/allradio-data/images/united arab emirates.png \
    qml/allradio-data/images/united kingdom \
    qml/allradio-data/images/united kingdom.png \
    qml/allradio-data/images/united states of america.png \
    qml/allradio-data/images/uruguay.png \
    qml/allradio-data/images/bosnia and herzegovina.png \
    qml/allradio-data/images/cape verde.png \
    qml/allradio-data/images/costa rica.png \
    qml/allradio-data/images/czech republic.png \
    qml/allradio-data/images/dominican republic.png \
    qml/allradio-data/images/hong kong.png \
    qml/allradio-data/images/new zealand.png \
    qml/allradio-data/images/puerto rico.png \
    qml/allradio-data/images/saudi arabia.png \
    qml/allradio-data/images/south africa.png \
    qml/allradio-data/images/trinidad and tobago.png \
    qml/allradio-data/images/tunisia.png \
    qml/allradio-data/images/united arab emirates.png \
    qml/allradio-data/images/united kingdom \
    qml/allradio-data/images/united kingdom.png \
    qml/allradio-data/images/united states of america.png \
    qml/allradio-data/images/venezuela.png \
    qml/allradio-data/images/yemen.png \
    qml/allradio-data/images/bosnia and herzegovina.png \
    qml/allradio-data/images/cape verde.png \
    qml/allradio-data/images/costa rica.png \
    qml/allradio-data/images/czech republic.png \
    qml/allradio-data/images/dominican republic.png \
    qml/allradio-data/images/hong kong.png \
    qml/allradio-data/images/new zealand.png \
    qml/allradio-data/images/puerto rico.png \
    qml/allradio-data/images/saudi arabia.png \
    qml/allradio-data/images/south africa.png \
    qml/allradio-data/images/trinidad and tobago.png \
    qml/allradio-data/images/united arab emirates.png \
    qml/allradio-data/images/united kingdom \
    qml/allradio-data/images/united kingdom.png \
    qml/allradio-data/images/united states of america.png \
    qml/JSONListModel/GetStationUrl.qml \
    qml/pages/Search.qml \
    qml/allradio-data/images/bosnia and herzegovina.png \
    qml/allradio-data/images/cape verde.png \
    qml/allradio-data/images/costa rica.png \
    qml/allradio-data/images/czech republic.png \
    qml/allradio-data/images/dominican republic.png \
    qml/allradio-data/images/hong kong.png \
    qml/allradio-data/images/new zealand.png \
    qml/allradio-data/images/puerto rico.png \
    qml/allradio-data/images/saudi arabia.png \
    qml/allradio-data/images/south africa.png \
    qml/allradio-data/images/trinidad and tobago.png \
    qml/allradio-data/images/united arab emirates.png \
    qml/allradio-data/images/united kingdom \
    qml/allradio-data/images/united kingdom.png \
    qml/allradio-data/images/united states of america.png \
    qml/allradio-data/images/bosnia and herzegovina.png \
    qml/allradio-data/images/cape verde.png \
    qml/allradio-data/images/costa rica.png \
    qml/allradio-data/images/czech republic.png \
    qml/allradio-data/images/dominican republic.png \
    qml/allradio-data/images/hong kong.png \
    qml/allradio-data/images/new zealand.png \
    qml/allradio-data/images/paraguay.png \
    qml/allradio-data/images/puerto rico.png \
    qml/allradio-data/images/saudi arabia.png \
    qml/allradio-data/images/south africa.png \
    qml/allradio-data/images/trinidad and tobago.png \
    qml/allradio-data/images/united arab emirates.png \
    qml/allradio-data/images/united kingdom \
    qml/allradio-data/images/united kingdom.png \
    qml/allradio-data/images/united states of america.png \
    qml/pages/Tags.qml \
    qml/allradio-data/images/bosnia and herzegovina.png \
    qml/allradio-data/images/cape verde.png \
    qml/allradio-data/images/costa rica.png \
    qml/allradio-data/images/czech republic.png \
    qml/allradio-data/images/dominican republic.png \
    qml/allradio-data/images/hong kong.png \
    qml/allradio-data/images/new zealand.png \
    qml/allradio-data/images/puerto rico.png \
    qml/allradio-data/images/saudi arabia.png \
    qml/allradio-data/images/south africa.png \
    qml/allradio-data/images/trinidad and tobago.png \
    qml/allradio-data/images/united arab emirates.png \
    qml/allradio-data/images/united kingdom \
    qml/allradio-data/images/united kingdom.png \
    qml/allradio-data/images/united states of america.png \
    qml/allradio-data/images/bosnia and herzegovina.png \
    qml/allradio-data/images/cape verde.png \
    qml/allradio-data/images/costa rica.png \
    qml/allradio-data/images/czech republic.png \
    qml/allradio-data/images/dominican republic.png \
    qml/allradio-data/images/hong kong.png \
    qml/allradio-data/images/new zealand.png \
    qml/allradio-data/images/puerto rico.png \
    qml/allradio-data/images/saudi arabia.png \
    qml/allradio-data/images/south africa.png \
    qml/allradio-data/images/trinidad and tobago.png \
    qml/allradio-data/images/united arab emirates.png \
    qml/allradio-data/images/united kingdom.png \
    qml/allradio-data/images/united states of america.png \
    qml/allradio-data/images/bosnia and herzegovina.png \
    qml/allradio-data/images/cape verde.png \
    qml/allradio-data/images/costa rica.png \
    qml/allradio-data/images/czech republic.png \
    qml/allradio-data/images/dominican republic.png \
    qml/allradio-data/images/hong kong.png \
    qml/allradio-data/images/new zealand.png \
    qml/allradio-data/images/puerto rico.png \
    qml/allradio-data/images/saudi arabia.png \
    qml/allradio-data/images/south africa.png \
    qml/allradio-data/images/trinidad and tobago.png \
    qml/allradio-data/images/united arab emirates.png \
    qml/allradio-data/images/united kingdom.png \
    qml/allradio-data/images/united states of america.png \
    qml/allradio-data/images/united kingdom.png \
    qml/allradio-data/images/albania.png \
    qml/allradio-data/images/algeria.png \
    qml/allradio-data/images/allradio.png \
    qml/allradio-data/images/andorra.png \
    qml/allradio-data/images/argentina.png \
    qml/allradio-data/images/armenia.png \
    qml/allradio-data/images/australia.png \
    qml/allradio-data/images/austria.png \
    qml/allradio-data/images/azerbaijan.png \
    qml/allradio-data/images/bahamas.png \
    qml/allradio-data/images/belarus.png \
    qml/allradio-data/images/belgium.png \
    qml/allradio-data/images/bosnia.png \
    qml/allradio-data/images/bosnia and herzegovina.png \
    qml/allradio-data/images/brazil.png \
    qml/allradio-data/images/bulgaria.png \
    qml/allradio-data/images/cameroun.png \
    qml/allradio-data/images/canada.png \
    qml/allradio-data/images/cape verde.png \
    qml/allradio-data/images/chile.png \
    qml/allradio-data/images/colombia.png \
    qml/allradio-data/images/congo.png \
    qml/allradio-data/images/costa rica.png \
    qml/allradio-data/images/croatia.png \
    qml/allradio-data/images/cyprus.png \
    qml/allradio-data/images/czech-republic.png \
    qml/allradio-data/images/czech republic.png \
    qml/allradio-data/images/denmark.png \
    qml/allradio-data/images/dominican republic.png \
    qml/allradio-data/images/ecuador.png \
    qml/allradio-data/images/egypt.png \
    qml/allradio-data/images/estonia.png \
    qml/allradio-data/images/faroe.png \
    qml/allradio-data/images/finland.png \
    qml/allradio-data/images/france.png \
    qml/allradio-data/images/georgia.png \
    qml/allradio-data/images/germany.png \
    qml/allradio-data/images/ghana.png \
    qml/allradio-data/images/gibraltar.png \
    qml/allradio-data/images/greece.png \
    qml/allradio-data/images/guatemala.png \
    qml/allradio-data/images/guinea.png \
    qml/allradio-data/images/harbour-allradio.png \
    qml/allradio-data/images/hong kong.png \
    qml/allradio-data/images/hungary.png \
    qml/allradio-data/images/iceland.png \
    qml/allradio-data/images/india.png \
    qml/allradio-data/images/indonesia.png \
    qml/allradio-data/images/international.png \
    qml/allradio-data/images/iran.png \
    qml/allradio-data/images/iraq.png \
    qml/allradio-data/images/ireland.png \
    qml/allradio-data/images/israel.png \
    qml/allradio-data/images/italy.png \
    qml/allradio-data/images/japan.png \
    qml/allradio-data/images/jordan.png \
    qml/allradio-data/images/kenya.png \
    qml/allradio-data/images/kosovo.png \
    qml/allradio-data/images/kuwait.png \
    qml/allradio-data/images/latvia.png \
    qml/allradio-data/images/liechtenstein.png \
    qml/allradio-data/images/lithuania.png \
    qml/allradio-data/images/luxembourg.png \
    qml/allradio-data/images/macedonia.png \
    qml/allradio-data/images/madagascar.png \
    qml/allradio-data/images/malta.png \
    qml/allradio-data/images/mauritius.png \
    qml/allradio-data/images/mexico.png \
    qml/allradio-data/images/moldova.png \
    qml/allradio-data/images/monaco.png \
    qml/allradio-data/images/montenegro.png \
    qml/allradio-data/images/morocco.png \
    qml/allradio-data/images/namibia.png \
    qml/allradio-data/images/netherlands.png \
    qml/allradio-data/images/new zealand.png \
    qml/allradio-data/images/nicaragua.png \
    qml/allradio-data/images/norway.png \
    qml/allradio-data/images/palau.png \
    qml/allradio-data/images/paraguay.png \
    qml/allradio-data/images/peru.png \
    qml/allradio-data/images/philippines.png \
    qml/allradio-data/images/poland.png \
    qml/allradio-data/images/portugal.png \
    qml/allradio-data/images/puerto rico.png \
    qml/allradio-data/images/romania.png \
    qml/allradio-data/images/russia.png \
    qml/allradio-data/images/saudi arabia.png \
    qml/allradio-data/images/scotland.png \
    qml/allradio-data/images/serbia.png \
    qml/allradio-data/images/slovakia.png \
    qml/allradio-data/images/slovenia.png \
    qml/allradio-data/images/south africa.png \
    qml/allradio-data/images/spain.png \
    qml/allradio-data/images/suriname.png \
    qml/allradio-data/images/sweden.png \
    qml/allradio-data/images/switzerland.png \
    qml/allradio-data/images/syria.png \
    qml/allradio-data/images/trinidad and tobago.png \
    qml/allradio-data/images/tunisia.png \
    qml/allradio-data/images/turkey.png \
    qml/allradio-data/images/uk.png \
    qml/allradio-data/images/ukraine.png \
    qml/allradio-data/images/united arab emirates.png \
    qml/allradio-data/images/united kingdom.png \
    qml/allradio-data/images/united states of america.png \
    qml/allradio-data/images/uruguay.png \
    qml/allradio-data/images/vatican.png \
    qml/allradio-data/images/venezuela.png \
    qml/allradio-data/images/yemen.png \
    qml/allradio-data/images/bosnia and herzegovina.png \
    qml/allradio-data/images/cape verde.png \
    qml/allradio-data/images/costa rica.png \
    qml/allradio-data/images/czech republic.png \
    qml/allradio-data/images/dominican republic.png \
    qml/allradio-data/images/hong kong.png \
    qml/allradio-data/images/new zealand.png \
    qml/allradio-data/images/puerto rico.png \
    qml/allradio-data/images/saudi arabia.png \
    qml/allradio-data/images/south africa.png \
    qml/allradio-data/images/trinidad and tobago.png \
    qml/allradio-data/images/united arab emirates.png \
    qml/allradio-data/images/united kingdom.png \
    qml/allradio-data/images/united states of america.png \
    README.md \
    qml/allradio-data/images/china.png \
    qml/pages/FindRadio.qml \
    qml/allradio-data/images/bosnia and herzegovina.png \
    qml/allradio-data/images/bycountry.png \
    qml/allradio-data/images/bylatest.png \
    qml/allradio-data/images/bysearch.png \
    qml/allradio-data/images/bytag.png \
    qml/allradio-data/images/byvote.png \
    qml/allradio-data/images/cape verde.png \
    qml/allradio-data/images/community.png \
    qml/allradio-data/images/costa rica.png \
    qml/allradio-data/images/czech republic.png \
    qml/allradio-data/images/dominican republic.png \
    qml/allradio-data/images/flattr.png \
    qml/allradio-data/images/gpl3.png \
    qml/allradio-data/images/hong kong.png \
    qml/allradio-data/images/lastplayed.png \
    qml/allradio-data/images/mit.png \
    qml/allradio-data/images/mostclicked.png \
    qml/allradio-data/images/new zealand.png \
    qml/allradio-data/images/no country.png \
    qml/allradio-data/images/paypal.png \
    qml/allradio-data/images/puerto rico.png \
    qml/allradio-data/images/saudi arabia.png \
    qml/allradio-data/images/south africa.png \
    qml/allradio-data/images/trinidad and tobago.png \
    qml/allradio-data/images/united arab emirates.png \
    qml/allradio-data/images/united kingdom.png \
    qml/allradio-data/images/united states of america.png \
    qml/allradio-data/images/bolivia.png \
    qml/allradio-data/images/thailand.png \
    qml/allradio-data/images/antigua & barbuda.png \
    qml/allradio-data/images/basque country.png \
    qml/allradio-data/images/benin.png \
    qml/allradio-data/images/bermuda.png \
    qml/allradio-data/images/bosnia and herzegovina.png \
    qml/allradio-data/images/brasil.png \
    qml/allradio-data/images/british virgin islands.png \
    qml/allradio-data/images/bycountry_t.png \
    qml/allradio-data/images/bylatest_t.png \
    qml/allradio-data/images/bysearch_t.png \
    qml/allradio-data/images/bytag_t.png \
    qml/allradio-data/images/byvote_t.png \
    qml/allradio-data/images/cape verde.png \
    qml/allradio-data/images/cayman islands.png \
    qml/allradio-data/images/costa rica.png \
    qml/allradio-data/images/cuba.png \
    qml/allradio-data/images/czech republic.png \
    qml/allradio-data/images/dominican republic.png \
    qml/allradio-data/images/europe.png \
    qml/allradio-data/images/faroe islands.png \
    qml/allradio-data/images/fiji.png \
    qml/allradio-data/images/galiza.png \
    qml/allradio-data/images/gambia.png \
    qml/allradio-data/images/greenland.png \
    qml/allradio-data/images/guyana.png \
    qml/allradio-data/images/hong kong.png \
    qml/allradio-data/images/internet.png \
    qml/allradio-data/images/isle of man.png \
    qml/allradio-data/images/ivory coast.png \
    qml/allradio-data/images/jamaica.png \
    qml/allradio-data/images/jersey.png \
    qml/allradio-data/images/lastplayed_t.png \
    qml/allradio-data/images/malaysia.png \
    qml/allradio-data/images/mostclicked_t.png \
    qml/allradio-data/images/nederland.png \
    qml/allradio-data/images/nepal.png \
    qml/allradio-data/images/new zealand.png \
    qml/allradio-data/images/nigeria.png \
    qml/allradio-data/images/no country.png \
    qml/allradio-data/images/northern ireland.png \
    qml/allradio-data/images/pakistan.png \
    qml/allradio-data/images/palestine.png \
    qml/allradio-data/images/panama.png \
    qml/allradio-data/images/polen.png \
    qml/allradio-data/images/puerto rico.png \
    qml/allradio-data/images/saint vincent and the grenadines.png \
    qml/allradio-data/images/saudi arabia.png \
    qml/allradio-data/images/singapore.png \
    qml/allradio-data/images/south africa.png \
    qml/allradio-data/images/south korea.png \
    qml/allradio-data/images/st. helena.png \
    qml/allradio-data/images/taiwan.png \
    qml/allradio-data/images/trinidad and tobago.png \
    qml/allradio-data/images/united arab emirates.png \
    qml/allradio-data/images/united kingdom.png \
    qml/allradio-data/images/united states of america.png \
    qml/allradio-data/images/antigua & barbuda.png \
    qml/allradio-data/images/basque country.png \
    qml/allradio-data/images/belize.png \
    qml/allradio-data/images/bosnia and herzegovina.png \
    qml/allradio-data/images/british virgin islands.png \
    qml/allradio-data/images/cambodia.png \
    qml/allradio-data/images/cape verde.png \
    qml/allradio-data/images/cayman islands.png \
    qml/allradio-data/images/costa rica.png \
    qml/allradio-data/images/czech republic.png \
    qml/allradio-data/images/dominican republic.png \
    qml/allradio-data/images/faroe islands.png \
    qml/allradio-data/images/haiti.png \
    qml/allradio-data/images/honduras.png \
    qml/allradio-data/images/hong kong.png \
    qml/allradio-data/images/isle of man.png \
    qml/allradio-data/images/ivory coast.png \
    qml/allradio-data/images/new zealand.png \
    qml/allradio-data/images/no country.png \
    qml/allradio-data/images/northern ireland.png \
    qml/allradio-data/images/puerto rico.png \
    qml/allradio-data/images/saint vincent and the grenadines.png \
    qml/allradio-data/images/saudi arabia.png \
    qml/allradio-data/images/south africa.png \
    qml/allradio-data/images/south korea.png \
    qml/allradio-data/images/st. helena.png \
    qml/allradio-data/images/tibet.png \
    qml/allradio-data/images/trinidad and tobago.png \
    qml/allradio-data/images/united arab emirates.png \
    qml/allradio-data/images/united kingdom.png \
    qml/allradio-data/images/united states of america.png \
    qml/allradio-data/images/afghanistan.png \
    qml/allradio-data/images/antigua & barbuda.png \
    qml/allradio-data/images/basque country.png \
    qml/allradio-data/images/bosnia and herzegovina.png \
    qml/allradio-data/images/botswana.png \
    qml/allradio-data/images/british virgin islands.png \
    qml/allradio-data/images/burkina faso.png \
    qml/allradio-data/images/cape verde.png \
    qml/allradio-data/images/cayman islands.png \
    qml/allradio-data/images/costa rica.png \
    qml/allradio-data/images/czech republic.png \
    qml/allradio-data/images/dominican republic.png \
    qml/allradio-data/images/ethiopia.png \
    qml/allradio-data/images/faroe islands.png \
    qml/allradio-data/images/hong kong.png \
    qml/allradio-data/images/isle of man.png \
    qml/allradio-data/images/ivory coast.png \
    qml/allradio-data/images/laos.png \
    qml/allradio-data/images/lebanon.png \
    qml/allradio-data/images/maurithania.png \
    qml/allradio-data/images/new zealand.png \
    qml/allradio-data/images/no country.png \
    qml/allradio-data/images/northern ireland.png \
    qml/allradio-data/images/puerto rico.png \
    qml/allradio-data/images/republic of san marino.png \
    qml/allradio-data/images/saint vincent and the grenadines.png \
    qml/allradio-data/images/saudi arabia.png \
    qml/allradio-data/images/south africa.png \
    qml/allradio-data/images/south korea.png \
    qml/allradio-data/images/sri lanka.png \
    qml/allradio-data/images/st. helena.png \
    qml/allradio-data/images/trinidad and tobago.png \
    qml/allradio-data/images/uganda.png \
    qml/allradio-data/images/united arab emirates.png \
    qml/allradio-data/images/united kingdom.png \
    qml/allradio-data/images/united states of america.png \
    qml/allradio-data/images/mauritania.png \
    translations/harbour-allradio-nl.ts \
    translations/harbour-allradio-it.ts

