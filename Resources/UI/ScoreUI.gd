extends CanvasLayer
class_name ScoreUI


var score = 0;
var highScore := 0
@onready var scoreText = %CScore
@onready var Hscore = %HScore

func addPoints(scoreDelta):
	score += scoreDelta;
	scoreText.text = str(score);

	# Check if new score is higher than highScore
	if score > highScore:
		highScore = score  # Update highScore
		Hscore.text = str(highScore)  # Update UI to reflect new highScore
	#saveScore()


# Save highScore to a local file
#func saveScore():
	#var save = FileAccess.open("user://savegame.save", FileAccess.WRITE)
	#var data = JSON.stringify({"highScore": highScore})  # Create JSON with highScore
	#save.store_line(data)

 #Save highScore to a local file
#func saveScore():
	#var json = JSON.new()  # Create an instance of JSON
	#var data = json.stringify({"highScore": highScore})  # Create JSON with highScore
	#if json.error == OK:  # Check for parsing errors
		#var save = FileAccess.open("user://savegame.save", FileAccess.WRITE)
		#if not save.is_open():  # Check if file needs to be created
			#save.create()
		#save.store_line(data)
	#else:
		#print("Error: Could not parse JSON data. ", json.get_error_message())


# Load highScore from local file (optional)
#func loadScore():
#	if FileAccess.file_exists("user://savegame.save"):
#		var save = FileAccess.open("user://savegame.save", FileAccess.READ)
#		var data = JSON.parse(save.get_line())
#		if data and data.has("highScore"):
#			highScore = int(data["highScore"])  # Ensure conversion to int
#			Hscore.text = str(highScore)  # Update UI

# Load highScore from local file (optional)
func loadScore():
	if FileAccess.file_exists("user://savegame.save"):
		var save = FileAccess.open("user://savegame.save", FileAccess.READ)
		var data = save.get_line()
		var json = JSON.new()  # Create an instance of JSON
		var error = json.parse(data)  # Parse the data
		if error == OK and json.has("highScore"):  # Check for errors and data availability
			highScore = int(json["highScore"])  # Ensure conversion to int
			Hscore.text = str(highScore)  # Update UI
		else:
			print("Error: Could not load highScore. ", json.get_error_message())



# Called when the node enters the scene tree for the first time.
func _ready():
	loadScore()  # Optionally load highScore on game start
	#if not FileAccess.file_exists("user://savegame.save"):
		#return # Error! We don't have a save to load.
	#var save = FileAccess.open("user://savegame.save", FileAccess.READ);
	#var savedScore = save.get_line();
	#var json = JSON.new()
	#var jsonScore = json.parse(savedScore);
	#addPoints(int(jsonScore));

#func saveScore():
	#var save = FileAccess.open("user://savegame.save", FileAccess.WRITE);
	#var data = JSON.stringify(score);
	#save.store_line(data);

func getScore():
	return score;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
