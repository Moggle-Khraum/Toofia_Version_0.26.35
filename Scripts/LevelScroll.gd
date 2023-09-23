extends CardScroll
#Calling the Global class CardScroll
#The above is referencing the Template base called CardScroll

#THIS IS FOR THE BUTTONS ONLY
###
func _on_RightButton_pressed() -> void:
	ScrollPop.play()
	if card_current_index < card_x_positions.size() - 1:
		card_current_index += 1
		print("Presses '=>' Arrow")
		scroll()
	
func _on_LeftButton_pressed() -> void:
	ScrollPop.play()
	if card_current_index > 0:
		card_current_index -= 1
		print("Presses '<=' Arrow")
		scroll()
	
#### THIS IS FOR THE BUTTONS!!



