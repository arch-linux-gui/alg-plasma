import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import org.kde.plasma.core
import org.kde.plasma.plasma5support as Plasma5Support
import org.kde.kirigami as Kirigami

ColumnLayout {
    readonly property bool softwareRendering: GraphicsInfo.api === GraphicsInfo.Software

    Label {
        text: Qt.formatTime(timeSource.data["Local"]["DateTime"])
        color: Kirigami.Theme.textColor
        style: softwareRendering ? Text.Outline : Text.Normal
        styleColor: softwareRendering ? Kirigami.Theme.backgroundColor : "transparent" //no outline, doesn't matter
        font.pointSize: 48
        Layout.alignment: Qt.AlignHCenter
    }
    Label {
        text: Qt.formatDate(timeSource.data["Local"]["DateTime"], Qt.DefaultLocaleLongDate)
        color: Kirigami.Theme.textColor
        style: softwareRendering ? Text.Outline : Text.Normal
        styleColor: softwareRendering ? Kirigami.Theme.backgroundColor : "transparent" //no outline, doesn't matter
        font.pointSize: 24
        Layout.alignment: Qt.AlignHCenter
    }
    Plasma5Support.DataSource {
        id: timeSource
        engine: "time"
        connectedSources: ["Local"]
        interval: 1000
    }
}