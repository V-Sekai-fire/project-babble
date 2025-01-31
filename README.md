![Babble Logo](https://github.com/Project-Babble/ProjectBabble/blob/6f09c3b091bff996a1ec543e1ac1050a15a636af/Babble.png)

<h3 align="center">
Project Babble is an open-source mouth tracking project designed to work with any VR headset. We strive to make our models robust to different lighting, cameras, image qualities and facial structures!
</h3>

## Table of Contents
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Links](#links)
  
## Features
- 100% open-source! 🌟
- Fast and robust! 🚀
- Works with existing blendshape standards! ⚙️
- Constantly updated and modified! 🔧

## Installation
### Windows
Head to the releases section and [download the latest installer](https://github.com/Project-Babble/ProjectBabble/releases/latest).

### MacOS and Linux
Install `git`, `curl` and a version of `python` greater than `3.8` for your distro. 

Then, copy paste and run the following script into the terminal of your choice:

#### For the latest commit (may be buggy, but has more features):

```bash
bash -c "$(curl -fsSL https://gist.githubusercontent.com/dfgHiatus/e1bce63cd6be1e8645c3b3adfd5b71a6/raw/93c65ee8256484b75feb0573499092810c076084/project-babble-installer-latest.sh)"
```

#### For the latest tagged release:

```bash
bash -c "$(curl -fsSL https://gist.githubusercontent.com/dfgHiatus/a92a3caae24c1bfab1c7544537a654c5/raw/2fc34b9f60760ea93cd82006d3a428699609f0d8/project-babble-installer-tagged.sh)"
```

Once it's finished installing, you can update and run the Babble app by typing `babble-app` into your terminal.

*You should also be able to run the Windows executable through Wine!*

#### Notes:
If you receive a `["Error listing UVC devices on Linux ... No such file or directory"]` when choosing/changing your camera, you'll need to install video4linux (`v4l-utils`) for your distro.

For Ubuntu or other distros with apt:
```bash
sudo apt-get install v4l-utils
```

If you receive a `ModuleNotFoundError: No module named 'tkinter'` error message on run, you'll need to install `tkinter` for your distro.

For Ubuntu or other distros with apt:
```bash
sudo apt-get install python3-tk
```
For Fedora:
```bash
sudo dnf install python3-tkinter
```

You can read more about this [here](https://stackoverflow.com/questions/25905540/importerror-no-module-named-tkinter).

## Usage 
We have integrations for [VRChat](https://docs.babble.diy/docs/software/integrations/vrc), [Resonite](https://docs.babble.diy/docs/software/integrations/resonite) and [ChilloutVR](https://docs.babble.diy/docs/software/integrations/chilloutVR)!

Looking for something else? Check out our [documentation](https://docs.babble.diy/)!

## Links
- [Our Discord](https://discord.gg/XAMZmjBktk)
- [Our Twitter](https://x.com/projectBabbleVR)
- [Wandb Runs](https://wandb.ai/summerai/ProjectBabble)
