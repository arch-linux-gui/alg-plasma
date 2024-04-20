import QtQuick

import org.kde.plasma.core as PlasmaCore
import org.kde.plasma.components as PlasmaComponents
import org.kde.kirigami as Kirigami

PlasmaComponents.ToolButton {
    id: root
    property int currentIndex: -1

    //implicitWidth: minimumWidth

    visible: menu.count > 1

    text: i18nd("plasma_lookandfeel_org.kde.lookandfeel", "Desktop Session: %1", instantiator.objectAt(currentIndex).text || "")

    font.pointSize: config.fontSize

    Component.onCompleted: {
        currentIndex = sessionModel.lastIndex
    }

    checkable: true
    checked: menu.opened
    onToggled: {
        if (checked) {
            menu.popup(root, 0, 0)
        } else {
            menu.dismiss()
        }
    }

    PlasmaComponents.Menu {
        Kirigami.Theme.colorSet: Kirigami.Theme.Window
        Kirigami.Theme.inherit: false

        id: menu
        Instantiator {
            id: instantiator
            model: sessionModel
            onObjectAdded: (index, object) => menu.insertItem(index, object)
            onObjectRemoved: (index, object) => menu.removeItem(object)
            delegate: PlasmaComponents.MenuItem {
                text: model.name
                onTriggered: {
                    root.currentIndex = model.index
                }
            }
        }
    }
}