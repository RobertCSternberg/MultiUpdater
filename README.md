# Multi Updater

##### This script is a sort of "macro" that can automate a sequence of typing, mouse, and keyboard actions based on user input. It can be quite useful for repetitive tasks that involve typing and key presses.

### Initialization and Configurations: 
This part sets up certain configurations for the script's behavior. For example, it sets the working directory of the script, and the mode for sending inputs.

### User prompts: 
When you press the F5 key, a series of message boxes (MsgBox) and input boxes (InputBox) are displayed. These ask for various types of user inputs. For instance, the user is asked whether the script should be mouse-location aware, whether a mouse click should occur before typing, the text to be typed, the keys to be pressed before and after typing, whether to save between records, the commands for moving to the next record and for saving, the number of times the typing should be repeated, and delays between certain actions.

### Setting up the loop: 
After all the user inputs have been received, the script goes into a loop where it automates the sequence of actions defined by the user input. These actions may include moving the mouse to specific locations, performing mouse clicks, sending key presses, typing specified text, saving the record, and moving to the next record. The number of times this sequence of actions is repeated is determined by the input for "Times to Type" (vLoop). The time delays between certain actions are determined by the inputs for "Action Delay" (vActionDelay), "Save Delay" (vSaveDelay), and "Load Delay" (vLoadDelay).

### Emergency Stop or Break Loop: 
During the execution of the script, the user can press F4 to quit the script entirely. The user can also press the ESC key to break the loop and then press Q to restart the loop.
