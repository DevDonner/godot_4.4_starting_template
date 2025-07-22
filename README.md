# Godot Project Template
[![Latest Release](https://img.shields.io/github/v/release/DevDonner/godot_4.4_starting_template?label=latest%20release&style=for-the-badge)](https://github.com/DevDonner/godot_4.4_starting_template/releases/latest)

Starter template for my future godot projects, I'll update this as I go. Just wanted something simple and easy, ended up with a nightmare. 
Seems solid now, I did need to utilize AI to refactor some code but AI is AI and debugging can still take you till 3 am...

## Features

-   **Standard Directory Structure:** Pre-made folders for scenes, scripts, assets, and tests.
-   **Plugin Management:** Uses `gd-plug` to install and manage essential plugins.
-   **Essential Addons Included:**
	-   **Gut:** Godot Unit Testing framework.
	-   **Godot Input Helper:** Visualize and debug `InputEvent`.

## How to Use This Template

1.  Click the **"Use this template"** button on the GitHub repository page and select **"Create a new repository"**.
2.  Choose a name for your new project repository and clone it to your local machine.
3.  **Install Godot 4.3** or newer if you haven't already. Add it to your PATH:
	Here is an example:
 	```bash
		C:\Code\GodotApp
	```
	**MAKE SURE** that your godot executable has been renamed to ```godot.exe```. I ran my head into my desk for an hour trying to figure out why everything was right but so wrong.
4.  **Install the plugins:** Open a terminal/command prompt in the project's root directory and run the following command:
	```bash
	.\setup.bat
	```
5.  **After the script:** You can use the following to check if plug installed the templated plugins:
	```bash
	godot --headless --script plug.gd status
	```
6. **Turn on the plugins:** Within Project --> Project Settings: You will see the Plugins Tab. Turn on the plugins you want to use. I advice at least turning on plug-ui.
7. **Potential Errors:** You may run into path issues when trying to run the setup script saying godot is not listed as a PATH variable, but if you launch a shell elsewhere it works.
This means godot is being dumb and you need to either restart godot, or restart your PC to apply the PATH changes.

## Running Tests

This template includes the Gut (Godot Unit Test) framework.

1.  Enable the `Gut` plugin in `Project -> Project Settings -> Plugins`.
2.  Create your tests in the `tests/` directory (e.g., `tests/test_player.gd`).
3.  Run tests from the command line:
	```bash
	godot --headless --script addons/gut/gut_cmdln.gd
	```
	Or run them from the Gut tab inside the Godot editor.
