extends Control

#For the Progress Bar
var progress_bar
var current_progress
var target_progress
var loading_speed = 6.1

#For the Spinning Gear
var speed = 500
# Speed of the rotation
var angular_speed = PI
# Angular speed of one full rotation per second
var spinGear
var spinGear0
#SpinGears variables
#-----------------------------

#For the Dot Animation
var dotCount: int = 1
var maxDots: int = 5

#For the sprite fadeBlack
var blackSprite
var blackTween

#This is for the First Run File Creation 
const CONFIG_FILE_PATH = "user://settings/first_run.gmd"
var isFirstRun = true
#End of the FRFC

# Called when the node enters the scene tree for the first time.
func _ready():
	#Handles the Progress bar animation
	progress_bar = $'%loadingBar'
	current_progress = 0.0
	target_progress = 100.0
	
	#Handles the Spinning Gear animation
	spinGear = $MainPanel/Node2D/SpinGear
	spinGear0 = $MainPanel/Node2D/SpinGear2
	angular_speed = PI
	#Handles the DotAnimation
	startDotAnimations()
	#Handles the Transition to compatScene & mainMenuScene
	blackSprite = $blackFade
	#Handles the First Run Logic
	isFirstTime()
	#Plays the Idle music
	IdleMenuPlayer.play()


func _on_loadingBar_value_changed(value: float) -> void:
	# Get the integer value of the progress bar
	var progress_value = int(value + 0.5)

	# Set the text of the label to the integer value of the progress bar
	$'%percent'.text = str(progress_value) + "/100"
	$'%percent0'.text = str(progress_value) + "/100"
	
####################################################

#For the Progress Bar
func _process(delta):
	# Update the progress bar's value smoothly as it reaches the target progress
	if current_progress < target_progress:
		current_progress += loading_speed * delta
		current_progress = clamp(current_progress, 0.0, 100.0)
		progress_bar.value = current_progress
	
		
		#FOR GEAR sprite Animation
		#Rotate the gear sprite
		spinGear.rotation += angular_speed * delta
		spinGear0.rotation -= angular_speed * delta
		###########################################
	
	else:
		# Loading completed, perform checks and redirect as needed
		if current_progress >= 100.0:
			
			# Check for compatibility or any other conditions here
			var is_compatible = check_compatibility()
			if is_compatible:
				blackTween = create_tween().set_trans(Tween.TRANS_LINEAR)
				blackTween.tween_property(blackSprite, "scale",
				Vector2(1.3, 1.3), 2.5).set_ease(Tween.EASE_OUT)
				blackTween.tween_interval(0.9)
				#Creates a delay 1.3s
				yield(blackTween,"finished")
				goto_main_menu()
				IdleMenuPlayer.stop()
				
			else:
				blackTween = create_tween().set_trans(Tween.TRANS_LINEAR)
				blackTween.tween_property(blackSprite, "scale",
				Vector2(1.3, 1.3), 2.5).set_ease(Tween.EASE_OUT)
				blackTween.tween_interval(0.9)
				#Creates a delay 1.3s
				yield(blackTween,"finished")
				goto_compatibility_warning()
			
			
#For the Compatibility Check
func check_compatibility():
	var os_name = OS.get_name()
	
	#This is for the when the game detects its Windows/Android
	if os_name == "Android":
		var api_level = OS.get_android_api_level()
		#This is for the Android, the game is only runnable in Android 6
		# Check if the API level is less than or equal to 23
		if api_level == 23 or api_level >= 23:
			# The device is equal to Android 6 or above
			return false
			
		else:
			# The device is lower than android 6
			return true # Add this line
		
	elif os_name == "OSX" or os_name == "Windows":
		#This is macOS|Windows
		#This is for debugging only and sets the limitation of the device
		#print("This is macOS or Windows")
		return false
	
	else:
		#Neither Android|Windows|macOS
		#print("Not Windows|Android|macOS")
		#put to true for debug
		return false


#isCompatible redirects to MainMenu
func goto_main_menu():
	# Implement the code to load your main menu scene here
	#Instantiate NextLoad
	var _nextLoad = get_tree().change_scene("res://Scenes/MainMenu.tscn")
	print("Main Menu")


#isNotCompatible shows CompatWarn
func goto_compatibility_warning():
	# Implement the code to load the compatibility warning scene here
	var loadCompat = $PopupDialog
	loadCompat.popup_centered()

#Executor of Dot Animation
func startDotAnimations():
	var timer = Timer.new()
	timer.wait_time = 0.3
	# Adjust this value to control the speed of the animation
	timer.one_shot = false
	timer.connect("timeout", self, "_on_dot_animation")
	add_child(timer)
	timer.start()
	
#Handles the Dot Animation
func _on_dot_animation():
	if dotCount < maxDots:
		$"%LoadingLabel".text += "."
		$"%LoadingLabel2".text += "."
		# Add a dot to the text
		dotCount += 1
	elif dotCount == maxDots:
		var loadingText = tr("Loading Game")
		$"%LoadingLabel".text = loadingText
		$"%LoadingLabel2".text = loadingText
		# Reset the text to remove all the dots
		dotCount = 1
	

#Handles timeout of animation 
func _on_Timer_timeout():
	pass
	# Replace with function body.

func isFirstTime():
	isFirstRun = !hasFile()
	
	if isFirstRun:
		createFile()
		#print("Creates First Run GMD")
		
func hasFile():
	var config = File.new()
	if config.file_exists(CONFIG_FILE_PATH):
		config.open(CONFIG_FILE_PATH, File.READ)
		var _data_name = config.get_as_text()
		config.close()
		return true
	return false

#Creates the file
func createFile():
	var config = File.new()
	#The data to be written
	var _now = OS.get_datetime()
	
	#The written data values
	var box_string = "######################################################"
	var time_string = "[" + str(_now.hour).pad_zeros(2) + ":" + str(_now.minute).pad_zeros(2) + ":" + str(_now.second).pad_zeros(2) + "]"
	var date_string = "[" + str(_now.month).pad_zeros(2) + "/" + str(_now.day).pad_zeros(2) + "/" + str(_now.year).pad_zeros(2) + "]"
	
	#print("Values Written")
	#Handles the Write and Read of the file
	if config.open(CONFIG_FILE_PATH, File.WRITE) == OK:
		config.seek_end()
		# Move the file pointer to the end of the file
	var openHash = box_string
	var dataString = "\n" + "Time: " + time_string + "\n" + "Date: " + date_string + "\n"
	var closeHash = box_string
	
	config.store_string(openHash + dataString + closeHash)
	config.close()
	
################################################################
# 

