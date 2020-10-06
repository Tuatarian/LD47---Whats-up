extends Node2D

onready var hcfrick = $HcFrick
onready var wind = $Wind
onready var deadSFX = $DeadSFX
onready var winSFX = $WinSFX

func _on_AudioStreamPlayer_finished():
	$HcFrick.play()
