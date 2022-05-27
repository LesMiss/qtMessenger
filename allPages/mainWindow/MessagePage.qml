import QtQuick 2.0
import QtQuick.Controls 6.2
import "../../components"
import Qt5Compat.GraphicalEffects

// My libraries -->
import TableView 1.0
import Messages 1.0

Item {
    id: messagePage
    width: 1100
    height: 800

    //    property string uid: ""

    Rectangle {
        id: rectangle
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom

        Rectangle {
            id: usrBack
            width: 320
            color: "#111111"
            anchors.left: parent.left
            anchors.top: topUsrMenu.bottom
            anchors.bottom: parent.bottom

            Label {
                id: name1
                x: 19
                y: -53
                color: "#666666"
                text: qsTr("CONVERSATIONS")
                anchors.left: usrIcon.right
                anchors.top: parent.top
                font.pointSize: 15
                anchors.leftMargin: 13
                font.styleName: "Medium"
                anchors.topMargin: 8
                font.family: "YouTube Sans"
            }


            //            ListView {
            //                                id: listView

            //                width: 180; height: 200

            //                Component {
            //                    id: contactsDelegate
            //                    Rectangle {
            //                        id: wrapper
            //                        width: 180
            //                        height: contactInfo.height
            //                        color: ListView.isCurrentItem ? "black" : "red"
            //                        Text {
            //                            id: contactInfo
            //                            text: name + ": " + number
            //                            color: wrapper.ListView.isCurrentItem ? "red" : "black"
            //                        }
            //                    }
            //                }

            //                model: ContactModel {}
            //                delegate: TableViewModel {}
            //                focus: true
            //            }

            ListView {
                id: listView
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: name1.bottom
                anchors.bottom: parent.bottom
                anchors.topMargin: 15
                model: TableViewModel {}
                delegate: nameDelegate
                focus: true

                Component {
                    id: nameDelegate
                    Item {
                        width: 320
                        height: 100
                        Row {
                            id: row1
                            spacing: 10
                            anchors.fill: parent

                            MouseArea {
                                id: usersMouseArea
                                anchors.fill: parent
                                enabled: true
                                hoverEnabled: true

                                onClicked: {
                                    listView.currentIndex = model.index
                                    //  Will be id in future
                                    //  uid = nameLabel.text
                                }
                            }

                            Rectangle {
                                id: back
                                width: 20
                                height: 20
                                color: listView.currentIndex ==  model.index ? "#1c1c1c" : "#111111"
                                anchors.fill: parent
                                 Behavior on color { ColorAnimation { duration: 400 }}

                            }
                            Rectangle {
                                id: leftBar
                                height: 100
                                width: listView.currentIndex ==  model.index ? 2 : 0
                                color: "#438DF7"
                                Behavior on width { NumberAnimation  { duration: 300 }}
                                anchors {
                                    left: parent.left
                                    top: parent.top
                                }
                            }

                            AvatarItem {
                                id: avaBack
                                circleWidth: 35
                                circleHeight: 35
                                sourceImg: model.avatar
                                width: 38
                                height: 38
                                anchors {
                                    left: parent.left
                                    leftMargin: 20
                                    top: parent.top
                                    topMargin: 12
                                }

                            }

                            Label {
                                id: nameLabel
                                text: model.name
                                //                                    text: "Garik Stepanyan" // custom
                                color: "#ffffff"
                                anchors.left: avaBack.right
                                anchors.leftMargin: 8
                                anchors.top: parent.top
                                anchors.topMargin: 12
                                font.pointSize: 16
                                font.styleName: "Medium"
                                font.family: "YouTube Sans"
                            }

                            Label {
                                id: professionLabel
                                text: model.avocation
                                color: "#666666"
                                //                                    text: "UI Designer" // custom
                                anchors.left: avaBack.right
                                anchors.leftMargin: 8
                                anchors.top: nameLabel.bottom
                                anchors.topMargin: 1
                                font.pointSize: 12
                                font.styleName: "Bold"
                                font.family: "YouTube Sans"
                            }

                            Label {
                                id: ageLabel
                                color: "#666666"
                                text: model.time
                                //                                    text: "2 years" // custom
                                anchors.left: professionLabel.right
                                anchors.leftMargin: 5
                                anchors.top: nameLabel.bottom
                                anchors.topMargin: 3
                                font.pointSize: 9
                                font.styleName: "Bold"
                                font.family: "YouTube Sans"
                            }

                            Label {
                                id: temOut
                                color: "#666666"
                                //                                    text: model.time
                                text: "4m" // custom
                                font.pointSize: 12
                                font.styleName: "Medium"
                                font.family: "YouTube Sans"
                                anchors {
                                    top: parent.top
                                    topMargin: 24
                                    right: parent.right
                                    rightMargin: 20
                                }
                            }

                            Label {
                                id: descriptionLabel
                                //                            text: model.name
                                height: 15
                                text: "Hello everybody, my name is Robert, i want to become programmer." // custom
                                color: "#BABABA"
                                font.pointSize: 13
                                font.styleName: "Medium"
                                font.family: "YouTube Sans"
                                wrapMode: Text.WordWrap
                                anchors {
                                    left: parent.left
                                    leftMargin: 20
                                    top: professionLabel.top
                                    topMargin: 25
                                    right: parent.right
                                    rightMargin: 20
                                }
                            }
                        }
                    }
                }

            }

        }

        Rectangle {
            id: mainBack
            color: "#16191c"
            anchors.left: usrBack.right
            anchors.right: parent.right
            anchors.top: topUsrMenu.bottom
            anchors.bottom: parent.bottom

            TextField {
                id: enterMessege
                height: 43
                anchors.left: parent.left
                anchors.right: sendBtn.left
                anchors.bottom: parent.bottom
                topPadding: 12
                anchors.leftMargin: 30
                anchors.rightMargin: 20
                anchors.bottomMargin: 30
                placeholderText: qsTr("Aa")
                background: Rectangle {
                    color: "#1E2126"
                    radius: 13
                }
                leftPadding: 17
            }

            Callback {
                id: callBack
            }

            Rectangle {
                id: sendBtn
                x: 714
                width: 43
                height: 43
                color: "#1e2126"
                radius: 15
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 30
                Image {
                    id: image
                    anchors.fill: parent
                    source: "qrc:/images/new svg/mouse.svg"
                    rotation: 0
                    fillMode: Image.Pad

                    MouseArea {
                        id: mouseArea
                        anchors.fill: parent
                        onClicked: callBack.sendMyMessage(enterMessege.text, uid)
                    }
                }
                anchors.rightMargin: 30
            }
        }

        Rectangle {
            id: topUsrMenu
            height: 70
            color: "#16191c"
            anchors.left: topMyMenu.right
            anchors.right: parent.right
            anchors.top: parent.top

            AvatarItem {
                id: usrIcon
                circleWidth: 50
                circleHeight: 50
                sourceImg: "qrc:/images/png/ui.jpeg"
                width: 50
                height: 50
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 10

            }

            Label {
                id: name
                color: "#c3c3c3"
                text: qsTr("Misha Sirotinskiy")
                anchors.left: usrIcon.right
                anchors.top: parent.top
                font.styleName: "Bold"
                font.pointSize: 14
                font.family: "YouTube Sans"
                anchors.leftMargin: 13
                anchors.topMargin: 17
            }

            Label {
                id: profession
                text: qsTr("UI Designer Helper")
                anchors.left: usrIcon1.right
                anchors.top: name.bottom
                font.pointSize: 14
                font.styleName: "Bold"
                font.family: "YouTube Sans"
                anchors.topMargin: 3
                anchors.leftMargin: 3
            }

            AvatarItem {
                id: usrIcon1
                sourceImg: "qrc:/images/png/up-arrow.png"
                width: 20
                height: 20
                anchors.left: usrIcon.right
                anchors.top: name.bottom
                anchors.topMargin: 2
                anchors.leftMargin: 13
                circleHeight: 20
                circleWidth: 20
            }

            DonateButton {
                id: donateButton
                width: 40
                height: 40
                sourceIcon: "qrc:/images/new svg/ellipsis-v.svg"
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 10
            }

            DonateButton {
                id: donateButton1
                width: 40
                height: 40
                sourceIcon: "qrc:/images/new svg/volume-up.svg"
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: donateButton.left
            }
        }

        Rectangle {
            id: topMyMenu
            width: 320
            height: 70
            color: "#111111"
            anchors.left: parent.left
            anchors.top: parent.top

            Label {
                id: myName
                x: 20
                width: 77
                height: 30
                text: qsTr("Liberty")
                anchors.verticalCenter: parent.verticalCenter
                anchors.leftMargin: 5
                anchors.left: myIcon.right
                anchors.verticalCenterOffset: 0
                font.family: "YouTube Sans"
                font.pointSize: 28
                font.styleName: "Medium"
            }

            DonateButton {
                id: donateButton2
                x: 272
                width: 40
                height: 40
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.topMargin: 15
                anchors.rightMargin: 8
                sourceIcon: "qrc:/images/svg/search.svg"
            }
        }
    }

    FontLoader {
        id: mont
        source: "qrc:/fonts/Mont/Mont-Bold.ttf"
    }
}
