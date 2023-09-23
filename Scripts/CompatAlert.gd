extends Popup

#For the Cogs
var speed = 500
# Speed of the rotation
var angular_speed = PI
# Angular speed of one full rotation per second

#-----------------------------
#This Handles the Quit Button
func _on_exit_pressed() -> void:
	MenuClickSfxPlayer.play()
	get_tree().quit()
	print("Presses Exit")

#----------------------------------
func _process(delta: float) -> void:
	#Rotate the gear sprite
		$'%cog1'.rotation += angular_speed * delta
		$'%cog2'.rotation -= angular_speed * delta
		$'%cog3'.rotation -= angular_speed * delta
		$'%cog4'.rotation += angular_speed * delta


