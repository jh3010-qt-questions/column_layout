import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Window {
  id: theWindow

  width: 640
  height: 480
  visible: true
  title: qsTr("Hello World")

  property alias itemACheck: itemACheck
  property alias itemBCheck: itemBCheck
  property alias itemCCheck: itemCCheck

  property alias itemALabel: itemALabel
  property alias itemBLabel: itemBLabel
  property alias itemCLabel: itemCLabel

  property string checkMark: "✔︎"

  Column {
      id: itemList

      anchors.verticalCenter: parent.verticalCenter
      anchors.horizontalCenter: parent.horizontalCenter

      spacing: 8

      TextMetrics {
          id: metrics

          font: itemCLabel.font
          text: itemCLabel.text

          Component.onCompleted:
          {
            var maxHeight = itemCCheck.height;
            var maxWidth  = theWindow.width * .75;

            while( metrics.width > maxWidth || metrics.height > maxHeight )
            {
              itemCLabel.font.pointSize = itemCLabel.font.pointSize - 1;
            }

            itemCLabel.width = metrics.width;
            itemC.width      = metrics.width + 50 + 8;

            itemALabel.width = itemCLabel.width;
            itemA.width      = itemC.width;

            itemBLabel.width = itemCLabel.width;
            itemB.width      = itemC.width;

            itemALabel.font.pointSize = itemCLabel.font.pointSize;
            itemBLabel.font.pointSize = itemCLabel.font.pointSize;
          }
      }

      Rectangle {
          id: itemA
          color: "#33666666"
          height: 50
          width: theWindow.width * .75

          Label {
              id: itemACheck
              color: "#000000"
              text: theWindow.checkMark

              width: parent.height
              height: parent.height

              horizontalAlignment: Text.AlignLeft
              verticalAlignment: Text.AlignVCenter
              font.bold: true

              font.pointSize: 100
              fontSizeMode: Text.Fit
              minimumPointSize: 10
          }

          Label {
              id: itemALabel

              height: parent.height
              width: 200

              text: qsTr("Short")
              font.pointSize: 24

              verticalAlignment: Text.AlignVCenter

              anchors.top: itemACheck.top
              anchors.left: itemACheck.right
              anchors.leftMargin: 8
          }
      }

      Rectangle {
          id: itemB
          color: "#33666666"
          height: 50
          width: theWindow.width * .75

          Label {
              id: itemBCheck
              color: "#000000"
              text: theWindow.checkMark

              width: parent.height
              height: parent.height

              horizontalAlignment: Text.AlignLeft
              verticalAlignment: Text.AlignVCenter
              font.bold: true

              font.pointSize: 100
              fontSizeMode: Text.Fit
              minimumPointSize: 10
          }

          Label {
              id: itemBLabel

              height: parent.height

              text: qsTr("A longer")
              font.pointSize: 24

              verticalAlignment: Text.AlignVCenter

              anchors.top: itemBCheck.top
              anchors.left: itemBCheck.right
              anchors.leftMargin: 8
          }
      }

      Rectangle {
          id: itemC
          color: "#33666666"
          height: 50
          width: theWindow.width * .75

          Label {
              id: itemCCheck
              color: "#000000"
              text: theWindow.checkMark

              width: parent.height
              height: parent.height

              horizontalAlignment: Text.AlignLeft
              verticalAlignment: Text.AlignVCenter
              font.bold: true

              font.pointSize: 100
              fontSizeMode: Text.Fit
              minimumPointSize: 10
          }

          Label {
              id: itemCLabel

              height: parent.height
              width: parent.width - itemCCheck.width - 8

              text: qsTr("A Little Bit longer")
              font.pointSize: 50

              verticalAlignment: Text.AlignVCenter

              anchors.top: itemCCheck.top
              anchors.left: itemCCheck.right
              anchors.leftMargin: 8
          }
      }
  }

  Button {
    text: "push me"

    onClicked: {
      console.log( "clicked" );
      console.log( itemACheck.font.pointSize );
    }
  }

}
