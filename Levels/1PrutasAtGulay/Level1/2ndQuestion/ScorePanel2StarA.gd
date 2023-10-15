extends Panel


const USERNAME_FILE_PATH = "user://settings/username.gmd"


# Called when the node enters the scene tree for the first time.
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
