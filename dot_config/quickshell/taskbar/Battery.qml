import QtQuick
import ".."
import Quickshell.Services.UPower 
Text {
	text: {
		var device = UPower.displayDevice
		var text = "Bat: " + Math.round(device.percentage * 100) + " % (" + Math.round(device.timeToEmpty / 60) + " minutes remaining)"
		return text
	}
    color: Config.colors.text
    font.pixelSize: Config.settings.bar.fontSize
    font.family: fontMonaco.name
    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter
    }
