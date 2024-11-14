extends Node

var elapsed_time: int = 0

# Reference to the timer and UI label
@onready var game_timer = $TimerLabel/Timer
@onready var time_label = $TimerLabel 
@onready var score_label = $ScoreLabel
@onready var pause_label = $PauseLabel
@onready var resume_button = $resumeButton

func _ready():
	# Start the timer with an interval of 1 second
	game_timer.start(1)
	update_timer_label()  # Initialize the label with the starting time
	update_score_label() #  Initialize the label with the coin score
	pause_label.hide() # hide pause on start
	resume_button.hide() # hide resume button on start
	resume_button.process_mode = Node.PROCESS_MODE_WHEN_PAUSED  # Enable processing when paused

func _process(delta):
	# Check and update the label text to display the global variable
	update_score_label()

# Increment the timer every second
func _on_timer_timeout():
	elapsed_time += 1
	update_timer_label()

# Update the label's text to show elapsed time
func update_timer_label():
	time_label.text = "Time: " + str(elapsed_time)
	

# (Optional) To stop or reset the timer, you can use:
# game_timer.stop()  # Stops the timer
# elapsed_time = 0   # Resets elapsed time if needed

#SCORE
func update_score_label():
	score_label.text = "Score: " +str(Global.coinScore)

func _on_pause_button_pressed():
	get_tree().paused = true
	resume_button.show()
	pause_label.show()
	
func _on_resume_button_pressed():
	get_tree().paused = false
	resume_button.hide()
	pause_label.hide()
