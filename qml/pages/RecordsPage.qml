import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: parentLayout
    objectName: "recordsPage"
    allowedOrientations: Orientation.Portrait

    Rectangle {
        id: backgroundGradient
        width: parentLayout.width;
        height: parentLayout.height
        //rotation: 225
        gradient: Gradient {
            GradientStop {
                position: 0.0;
                color: "#000000"
            }
            GradientStop {
                position: 1.0;
                color: "#007AFE"
            }
        }
    }
}
