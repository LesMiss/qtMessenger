import QtQuick 2.15
import QtQuick.Controls 2.15
import "./allPages/regWindow"
import "./components"

Window {
    id: regWindow
    width: 580
    height: 420
    visible: true
    color: "#1a1a1a"

    title: qsTr("Liber")

    function loadPage(page) {
        switch (page) {
        case 'second':
            stackView.push(second, StackView.Transition)
            break;
        case 'third':
            stackView.push(third, StackView.Transition)
            break;
            //        case '3':
            //            stackView.push(second)
            //            break;
        }
    }

    Component {
        id: first
        FirsPage {}
    }
    Component {
        id: second
        SecondPage {}
    }

    Component {
        id: third
        ThirdPage {}
    }


    StackView {
        id: stackView
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 0
        anchors.topMargin: 0
        anchors.bottomMargin: 60
        anchors.rightMargin: 0
        initialItem: first

        pushEnter: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 0
                to:1
                duration: 200
            }
        }
        pushExit: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 1
                to:0
                duration: 200
            }
        }
        popEnter: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 0
                to:1
                duration: 200
            }
        }
        popExit: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 1
                to:0
                duration: 200
            }
        }
    }

    FontLoader {
        id: poppins_SemiBold
        source: "qrc:/fonts/Poppins/Poppins-SemiBold.ttf"
    }

    Rectangle {
        id: rectangle4
        y: 324
        width: 34
        height: 34
        color: "#1a1a1a"
        radius: 8
        border.color: "#545454"
        border.width: 1
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        Image {
            id: image2
            anchors.fill: parent
            source: "images/new svg/angle-left.svg"
            fillMode: Image.Pad

            MouseArea {
                id: mouseAreaBack
                anchors.fill: parent

                onClicked: {
                    console.log("back")
                    stackView.pop()
                }
            }
        }
        anchors.leftMargin: 20
        anchors.bottomMargin: 20
    }




    //    Component {
    //        id: second
    //    }

    //    Component {
    //        id: three
    //    }


    // Simple logic -->
    //    MainWindow {
    //        id: mainWindow
    //        visible: false
    //    }


    //    FileDialog {
    //        id: fileDialog
    //        selectedNameFilter.index: 1
    //        nameFilters: ["Image files (*.jpg *.jpeg *.png)"]
    //    }

    //    signal qmlReceive(string textIn)


    //    PropertyAnimation {
    //        id: colorAnimation
    //        target: rectangle1
    //        properties: "color"
    //        to: "#282a39"
    //        duration: 145
    //    }

    //    PropertyAnimation {
    //        id: colorAnimationReverse
    //        target: rectangle1
    //        properties: "color"
    //        to: "#16191c"
    //        duration: 145
    //    }

    //    // line
    //    PropertyAnimation {
    //        id: colorAnimationLine
    //        target: firstLine
    //        properties: "color"
    //        to: "#80D5AF"
    //        duration: 145
    //    }

    //    // Switcher

    //    Rectangle {
    //        id: rectangle3
    //        x: 487
    //        width: regWindow.width / 2
    //        color: "#1e2126"
    //        anchors.right: parent.right
    //        anchors.top: parent.top
    //        anchors.bottom: parent.bottom
    //    }



    //    Rectangle {
    //        id: rectangle4
    //        color: "#ffffff"
    //        anchors.fill: parent

    //        Rectangle {
    //            id: schema
    //            width: 290
    //            height: 56
    //            color: "#00ffffff"
    //            anchors.top: parent.top
    //            anchors.horizontalCenter: parent.horizontalCenter
    //            anchors.topMargin: 130

    //            Rectangle {
    //                id: switcher
    //                width:  290
    //                height: 34
    //                color: "#00ffffff"
    //                anchors.top: parent.top
    //                anchors.topMargin: 0
    //                anchors.horizontalCenter: parent.horizontalCenter

    //                Rectangle {
    //                    id: firstLine
    //                    width: 115
    //                    height: 1
    //                    color: "#bfbad9"
    //                    anchors.right: outCircleCenter.left
    //                    anchors.rightMargin: -2
    //                    anchors.verticalCenter: parent.verticalCenter
    //                }

    //                RegItem {
    //                    id: outCircleLeft
    //                    anchors.verticalCenter: parent.verticalCenter
    //                    anchors.right: firstLine.left
    //                    anchors.rightMargin: -2

    //                    // Action Change
    //                    outCircleColorChange: "#ffffff"
    //                    insideCircleColorChange: "#BFBAD9"
    //                }

    //                RegItem {
    //                    id: outCircleCenter
    //                    anchors.centerIn: parent
    //                    // State
    //                    outCircleStateColor: "#ffffff"
    //                    insideCircleStateColor: "#BFBAD9"
    //                    // Action Change
    //                    outCircleColorChange: "#6251e9"
    //                    insideCircleColorChange: "#ffffff"

    //                }

    //                Rectangle {
    //                    id: secondLine
    //                    width: 115
    //                    height: 1
    //                    color: "#bfbad9"
    //                    anchors.left: outCircleCenter.right
    //                    anchors.leftMargin: -2
    //                    anchors.verticalCenter: parent.verticalCenter
    //                }

    //                RegItem {
    //                    id: outCircleRight
    //                    anchors.verticalCenter: parent.verticalCenter
    //                    anchors.left: secondLine.right
    //                    anchors.leftMargin: -2
    //                    // State
    //                    outCircleStateColor: "#ffffff"
    //                    insideCircleStateColor: "#BFBAD9"
    //                    // Action Change
    //                    outCircleColorChange: "#6251e9"
    //                    insideCircleColorChange: "#ffffff"
    //                }
    //            }

    //            Label {
    //                id: label
    //                width: 9
    //                height: 13
    //                color: "#bfbad9"
    //                text: qsTr("Id")
    //                anchors.left: label2.right
    //                anchors.top: switcher.bottom
    //                anchors.leftMargin: 114
    //                anchors.topMargin: 0
    //                font.pointSize: 11
    //                font.styleName: "Medium"
    //                font.family: "YouTube Sans"
    //            }

    //            Label {
    //                id: label1
    //                width: 38
    //                height: 13
    //                color: "#6251e9"
    //                text: qsTr("Account")
    //                anchors.right: label2.left
    //                anchors.top: switcher.bottom
    //                anchors.rightMargin: 98
    //                anchors.topMargin: 0
    //                font.family: "YouTube Sans"
    //                font.styleName: "Medium"
    //                font.pointSize: 11
    //            }

    //            Label {
    //                id: label2
    //                width: 38
    //                height: 13
    //                color: "#bfbad9"
    //                text: qsTr("Security")
    //                anchors.top: switcher.bottom
    //                anchors.horizontalCenterOffset: -2
    //                anchors.horizontalCenter: parent.horizontalCenter
    //                anchors.topMargin: 0
    //                font.family: "YouTube Sans"
    //                font.styleName: "Medium"
    //                font.pointSize: 11
    //            }
    //        }

    //        Label {
    //            id: title
    //            y: 239
    //            width: 284
    //            height: 30
    //            color: "#282d71"
    //            text: qsTr("Create your account")
    //            anchors.left: parent.left
    //            anchors.top: schema.bottom
    //            font.letterSpacing: 0.5
    //            anchors.leftMargin: 120
    //            font.wordSpacing: 0
    //            anchors.topMargin: 50
    //            font.family: "YouTube Sans"
    //            font.styleName: "Medium"
    //            font.pointSize: 28
    //        }

    //        Label {
    //            id: nickLbl
    //            width: 50
    //            height: 14
    //            color: "#78789b"
    //            text: qsTr("Nickname")
    //            anchors.left: parent.left
    //            anchors.top: title.bottom
    //            font.letterSpacing: 0.5
    //            anchors.leftMargin: 120
    //            anchors.topMargin: 30
    //            font.family: "YouTube Sans"
    //            font.styleName: "Medium"
    //            font.pointSize: 11
    //            font.wordSpacing: 0
    //        }

    //        TextField {
    //            id: nickTf
    //            y: 315
    //            width: 280
    //            height: 35
    //            anchors.left: parent.left
    //            anchors.leftMargin: 120
    //            font.pointSize: 11
    //            leftPadding: 10
    //            topPadding: 10
    //            placeholderText: qsTr("Enter your nick")
    //            placeholderTextColor: "#ACACC6"

    //            background: Rectangle {
    //                color: "#ffffff"
    //                radius: 4
    //                border.width: 1
    //                border.color: "#D5D7EC"
    //            }
    //        }

    //        Rectangle {
    //            id: agreeBtn
    //            y: 356
    //            width: 20
    //            height: 20
    //            color: "#ffffff"
    //            radius: 4
    //            border.color: "#d5d7ec"
    //            border.width: 1
    //            anchors.left: parent.left
    //            anchors.leftMargin: 120
    //        }

    //        Label {
    //            id: describe
    //            y: 355
    //            width: 214
    //            height: 21
    //            color: "#d5d7ec"
    //            text: qsTr("By signing up, you agree privacy policy, user terms, and merchant agreement")
    //            anchors.left: agreeBtn.right
    //            anchors.top: nickTf.bottom
    //            font.letterSpacing: 0.5
    //            wrapMode: Text.WordWrap
    //            anchors.leftMargin: 5
    //            font.family: "YouTube Sans"
    //            font.styleName: "Medium"
    //            font.pointSize: 9
    //            font.wordSpacing: 0
    //            anchors.topMargin: 5
    //        }

    //        Rectangle {
    //            id: nextBtn
    //            width: 120
    //            height: 35
    //            radius: 10
    //            border.width: 1
    //            border.color: "#306FDB"
    //            anchors.left: parent.left
    //            anchors.top: describe.bottom
    //            anchors.topMargin: 25
    //            anchors.leftMargin: 120

    //            Label {
    //                id: nickLbl1
    //                width: 50
    //                height: 14
    //                color: "#78789b"
    //                text: qsTr("Next Step")
    //                anchors.verticalCenter: parent.verticalCenter
    //                font.letterSpacing: 0.5
    //                anchors.horizontalCenter: parent.horizontalCenter
    //                font.family: "YouTube Sans"
    //                font.styleName: "Medium"
    //                font.pointSize: 11
    //                font.wordSpacing: 0
    //            }

    //            MouseArea {
    //                id: mouseAreaNext
    //                anchors.fill: parent
    //                enabled: true

    //                onClicked: {
    //                    // first change colors
    //                    label1.color = "#61B48D"
    //                    outCircleLeft.insideCircleStateColor = "#61B48D"
    //                    outCircleLeft.outCircleStateColor = "#BAEAD5"
    //                    outCircleLeft.colorWidth = "#80D5AF"
    //                    colorAnimationLine.running = true

    //                    // second change colors
    //                    // State
    //                    outCircleCenter.outCircleStateColor = "#6251e9"
    //                    outCircleCenter.insideCircleStateColor = "#ffffff"
    //                    label2.color = "#6251e9"
    //                    // Action Change
    //                    //                    outCircleCenter.outCircleColorChange = "#6251e9"
    //                    //                    outCircleCenter.insideCircleColorChange = "#ffffff"
    //                }
    //            }
    //        }

    //        Label {
    //            id: nickLbl2
    //            x: 456
    //            y: 569
    //            width: 98
    //            height: 16
    //            color: "#b05d88"
    //            text: qsTr("Having problem?")
    //            anchors.right: parent.right
    //            anchors.bottom: parent.bottom
    //            font.letterSpacing: 0.5
    //            anchors.rightMargin: 46
    //            anchors.bottomMargin: 35
    //            font.family: "YouTube Sans"
    //            font.styleName: "Medium"
    //            font.pointSize: 13
    //            font.wordSpacing: 0
    //        }


    //        Rectangle {
    //            id: rectangle2
    //            width: 40
    //            height: 40
    //            color: "#000000"
    //            radius: 10
    //            anchors.left: parent.left
    //            anchors.top: parent.top
    //            anchors.topMargin: 35
    //            anchors.leftMargin: 45
    //        }

    //        Row {
    //            id: row
    //            x: 273
    //            width: 193
    //            height: 17
    //            anchors.right: parent.right
    //            anchors.top: parent.top
    //            anchors.rightMargin: 46
    //            anchors.topMargin: 35

    //            Label {
    //                id: nickLbl4
    //                width: 146
    //                height: 14
    //                color: "#78789b"
    //                text: qsTr("Already have an account?")
    //                anchors.right: nickLbl3.left
    //                font.letterSpacing: 0.5
    //                anchors.rightMargin: 25
    //                font.family: "YouTube Sans"
    //                font.styleName: "Medium"
    //                font.pointSize: 13
    //                font.wordSpacing: 0
    //            }

    //            Label {
    //                id: nickLbl3
    //                x: 481
    //                width: 42
    //                height: 14
    //                color: "#b05d88"
    //                text: qsTr("Sign In")
    //                anchors.right: parent.right
    //                font.letterSpacing: 0.5
    //                anchors.rightMargin: 0
    //                font.family: "YouTube Sans"
    //                font.styleName: "Medium"
    //                font.pointSize: 13
    //                font.wordSpacing: 0
    //            }
    //        }

    //        TextField {
    //            id: searchUsers3
    //            x: 802
    //            y: 205
    //            width: 232
    //            height: 43
    //            background: Rectangle {
    //                color: "#16191c"
    //                radius: 13
    //            }
    //            leftPadding: 17
    //            topPadding: 12
    //            placeholderText: qsTr("password")
    //            echoMode:TextInput.Password

    //        }

    //        TextField {
    //            id: searchUsers2
    //            x: 802
    //            y: 143
    //            width: 232
    //            height: 43
    //            background: Rectangle {
    //                color: "#16191c"
    //                radius: 13
    //            }
    //            leftPadding: 17
    //            topPadding: 12
    //            placeholderText: qsTr("profession")
    //        }

    //        TextField {
    //            id: searchUsers1
    //            x: 802
    //            y: 260
    //            width: 232
    //            height: 43
    //            anchors.top: nickTf.bottom
    //            anchors.topMargin: -73
    //            background: Rectangle {
    //                color: "#16191c"
    //                radius: 13
    //            }
    //            leftPadding: 17
    //            topPadding: 12
    //            placeholderText: qsTr("name")
    //        }

    //        TextField {
    //            id: searchUsers4
    //            x: 703
    //            y: 143
    //            width: 75
    //            height: 43
    //            anchors.left: nickTf.right
    //            anchors.leftMargin: 312
    //            leftPadding: 17
    //            placeholderText: qsTr("age")
    //            topPadding: 12
    //            background: Rectangle {
    //                color: "#16191c"
    //                radius: 13
    //            }
    //        }

    //        Rectangle {
    //            id: rectangle1
    //            x: 1238
    //            y: 205
    //            width: 50
    //            height: 50
    //            color: "#16191c"
    //            radius: rectangle1.width / 2
    //            anchors.horizontalCenterOffset: 428
    //            anchors.horizontalCenter: parent.horizontalCenter


    //            MouseArea {
    //                id: mouseArea
    //                anchors.fill: parent
    //                enabled: true
    //                hoverEnabled: true

    //                onEntered: {
    //                    colorAnimation.running = true
    //                }

    //                onExited: {
    //                    colorAnimationReverse.running = true
    //                }

    //                onClicked: {
    //                    console.log("was tap")
    //                    fileDialog.open()
    //                }
    //            }
    //        }

    //        Button {
    //            id: button
    //            text: qsTr("Send")

    //            signal infoClicked(string str, string str, string str, string str, string str)
    //            x: 890
    //            y: 326
    //            objectName: "InfoButton"

    //                onClicked: {
    //                    mainWindow.show()
    //                    infoClicked(nickTf.text, searchUsers1.text, searchUsers2.text, searchUsers3.text, searchUsers4.text)
    //                }
    //        }
    //    }







}


