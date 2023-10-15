extends Panel

signal repeat

const USERNAME_FILE_PATH = "user://settings/username.gmd"

func _ready() -> void:
	#This will play the Voiceover..
	voiceOver()

func _on_x_hide() -> void:
	$"%infoApple".stream_paused = false
	print("Info Apple Plays")
	$"%repeatInfo".stream_paused = false
	print("Repeat Info Plays")
	$'%askVoice'.stream_paused = false
	$'%repeatInfo'.stream_paused = false
	$"%choiceA".stream_paused = false
	$"%choiceB".stream_paused = false
	$"%choiceC".stream_paused = false
	$"%pickAnswer".stream_paused = false

func _on_pauseButton_pressed() -> void:
	MenuClickSfxPlayer.play()
	$pausePanel.show()
	print("Shows the Pause Panel")
	$"%infoApple".stream_paused = true
	print("Info Apple Stop")
	$"%repeatInfo".stream_paused = true
	print("Repeat Info Stop")
	$'%askVoice'.stream_paused = true
	$'%repeatInfo'.stream_paused = true
	$"%choiceA".stream_paused = true
	$"%choiceB".stream_paused = true
	$"%choiceC".stream_paused = true
	$"%pickAnswer".stream_paused = true

#==============================================================================
func _on_A_pressed():
	print('The Answer is Wrong!')
	WrongAnswer.play()
	$"%apple".hide()
	$'%ScorePanel2StarA'.show()
	print("Pressed A, wrong Answer")
	
func _on_ScorePanel2StarA_visibility_changed() -> void:
	yield(get_tree().create_timer(0.12), "timeout")
	$'%wrongPick'.play()
	$'%animA'.play('blink')
	print("Shows 2 stars")

#==========================================================================
	
func _on_B_pressed():
	print('The Answer is Correct!')
	CorrectAnswer.play()
	$"%apple".hide()
	print("Pressed B, Correct Answer")
	$'%ScorePanel3StarB'.show()
	

func _on_ScorePanel3StarB_visibility_changed() -> void:
	yield(get_tree().create_timer(0.12), "timeout")
	$'%correcto'.play()
	$'%animB'.play('blink')
	print("Plays Correcto")
	
#========================================================================
func _on_C_pressed():
	print('The Answer is Wrong!')
	WrongAnswer.play()
	$"%apple".hide()
	print('Pressed C, Wrong Answer')
	$'%ScorePanel2StarC'.show()
	
func _on_ScorePanel2StarC_visibility_changed() -> void:
	yield(get_tree().create_timer(0.12), "timeout")
	$'%wrongC'.play()
	$'%AnimationPlayer'.play('blink')
	
#========================================================================
	
#This is for the repeat info when pressing the button
func _on_repeat_pressed() -> void:
	$'%infoApple'.play()
	print("Repeat Info got Pressed")
	emit_signal("repeat")
	print("Emits Signal")
	$"%infoApple".stop()
	print("Info Apple stop")
	$'%coverButton'.show()
	$"%A".hide()
	$"%B".hide()
	$"%C".hide()
	print("Hide Repeat Button")
	if not $"%infoApple".playing or $"%askVoice".playing or $"%choiceA".playing or $"%choiceB".playing or $"%choiceC".playing or $"%pickAnswer".playing:
		$"%coverButton".show()
		print("Cover Show")
	else:
		$"%coverButton".hide()
		print("Cover Hide")
	
func voiceOver():
	#if self.has_signal('Play InfoApple'):
	yield(get_tree().create_timer(0.5), "timeout")
	$'%infoApple'.play()
	print("Plays infoApple")
	print("Hides Repeat Button")
	if $"%infoApple".playing:
		$"%coverButton".show()
	

func _on_infoApple_finished() -> void:
	yield(get_tree().create_timer(0.10), "timeout")
	$'%askVoice'.play()
	print("Play Repeat Info")

func _on_askVoice_finished() -> void:
	yield(get_tree().create_timer(0.10), "timeout")
	$'%choiceA'.play()
	$'%A'.show()
	$"%A".disabled = true
	yield(get_tree().create_timer(0.8), "timeout")
	print("Show A")
	print("Disabled A")

func _on_choiceA_finished() -> void:
	yield(get_tree().create_timer(0.10), "timeout")
	$'%choiceB'.play()
	$'%B'.show()
	$'%A'.hide()
	$"%B".disabled = true
	yield(get_tree().create_timer(0.8), "timeout")
	print("Show B")
	print("Disabled B")

func _on_choiceB_finished() -> void:
	yield(get_tree().create_timer(0.10), "timeout")
	$'%choiceC'.play()
	$'%C'.show()
	$'%A'.hide()
	$'%B'.hide()
	$"%C".disabled = true
	yield(get_tree().create_timer(0.8), "timeout")
	print("Show C")
	print("Disabled C")
	
func _on_choiceC_finished() -> void:
	yield(get_tree().create_timer(0.10), "timeout")
	$'%pickAnswer'.play()
	$'%A'.show()
	$'%B'.show()
	print("Show A, B, C")
	

func _on_pickAnswer_finished() -> void:
	$'%repeatInfo'.play()
	print("Repeat Info Plays")
#==================================================

func _on_repeatInfo_finished():
	if $'%repeatInfo'.playing:
		$'%coverButton'.show()
		print("Cover Repeat buttons")
	else:
		$'%coverButton'.hide()
		$"%C".disabled = false
		$"%B".disabled = false
		$"%A".disabled = false
		print("Enabled Button A, B, C")




















