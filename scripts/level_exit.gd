extends Area2D

@export_file("*.tscn") var destination: String

func _on_body_entered(body):
	if body.is_in_group("player") and destination != "":
		print("TROCANDO DE FASE")
		call_deferred("_change_level")

func _change_level():
	get_tree().change_scene_to_file(destination)
