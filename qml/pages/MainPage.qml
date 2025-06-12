import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.Portrait

    Button {
        objectName: "resumeGameButton"
        anchors.verticalCenter: parent.verticalCenter
        anchors.bottom: startGameName.top
        text: qsTr("#resumeGameText")

        onClicked: pageStack.push(Qt.resolvedUrl("GamingPage.qml"))
    }

    Button {
        objectName: "startGameButton"
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        text: qsTr("#startGameText")

        onClicked: pageStack.push(Qt.resolvedUrl("GamingPage.qml"))
    }

    Button {
        objectName: "recordsButton"
        anchors.verticalCenter: parent.verticalCenter
        anchors.top: startGameName.bottom
        text: qsTr("#recordsText")

        onClicked: pageStack.push(Qt.resolvedUrl("RecordsPage.qml"))
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
        horizontalAlignment: Text.AlignHCenter
        wrapMode: Text.WordWrap
        text: qsTr("#creatorTitle")
    }
}
