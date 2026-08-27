# ThreeLaneRunner-Godot

This is a minimal Godot 3 starter for the ThreeLaneRunner project (3D).

What I added:
- project.godot (sets main scene to player.tscn)
- player.tscn (simple KinematicBody with a cube MeshInstance and CollisionShape)
- Player.gd (lane-based player controller: keyboard, mouse-swipe, and touch-swipe)
- models/character_hull_colored.glb (your provided character model)

What I changed:
- Player.gd now attempts to load and instance res://models/character_hull_colored.glb at runtime. If found, the placeholder cube is hidden and your model is used.
- Exposed exported variables in Player.gd:
  - model_path (path to GLB/TS scene)
  - model_scale (scale applied to the imported model)
  - model_y_offset (vertical offset to place the model's feet at Y=0)

How to test locally in Godot 3.x:
1. Clone the repo: git clone https://github.com/ukerhirukevwe911-art/ThreeLaneRunner-Godot
2. Open Godot 3.x and select the GodotProject folder as the project root.
3. Wait for Godot to import the GLB (it will generate import metadata).
4. Open player.tscn and run the scene.
5. Use A/D or Left/Right arrows to move lanes. Click-and-drag horizontally (desktop) or swipe on mobile to test swipes.

Tuning the model:
- Select the Player node in player.tscn and tweak model_scale and model_y_offset in the inspector to position and size the model so the feet sit on the ground and lanes align visually.

About connecting Godot to GitHub:
- The recommended workflow is to clone this repository locally and open it in Godot. Godot will import assets automatically.
- Godot doesn't push directly to GitHub by itself; you use git on your machine or a GUI (GitKraken, SourceTree, GitHub Desktop) to pull/push.
- There are community Git plugins you can install into the editor (e.g., "GitHub" or "Version Control" plugins) but they still use the local git tool; they don't authenticate directly to remote without your credentials.

If you want, I can:
- Adjust model_scale and model_y_offset and push updated values so the model visually fits the lanes (tell me the desired character height in world units or a screenshot of how it looks after you test locally).
- Re-export the model from Blender with generated normals and a clean pivot if you want better lighting and a properly centered origin — tell me if you want me to do that conversion.

Next steps I can take now (pick one):
- "Push changes as-is" — I will commit the GLB and updated Player.gd (done) and report the commit URL.
- "Auto-fit model" — I can attempt to open the GLB, compute a suggested scale and Y offset and update Player.gd exports accordingly.
- "Convert model for Unity" — I can convert to FBX and create a Unity prefab/material that supports vertex colors.

Let me know which of the above you want. If you're ready, I can now report the commit URL and confirm the files are in the repo.
