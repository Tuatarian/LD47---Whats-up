extends RigidBody2D

export var scalar := 100
var dirvec : Vector2
onready var cS := "res://Scenes/" + get_tree().get_current_scene().get_name() + ".tscn"
onready var nS := "Scenes/Lvl" + str(int(cS) + 1) + ".tscn"
var clicked := false


func _physics_process(delta):
	if Input.is_action_pressed("Grapple"):
		clicked = true
		get_parent().get_node("LevelGeometry").rotating = true
	if !Globals.hcfrick.playing:
		Globals.hcfrick.play()
	if clicked:
		global_position = lerp(global_position, get_viewport().get_mouse_position(), 0.3)
	if $WinTimer.time_left:
		position = get_parent().get_node("LevelGeometry/LevelEnd").global_position
		get_parent().get_node("LevelGeometry").rotsp = lerp(get_parent().get_node("LevelGeometry").rotsp, 0, 0.25)

func _on_Plr_body_entered(body):
	if body.name.substr(0, 5) == "Block":
		Globals.deadSFX.stop()
		Globals.deadSFX.play()
		get_tree().change_scene(cS)
	if body.name == "LevelEnd":
		Globals.winSFX.stop()
		Globals.winSFX.play()
		$WinTimer.start(2)
		hide();


func _on_WinTimer_timeout():
	Engine.time_scale = 1
	$WinTimer.stop()
	get_tree().change_scene(nS)
