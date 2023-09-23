
#THIS IS THE TEMPLATE FOR SCROLLING EFFECT...
class_name BaseScroll
#Got the blessing from the big guys...

#############################################
extends Control

#THIS IS FOR THE SCROLL EFFECTS
var scrollerContainer: ScrollContainer
var targetScroll = 0.0
var scrollStep = 600
var scrollWeight = 0.5


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#getting the Node by calling it through by get_node
	scrollerContainer = $Panel/ScrollContainer
	
	#This is for the popup
	if !has_user_signal('pressed'):
		
		$'.'.hide()
	else:
		$'.'.show()

# warning-ignore:unused_argument
func _process(delta: float) -> void:
	# Check if the ScrollContainer's content width is larger than its view width
	targetScroll = scrollerContainer.scroll_horizontal
	scrollerContainer.scroll_horizontal = lerp(scrollerContainer.scroll_horizontal, targetScroll, scrollWeight)
