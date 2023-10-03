extends Node

var MenuMusicPlayer
var GameMusicPlayer

func _ready():
	MenuMusicPlayer = StopWatch.find_child("Menu")
	GameMusicPlayer = StopWatch.find_child("Game")
	GameMusicPlayer.playing = false
	MenuMusicPlayer.playing = true

func _on_play_button_button_up():
	MenuMusicPlayer.playing = false
	GameMusicPlayer.playing = true
	
	# reset stopwatch
	StopWatch.time = 0.0
	StopWatch.set_process(true)
	
	get_tree().change_scene_to_file("res://levels/Level1.tscn")
