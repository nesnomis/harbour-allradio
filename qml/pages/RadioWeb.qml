import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    //allowedOrientations: Orientation.All
    property alias radioUrl: webView.url

    SilicaWebView {
        id: webView
        header: PageHeader { title: radioUrl }

        PullDownMenu {
            MenuItem {
                text: qsTr("Open in external browser")
                onClicked: Qt.openUrlExternally(radioUrl)
            }
        }

        experimental {
            transparentBackground: false;
            deviceWidth: Screen.width
            deviceHeight: Screen.height
            preferredMinimumContentsWidth: Screen.width
            userAgent:"Mozilla/5.0 (Maemo; Linux; U; Jolla; Sailfish; Mobile; rv:26.0) Gecko/26.0 Firefox/26.0 SailfishBrowser/1.0 like Safari/538.1"

            preferences {
                javascriptEnabled: true;
                cookiesEnabled: true;
                pluginsEnabled: false;
                offlineWebApplicationCacheEnabled: false;
                localStorageEnabled: true;
                xssAuditingEnabled: false;
                privateBrowsingEnabled: false;
                dnsPrefetchEnabled: false;
                navigatorQtObjectEnabled: true;
                developerExtrasEnabled: false;
                webGLEnabled: false;
                webAudioEnabled: false;
                caretBrowsingEnabled: false;
                notificationsEnabled: false;
            }
        }


        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
        url: "http://sailfishos.org"
    }
}
