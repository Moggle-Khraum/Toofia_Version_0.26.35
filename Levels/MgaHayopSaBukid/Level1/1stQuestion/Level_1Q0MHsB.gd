extends Panel

var nextQuestion = load('res://Levels/MgaHayopSaBukid/Level1/2ndQuestion/Level_1Q1MHsB.tscn')


func _on_pauseButton_pressed() -> void:
	MenuClickSfxPlayer.play()
	$'%pausePanel'.show()
	print("Shows the Pause Panel")


func _on_nextButton_pressed() -> void:
	#Next Question - Sunod na tanong
	ScrollPop.play()
	var nextTanong = get_tree().change_scene_to(nextQuestion)
	print("Next Question")
