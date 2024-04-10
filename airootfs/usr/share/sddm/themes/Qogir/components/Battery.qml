import QtQuick

import org.kde.plasma.core as PlasmaCore
import org.kde.plasma.components as PlasmaComponents
import org.kde.plasma.workspace.components as PW
import org.kde.plasma.plasma5support as Plasma5Support
import org.kde.kirigami as Kirigami

Row {
    spacing: Kirigami.Units.smallSpacing
    visible: pmSource.data["Battery"]["Has Cumulative"]

    Plasma5Support.DataSource {
        id: pmSource
        engine: "powermanagement"
        connectedSources: ["Battery", "AC Adapter"]
    }

    PW.BatteryIcon {
        id: battery
        hasBattery: pmSource.data["Battery"]["Has Battery"] || false
        percent: pmSource.data["Battery"]["Percent"] || 0
        pluggedIn: pmSource.data["AC Adapter"] ? pmSource.data["AC Adapter"]["Plugged in"] : false

        height: batteryLabel.height
        width: height
    }

    PlasmaComponents.Label {
        id: batteryLabel
        font.pointSize: config.fontSize
        height: undefined
        text: i18nd("plasma_lookandfeel_org.kde.lookandfeel","%1%", battery.percent)
        Accessible.name: i18nd("plasma_lookandfeel_org.kde.lookandfeel","Battery at %1%", battery.percent)
    }
}