import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.Portrait

    PageHeader {
        objectName: "pageHeader"
        title: qsTr("Classic Tetris")
        extraContent.children: [
            IconButton {
                objectName: "aboutButton"
                icon.source: "image://theme/icon-m-about"
                anchors.verticalCenter: parent.verticalCenter

                onClicked: pageStack.push(Qt.resolvedUrl("AboutPage.qml"))
            }
        ]
    }

    Label {
        objectName: "creatorName"
        anchors {
            left: parent.left;
            right: parent.right;
            bottom: parent.bottom;
            margins: Theme.horizontalPageMargin
        }
        color: palette.highlightColor
        font.pixelSize: Theme.fontSizeSmall
        textFormat: Text.Center
        wrapMode: Text.WordWrap
        text: "Created by alexbayker"
    }
}
