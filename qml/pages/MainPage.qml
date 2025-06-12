import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.Portrait

    Button {
        id: resumeGameButton
        objectName: "resumeGameButton"
        anchors {
            horizontalCenter: parent.horizontalCenter
            bottom: startGameButton.top
            bottomMargin: 100
        }
        text: qsTr("#resumeGameText")
        onClicked: pageStack.push(Qt.resolvedUrl("GamingPage.qml"))
    }

    Button {
        id: startGameButton
        objectName: "startGameButton"
        anchors {
            verticalCenter: parent.verticalCenter
            horizontalCenter: parent.horizontalCenter
        }
        text: qsTr("#startGameText")
        onClicked: pageStack.push(Qt.resolvedUrl("GamingPage.qml"))
    }

    Button {
        id: recordsButton
        objectName: "recordsButton"
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: startGameButton.bottom
            topMargin: 100
        }
        text: qsTr("#recordsText")
        onClicked: pageStack.push(Qt.resolvedUrl("RecordsPage.qml"))
    }

    Label {
        id: creatorName
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
        horizontalAlignment: Text.AlignHCenter
        wrapMode: Text.WordWrap
        text: qsTr("#creatorTitle")
    }
}
