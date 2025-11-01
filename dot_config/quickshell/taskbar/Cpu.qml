import QtQuick
import ".."
import Quickshell.Services.UPower 
import Quickshell.Io
Text {
    id: cpu
	text: {
		var device = UPower.displayDevice
		var text = "Cpu: " + Math.round(device.percentage * 100) + " % (" + Math.round(device.timeToEmpty / 60) + " minutes remaining)"
		return text
	}
    color: Config.colors.text
    font.pixelSize: Config.settings.bar.fontSize
    font.family: fontMonaco.name
    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter

    Process {
	    id: cpuProc
	    command: ["sh" , "-c","cat /proc/stat | grep cpu | head -1 | awk '{print ($5*100)/($2+$3+$4+$5+$6+$7+$8+$9+$10)}' | awk '{print 100-$1}' | awk -F. '{print $1}'"]
	    running: true
	    stdout: StdioCollector {
		    onStreamFinished: cpu.text = "Cpu: " + this.text + "%"
	    }
    }
    Timer {
        interval: 1000
	running: true
	repeat: true
	onTriggered: cpuProc.running = true
    }
    }
