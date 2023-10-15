extends Popup

#For the name
const USERNAME_FILE_PATH = "user://settings/username.gmd"

#For the Retry
const RETRY_ONCE_FILE_PATH = "user://playerData/level1/retryOnce.gmd"
const RETRY_TWICE_FILE_PATH = "user://playerData/level1/retryTwice.gmd"

#first Question
const MISTAKE_A1_FILE_PATH = "user://playerData/level1/question1/mistakeA.gmd"
const MISTAKE_C1_FILE_PATH = "user://playerData/level1/question1/mistakeC.gmd"

#Second Question
const MISTAKE_A2_FILE_PATH = "user://playerData/level1/question2/mistakeA.gmd"
const MISTAKE_B2_FILE_PATH = "user://playerData/level1/question2/mistakeC.gmd"

func _ready():
	var config = File.new()
	if config.open(USERNAME_FILE_PATH, File.READ) == OK:
		# Read the stored username from the file
		print("Reads GMD file")
		var displayName = config.get_as_text()
		config.close()
		# Display the username in the label
		$'%username'.text = displayName
		$'%username0'.text = displayName
		print("Name Showed")

#######################################
func starDisplay():
#=============================================================
	#Check if there's a retry: Retry 1 and Retry 2
	#Checks if this is the First Retry
	var retry = File.new()
	if retry.file_exists(RETRY_ONCE_FILE_PATH):
		$'%star2_2'.hide()
		print("Displays Two Stars")
	#Checks if this is the Second Retry
	elif retry.file_exists(RETRY_ONCE_FILE_PATH) and retry.file_exists(RETRY_TWICE_FILE_PATH):
		$'%star2_2'.hide()
		$'%star1_1'.hide()
		print("Displays One Star")
#=============================================================

#============================================================
	#Checks if there's mistake at 1st question: Wrong A1
	#Checks if there's mistake at 2nd question: Correct C
	
	#This is when the first Question is Wrong and the Second Question is Correct
	#Display Two Stars
	var file = File.new()
	if file.file_exists(MISTAKE_A1_FILE_PATH):
		print("Question 1 Wrong - A1")
		$'%star1_1'.hide()
		print("Displays Two Stars")
	
	#This is when the first Question is Wrong and the Second Question is wrong
	#Display One Stars
	elif file.file_exists(MISTAKE_A1_FILE_PATH) and file.file_exists(MISTAKE_A2_FILE_PATH):
		print("Question 1 Wrong - A1, Question 2 Correct - No A2")
		$'%star2_2'.hide()
		$'%star1_1'.hide()
		print("Displays One Star")
	
	#===========================================================================
	#This is when the first Question is Wrong and the Second Question is wrong
	#Display One Stars
	elif file.file_exists(MISTAKE_A1_FILE_PATH) and file.file_exists(MISTAKE_B2_FILE_PATH):
		print("Question 1 Wrong - A1, Question 2 Correct - No B2")
		$'%star2_2'.hide()
		$'%star1_1'.hide()
		print("Displays One Stars")
		
	#================================================================================
	#This is when the first Question is Wrong and the Second Question is Correct
	#Display Two Stars
	if file.file_exists(MISTAKE_C1_FILE_PATH):
		print("Question 1 Wrong - C1, Question 2 Correct - No A2")
		$'%star1_1'.hide()
		print("Displays Two Stars")
		
	#This is when the first Question is Wrong and the Second Question is wrong
	#Display One Stars
	elif file.file_exists(MISTAKE_C1_FILE_PATH) and file.file_exists(MISTAKE_A2_FILE_PATH):
		print("Question 1 Wrong - C1, Question 2 Correct - No A2")
		$'%star2_2'.hide()
		$'%star1_1'.hide()
		print("Displays One Stars")
		
	#====================================================================================
	#This is when the first Question is Wrong and the Second Question is wrong
	#Display One Stars
	elif file.file_exists(MISTAKE_C1_FILE_PATH) and file.file_exists(MISTAKE_B2_FILE_PATH):
		print("Question 1 Wrong - C1, Question 2 Correct, No B2")
		$'%star2_2'.hide()
		$'%star1_1'.hide()
		print("Displays One Stars")
		
	#==============================================================
	#This is when the first Question is Correct and the Second Question is Wrong
	#Display Two Stars
	if file.file_exists(MISTAKE_A2_FILE_PATH) and file.file_exists(MISTAKE_A2_FILE_PATH):
		print("Question 1 Correct - No A1, Question 2 Wrong - A2")
		$'%star1_1'.hide()
		print("Displays Two Stars")
		
	#=========================================================================
	
	#This is when the first Question is Correct and the Second Question is Wrong
	#Display Two Stars
	if file.file_exists(MISTAKE_B2_FILE_PATH):
		print("Question 1 Correct - No A1|C1, Question 2 Wrong - B2")
		$'%star1_1'.hide()
		print("Displays Two Stars")
	
	#This is when the first Question is Wrong and the Second Question is wrong
	#Display One Stars
	elif file.file_exists(MISTAKE_A1_FILE_PATH) and file.file_exists(MISTAKE_B2_FILE_PATH):
		print("Question 1 Wrong - A1, Question 2 Wrong - B2")
		$'%star2_2'.hide()
		$'%star1_1'.hide()
		print("Displays One Stars")
	#============================================================================================
	

###########################################
func _on_levels_pressed():
	#This will go straight to the main menu
	MenuClickSfxPlayer.play()
	$"%PrutasAtGulay".show()
	print("To Levels")

func _on_retry_pressed() -> void:
	print("Going Back to Level1")
	ScrollPop.play()
	yield(get_tree().create_timer(0.50), "timeout")
	var retryScene = get_tree().change_scene("res://Levels/1PrutasAtGulay/Level1/1stQuestion/Level_1Q1.tscn")
	
	var checkRetry = File.new()
	if checkRetry.file_exists(RETRY_ONCE_FILE_PATH):
		createScriptOnce_file()
		deleteMistakes()
		print("Creating Once Retry File")
		
	elif checkRetry.file_exists(RETRY_ONCE_FILE_PATH) and checkRetry.file_exists(RETRY_TWICE_FILE_PATH):
		createScriptTwice_file()
		deleteMistakes()
		print("Creating Twice Retry File")
	
	
#This is for CREATION of the retry script file, No. of Retries: 1
func createScriptOnce_file():
	var retryCreate1 = File.new()
	if retryCreate1.open(RETRY_ONCE_FILE_PATH, File.WRITE) == OK:
	# Writes a number inside the Retry File, Retry 1
		retryCreate1.store_string("Retries:" + "1")
		retryCreate1.close()
		print("Retry Once File Saved")
		
	else:
		print("Retry 1 Creation Error")
		
#This is for CREATION of the retry script file, No. of Retries: 1
func createScriptTwice_file():
	var retryCreate2 = File.new()
	if retryCreate2.open(RETRY_TWICE_FILE_PATH, File.WRITE) == OK:
	# Writes a number inside the Retry File, Retry 2
		retryCreate2.store_string("Retries:" + "2")
		retryCreate2.close()
		print("Retry Twice File Saved")
		
	else:
		print('Retry 2 Creation Error ')
		
	
func deleteMistakes():
	var removeMistakes = File.new()
	removeMistakes.remove("user://playerData/level1/2ndQuestion/mistakeA2.gmd")
	removeMistakes.remove("user://playerData/level1/2ndquestion/mistakeB2.gmd")
	removeMistakes.remove("user://playerData/level1/1stQuestion/mistakeA1.gmd")
	removeMistakes.remove("user://playerData/level1/1stQuestion/mistakeC1.gmd")
	print("Deletes all the Mistake Files..")
