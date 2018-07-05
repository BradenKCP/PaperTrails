extends Label

var eventCount = 0

func _input(event):
	eventCount += 1
	self.set_text(str(eventCount))
	