extends Panel

signal repeat

#first Question
const MISTAKE_A1_FILE_PATH = "user://playerData/level1/1stQuestion/mistakeA1.gmd"
const MISTAKE_C1_FILE_PATH = "user://playerData/level1/1stQuestion/mistakeC1.gmd"

func _ready() -> void:
	#This will play the Voiceover..
	voiceOver()

func _on_x_hide() -> void:
	$"%infoApple".stream_paused = false
	print("Info Apple Plays")
	$"%repeatInfo".stream_paused = false
	print("Repeat Info Plays")

func _on_pauseButton_pressed() -> void:
	MenuClickSfxPlayer.play()
	$pausePanel.show()
	print("Shows the Pause Panel")
	$"%infoApple".stream_paused = true
	print("Info Apple Stop")
	$"%repeatInfo".stream_paused = true
	print("Repeat Info Stop")


#==============================================================================
func _on_A_pressed():
	print('The Answer is Wrong!')
	WrongAnswer.play()
	$wrongAnswerA.show()
	$background/imageText.hide()
	$background/pauseButton.hide()
	$"%apple".hide()
	print("Pressed A, wrong Answer")
	_on_wrongAnswerA_visibility_changed()
	createNextQuestion()
	
	$"%infoApple".stream_paused = true
	print("Info Apple Stop")
	$"%repeatInfo".stream_paused = true
	print("Repeat Info Stop")
	
	if !hasFileA1():
		createA1Wrong()
		print("Creating FileA1")
	elif hasFileA1():
		print("FileA1 exists")
	else:
		print("FileA1 Nonexistent")
		
func createA1Wrong():
	#Creates a script that records the mistake
	var wrongA1 = File.new()
	if wrongA1.open(MISTAKE_A1_FILE_PATH, File.WRITE) == OK:
	# Writes a number inside the Retry File, Retry 1
		wrongA1.store_string("A1 Mistake")
		wrongA1.close()
	print("Mistake A1 File Saved")
	
	
func hasFileA1():
	print("Checking Retry Once file")
	var wrongA1 = File.new()
	print("Mistake A1 File Exist")
	return wrongA1.file_exists(MISTAKE_A1_FILE_PATH)
	
#==========================================================================
	
func _on_B_pressed():
	print('The Answer is Correct!')
	$correctAnswerB.show()
	$background/imageText.hide()
	$background/pauseButton.hide()
	$"%apple".hide()
	print("Pressed B, Correct Answer")
	_on_correctAnswerB_visibility_changed()
	createNextQuestion()
	
	$"%infoApple".stream_paused = true
	print("Info Apple Stop")
	$"%repeatInfo".stream_paused = true
	print("Repeat Info Stop")
	
#============================================================================

#========================================================================
func _on_C_pressed():
	print('The Answer is Wrong!')
	WrongAnswer.play()
	$background/imageText.hide()
	$wrongAnswerC.show()
	$background/pauseButton.hide()
	$"%apple".hide()
	print('Pressed C, Wrong Answer')
	_on_wrongAnswerC_visibility_changed()
	createNextQuestion()
	
	$"%infoApple".stream_paused = true
	print("Info Apple Stop")
	$"%repeatInfo".stream_paused = true
	print("Repeat Info Stop")
	
	if not hasFileC1():
		createC1Wrong()
		print('Creating FileC1')
	elif hasFileC1():
		print("FileC1 Exists")
	else:
		print("FileC1 Nonexistent")
			
func createC1Wrong():
	#Creates a script that records the mistake
	var wrongC1 = File.new()
	if wrongC1.open(MISTAKE_C1_FILE_PATH, File.WRITE) == OK:
	# Writes a number inside the Retry File, Retry 1
		wrongC1.store_string("C1 Mistake")
		wrongC1.close()
	print("Mistake C1 File Saved")
			
#Checks if there's a C1 File
func hasFileC1():
	print("Checking Retry Once file")
	var wrongC1 = File.new()
	print("Mistake A1 File Exist")
	return wrongC1.file_exists(MISTAKE_C1_FILE_PATH)
	
#========================================================================
	
func _on_nextQuestion_pressed() -> void:
	ScrollPop.play()
	yield(get_tree().create_timer(0.2), "timeout")
	var nextQ = get_tree().change_scene("res://Levels/1PrutasAtGulay/Level1/2ndQuestion/Level_1Q2.tscn")
	print("Next Question")
	
#This is for the repeat info when pressing the button
func _on_repeat_pressed() -> void:
	$'%infoApple'.play()
	print("Repeat Info got Pressed")
	emit_signal("repeat")
	print("Emits Signal")
	$"%infoApple".stop()
	print("Info Apple stop")
	$'%coverButton'.show()
	$'%AnswerPanel'.hide()
	print("Hide Repeat Button")
	
func voiceOver():
	#if self.has_signal('Play InfoApple'):
	yield(get_tree().create_timer(0.5), "timeout")
	$'%infoApple'.play()
	print("Plays infoApple")
	print("Hides Repeat Button")
	

func _on_infoApple_finished() -> void:
	yield(get_tree().create_timer(0.10), "timeout")
	$'%askVoice'.play()
	print("Play Repeat Info")

func _on_askVoice_finished() -> void:
	yield(get_tree().create_timer(0.10), "timeout")
	$'%choiceA'.play()
	$'%A'.show()
	yield(get_tree().create_timer(0.8), "timeout")

func _on_choiceA_finished() -> void:
	yield(get_tree().create_timer(0.10), "timeout")
	$'%choiceB'.play()
	$'%B'.show()
	$'%A'.hide()
	yield(get_tree().create_timer(0.8), "timeout")

func _on_choiceB_finished() -> void:
	yield(get_tree().create_timer(0.10), "timeout")
	$'%choiceC'.play()
	$'%C'.show()
	$'%A'.hide()
	$'%B'.hide()
	yield(get_tree().create_timer(0.8), "timeout")
	
func _on_choiceC_finished() -> void:
	yield(get_tree().create_timer(0.10), "timeout")
	$'%pickAnswer'.play()
	$'%A'.show()
	$'%B'.show()

func _on_pickAnswer_finished() -> void:
	yield(get_tree().create_timer(0.10), "timeout")
	$'%repeatInfo'.play()

#==================================================
func _on_wrongAnswerA_visibility_changed():
	$"%animA".play("downArrow")
	print("Plays UpDown Arrow")
	nextQuestionVoice()
	print("Plays Next Tanong")

func _on_correctAnswerB_visibility_changed():
	$"%animB".play("downArrow")
	print("Plays UpDown Arrow")
	$'%correctQuestion'.play()
	print("Plays Next Tanong")
	
func _on_wrongAnswerC_visibility_changed():
	$"%animA".play("downArrow")
	print("Plays UpDown Arrow")
	nextQuestionVoice()
	print("Plays Next Tanong")
	yield(get_tree().create_timer(0.35), "timeout")
	
func nextQuestionVoice():
	yield(get_tree().create_timer(0.35), "timeout")
	$"%wrongQuestion".play()
	print("Play Next Question Voice")



func _on_repeatInfo_finished():
	if not $'%repeatInfo'.playing:
		$'%coverButton'.hide()
		print("Cover Repeat buttons")
	
	if not self.has_signal("repeat"):
		$"%blockButtons".show()
		print("Show Lock")
	else:
		$"%blockButtons".hide()
		print("Hide Lock")
	

#================================
# THIS WILL CREATE THE FOLDER THAT STORES THIS LEVEL'S SCRIPTS
func createNextQuestion():
	print("Creating..")
	# Ensure the configuration folder exists
	var data_dir = "user://playerData/level1/2ndQuestion"
	var dir = Directory.new()
	if not dir.dir_exists(data_dir):
		dir.make_dir_recursive(data_dir)
		print("2nd Q Folder Done!")
	print("Folder Created..")










