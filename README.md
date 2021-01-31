#This repository contains code required to run a simulation for the Droid Racing Competition

## Installation:

- git clone this repository
- Install Processing from https://processing.org/download/ (if you don't have it)
	- Make sure to keep track of where you install Processing because you will need it for method 2 (terminal)

## Usage:

- Before contiuing, make sure that this repository is the current directory

### Method 1 (GUI):

- Open up DRCsimulator\_test.pde
- Run DRCsimulator\_test.pde
- Finally, use the "wasd" keys to move the droid

### Method 2 (terminal):

- Add the directory that contains "processing-java" to PATH environment variables

- Try "processing-java --sketch=%CD% --run" or  "processing-java --sketch=$PWD --run" depending in which OS u have

- Finally, use the "wasd" keys to move the droid

### Sending data via websockets (terminal):

- Something you may be interested in doing is sending the keyboard pressing data via websockets over to Python so that you can do things like train some AI.
	- Make sure that method 2 works before you try this

- Run "python3 websockets\_keyboard.py" 

- Type "processing-java --sketch=%CD% --run __train__" or "processing-java --sketch=$PWD --run __train__" to send data to python

- Finally, use the "wasd" keys to move the droid

