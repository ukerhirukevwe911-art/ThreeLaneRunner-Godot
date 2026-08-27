# ThreeLaneRunner-Godot (Godot 4)

This repository was updated to Godot 4-compatible scene/script files.

What changed:
- player.tscn root node converted to CharacterBody3D and the character model is pre-instanced with the recommended transform (translation=(0,0.90151494,0), scale=(1.02,1.02,1.02)).
- Player.gd rewritten to Godot 4 GDScript using @export annotations and CharacterBody3D. Input handling supports touch swipes, mouse drag fallback, and keyboard.

How to use:
- Open the GodotProject folder with Godot 4.x. The scene player.tscn should load. If the model import shows missing dependency, ensure res://models/character_hull_colored.glb exists and re-import it.
- Tweak exported variables on the Player node: model_scale, model_y_offset, lane_distance, swipe_threshold.
