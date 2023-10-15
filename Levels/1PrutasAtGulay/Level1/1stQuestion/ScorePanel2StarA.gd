extends Panel

const USERNAME_FILE_PATH = "user://settings/username.gmd"

func _ready() -> void:
	#This displays the Username into the label
	var config = File.new()
	if config.open(USERNAME_FILE_PATH, File.READ) == OK:
		# Read the stored username from the file
		var userName = config.get_as_text()
		config.close()
		# Display the username in the label
		$'%nameLabel1'.text = userName
		$'%namelabel1'.text = userName
		print("Name Showed - 1")

func _on_levels_pressed() -> void:
	$'%PrutasAtGulay'.show()
	print('Go to Level Selection')
	
func _on_home_pressed() -> void:
	var home = get_tree().change_scene("res://Scenes/MainMenu.tscn")
	print("To Main Menu")
	
func _on_retry_pressed() -> void:
	var retry = get_tree().change_scene("res://Levels/1PrutasAtGulay/Level1/1stQuestion/Level_1Q1.tscn")
	print('Retry level')


func _on_nextQuestion_pressed() -> void:
	ScrollPop.play()
	yield(get_tree().create_timer(0.2), "timeout")
	var nextQ = get_tree().change_scene("res://Levels/1PrutasAtGulay/Level1/2ndQuestion/Level_1Q2.tscn")
	print("Next Question")

