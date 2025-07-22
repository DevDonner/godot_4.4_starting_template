@tool
extends "res://addons/gd-plug/plug.gd"

# This script, powered by gd-plug, manages a core set of reliable plugins for Godot 4.
# To install all plugins, run this command from your project's root directory:
# godot --headless --script plug.gd install

func _plugging():
	# --- Core Plugin Management ---
	plug("imjp94/gd-plug-ui")

	# --- Development & Debugging Tools ---
	plug("bitwes/Gut") # Godot Unit Testing
	plug("nathanhoad/godot_input_helper") # Input Visualizer
