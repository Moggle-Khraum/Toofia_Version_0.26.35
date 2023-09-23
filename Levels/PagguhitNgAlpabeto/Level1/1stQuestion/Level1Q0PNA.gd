extends Control

var nextQuestion = load('res://Levels/PagguhitNgAlpabeto/Level1/2ndQuestion/Level1Q1PNA.tscn')

func _on_pauseButton_pressed() -> void:
	MenuClickSfxPlayer.play()
	$'%pausePanel'.show()
	print("Shows the Pause Panel")

func _on_nextButton_pressed() -> void:
	#Next Question - Sunod na tanong
	ScrollPop.play()
	var nextTanong = get_tree().change_scene_to(nextQuestion)
	print("Next Question")

