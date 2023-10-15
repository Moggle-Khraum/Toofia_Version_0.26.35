extends Panel

signal repeat


func _ready() -> void:
	#This will play the Voiceover..
	voiceOver()
	

func _on_x_hide() -> void:
	$"%infoPotato".stream_paused = false
	print("Info Potato Plays")
	$"%repeatInfo".stream_paused = false
	print("Repeat Info Plays")
	$'%askVoice2'.stream_paused = false
	$'%choiceA'.stream_paused = false
	$'%choiceB'.stream_paused = false
	$'%choiceC'.stream_paused = false
	$'%pickAnswer'.stream_paused = false

func _on_pauseButton_pressed() -> void:
	MenuClickSfxPlayer.play()
	$pausePanel.show()
	print("Shows the Pause Panel")
	$"%infoPotato".stream_paused = true
	print("Info Potato Stop")
	$"%repeatInfo".stream_paused = true
	print("Repeat Info Stop")
	$'%askVoice2'.stream_paused = true
	$'%choiceA'.stream_paused = true
	$'%choiceB'.stream_paused = true
	$'%choiceC'.stream_paused = true
	$'%pickAnswer'.stream_paused = true

#=============================================================================

func _on_levels_pressed() -> void:
	$'%PrutasAtGulay'.show()
	
	print('Go to Level Selection')
	
func _on_home_pressed() -> void:
	var home = get_tree().change_scene("res://Scenes/MainMenu.tscn")
	print("To Main Menu")
	
func _on_retry_pressed() -> void:
	var retry = get_tree().change_scene("res://Levels/1PrutasAtGulay/Level1/2ndQuestion/Level_1Q2.tscn")
	print('Retry level')
	
#=============================================================================
func _on_A_pressed():
	print('The Answer is Wrong!')
	WrongAnswer.play()
	$"%potato".hide()
	print("Pressed A, wrong Answer")
	$'%ScorePanel2StarA'.show()
	

func _on_ScorePanel2StarA_visibility_changed() -> void:
	yield(get_tree().create_timer(0.12), "timeout")
	$'%wrongPick'.play()
	$'%animA'.play('blink')
	print("Shows 2 Star and Blink")
	

#=================================================================================
func _on_B_pressed():
	print('The Answer is Wrong!')
	WrongAnswer.play()
	$"%potato".hide()
	print("Pressed B, Wrong Answer")
	$'%ScorePanel2StarB'.show()

func _on_ScorePanel2StarB_visibility_changed() -> void:
	yield(get_tree().create_timer(0.12), "timeout")
	$'%wrongPick'.play()
	print("Plays Correcto")
	$'%animB'.play('blink')
	print("Shows 2 Star and Blinky")
	
#================================================================================

func _on_C_pressed():
	print('The Answer is Correct!')
	CorrectAnswer.play()
	$"%potato".hide()
	print('Pressed C, Correct Answer')
	$'%ScorePanel3StarC'.show()
	
func _on_ScorePanel3StarC_visibility_changed() -> void:
	yield(get_tree().create_timer(0.12), "timeout")
	$'%correcto'.play()
	$'%animC1'.play('blink')
	
	
#=========================================================
#This is for the repeat info when pressing the button
func _on_repeat_pressed() -> void:
	$'%infoPotato'.play()
	print("Repeat Info got Pressed")
	emit_signal("repeat")
	print("Emits Signal")
	$"%infoPotato".stop()
	print("Info Potato stop")
	$'%coverButton'.show()
	$"%A".hide()
	$"%B".hide()
	$"%C".hide()
	print("Hide Repeat Button")
	if not $"%infoPotato".playing or $"%askVoice2".playing or $"%choiceA".playing or $"%choiceB".playing or $"%choiceC".playing or $"%pickAnswer".playing:
		$"%coverButton".show()
		print("Cover Show")
	else:
		$"%coverButton".hide()
		print("Cover Hide")
	
func voiceOver():
	#if self.has_signal('PlayCoconut'):
	yield(get_tree().create_timer(0.5), "timeout")
	$'%infoPotato'.play()
	print("Plays Potato")
	print("Hides Repeat Button")
	print("Hides Repeat Button")
	if $"%infoPotato".playing:
		$"%coverButton".show()

func _on_infoPotato_finished() -> void:
	yield(get_tree().create_timer(0.10), "timeout")
	#$'%repeatInfo'.play()
	$'%askVoice2'.play()
	print("Play Repeat Info")


func _on_askVoice2_finished() -> void:
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
	print("Plays Repeat Info")
#==========================================================

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





