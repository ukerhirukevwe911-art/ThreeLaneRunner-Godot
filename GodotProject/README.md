# ThreeLaneRunner-Godot

This is a minimal Godot 3 starter for the ThreeLaneRunner project (3D).

What I added:
- project.godot (sets main scene to player.tscn)
- player.tscn (simple KinematicBody with a cube MeshInstance and CollisionShape)
- Player.gd (lane-based player controller: keyboard, mouse swipe, and touch swipe)

How to run:
1. Open this folder with Godot 3.x (this project uses GLES3). If you use Godot 4, the script will need adjustments (CharacterBody3D etc.).
2. Run the project — it will open the player.tscn scene. Use A/D or left/right arrow to move lanes, or click-and-drag horizontally to test swipes.

Notes & next steps:
- The lane positions use lane_distance = 2.5 units (same as Unity default). Adjust lane_distance in the inspector to match visuals or your character model size.
- Replace the placeholder cube MeshInstance in player.tscn with your character model later. When you upload it, tell me and I will add it and enable Git LFS if it's large.
- I mapped swipe directions correctly: swipe right -> move right, swipe left -> move left.

If you want this as Godot 4 (CharacterBody3D) instead, tell me and I'll convert it.
