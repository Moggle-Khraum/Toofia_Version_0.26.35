extends Panel

signal repeat

#first Question
const MISTAKE_A1_FILE_PATH = "user://playerData/level1/question1/mistakeA1.gmd"
const MISTAKE_C1_FILE_PATH = "user://playerData/level1/question1/mistakeC1.gmd"

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
	
	$"%infoApple".stream_paused = true
	print("Info Apple Stop")
	$"%repeatInfo".stream_paused = true
	print("Repeat Info Stop")
	
	if not hasFileA1():
		#Creates a script that records the mistake
		var wrongA1 = File.new()
		if wrongA1.open(MISTAKE_A1_FILE_PATH, File.WRITE) == OK:
		# Writes a number inside the Retry File, Retry 1
			wrongA1.store_string("A1 Mistake")
			wrongA1.close()
			print("Mistake A1 File Saved")
	else:
		print("The file A1 already exist")
		
			
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
	
	$"%infoApple".stream_paused = true
	print("Info Apple Stop")
	$"%repeatInfo".stream_paused = true
	print("Repeat Info Stop")
	
	if hasFileC1():
		#Creates a script that records the mistake
		var wrongC1 = File.new()
		if wrongC1.open(MISTAKE_C1_FILE_PATH, File.WRITE) == OK:
		# Writes a number inside the Retry File, Retry 1
			wrongC1.store_string("C1 Mistake")
			wrongC1.close()
			print("Mistake C1 File Saved")
	else:
		print("The file C1 already exist")
		
			
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
	print("Info Coconut stop")
	$'%coverButton'.show()
	print("Hide Repeat Button")
	
func voiceOver():
	#if self.has_signal('PlayCoconut'):
	yield(get_tree().create_timer(0.5), "timeout")
	$'%infoApple'.play()
	print("Plays Coconut")
	print("Hides Repeat Button")
	

func _on_infoApple_finished() -> void:
	yield(get_tree().create_timer(0.10), "timeout")
	$'%repeatInfo'.play()
	print("Play Repeat Info")
	$"%AnswerPanel".show()
	$"%blockButtons".show()
	print("Shows Answer Panel, Show Block Buttons")


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
	




