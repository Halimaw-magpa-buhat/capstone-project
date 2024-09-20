extends Control

@onready var ErrorLabel = $Panel/ErrorLabel
@onready var CorrectLabel = $Panel/CorrectLabel
@onready var WrongLabel = $Panel/WrongLabel
@onready var timer = $Timer  

signal starChanged

var questions = [
	{
		"question": "Add James Perez to the 'Employees' table.",
		"answer": "INSERT INTO Employees (first_name, last_name) VALUES ('James', 'Perez');"
	},
	{
		"question": "Insert a new record into the 'Orders' table with a customer_id 0936.",
		"answer": "INSERT INTO Orders (customer_id) VALUES (0936);"
	},
	{
		"question": "Change the job_title to 'Senior Developer' for the employee with 'employee_id' 76 in the 'Employees' table.",
		"answer": "UPDATE Employees SET job_title = 'Senior Developer' WHERE employee_id = 76;"
	},
	{
		"question": "Delete all records from the 'Products' table without removing the table itself.",
		"answer": "DELETE FROM Products;"
	},
	{
		"question": "Change the status to 'Active' for all users in the 'Users' table.",
		"answer": "UPDATE Users SET status = 'Active';"
	},
	{
		"question": "Replace 'Old Address' with 'New Address' in the address column of the 'Customers' table.",
		"answer": "UPDATE Customers SET address = 'New Address' WHERE address = 'Old Address';"
	},
	{
		"question": "Delete all orders from the 'Orders' table where status is 'Cancelled'.",
		"answer": "DELETE FROM Orders WHERE status = 'Cancelled';"
	},
	{
		"question": "Remove the customer with customer_id 3 from the 'Customers' table.",
		"answer": "DELETE FROM Customers WHERE customer_id = 3;"
	},
	{
		"question": "Insert the username and email from the 'Old_Users' table into the 'Users' table where status is 'Active'.",
		"answer": "INSERT INTO Users (username, email) SELECT username, email FROM Old_Users WHERE status = 'Active';"
	},
	{
		"question": "Update the first_name to 'Jane' and last_name to 'Gomez' for the employee with employee_id 3 in the 'Employees' table.",
		"answer": "UPDATE Employees SET first_name = 'Jane', last_name = 'Gomez' WHERE employee_id = 3;"
	}
]

var current_question = {}
var current_answer = ""
var current_fruit_id = -1

@export var maxStars = 3
var currentStar = 0
var answered_fruits = []
var is_correct_answer = false  # Add a flag to track if the answer is correct

# Flag to check if the star rating system is active
var is_star_rating_active = false

func _ready():
	self.visible = false
	$Panel/Send.pressed.connect(_on_send_pressed)
	starChanged.connect(get_node("/root/Node/StarRatingSystem/StarRatingControl").star_rating_system)

	# Connect the timer's timeout signal to a function
	timer.timeout.connect(_on_timer_timeout)
	timer.one_shot = true  # Ensure it's a one-shot timer (runs once then stops)

# Function to trigger star rating and keep the game paused
func trigger_star_rating():
	is_star_rating_active = true
	get_node("/root/Node/StarRatingSystem/StarRatingControl").visible = true

func _on_send_pressed():
	var user_input = $Panel/LineEdit.text

	if user_input.strip_edges() == "":
		show_error_message("Input cannot be empty!")
		return

	# Check if the user's input matches the correct answer
	if user_input.strip_edges() == current_answer.strip_edges():
		print("Correct answer!")
		currentStar += 1
		starChanged.emit(currentStar)
		show_correct_result("Correct answer!")
	else:
		print("Wrong answer!")
		show_wrong_result("Wrong answer!")

	# Mark the question as answered for the corresponding fruit
	GameManager.mark_question_answered(current_fruit_id)

	# Clear the LineEdit input field
	clear_input()

	# Start the timer to delay closing the panel by 2 seconds (whether correct or wrong)
	timer.start(2)  # Start the timer with a 2-second delay

	# After answering the question, check if all questions are answered and trigger the star rating system
	if GameManager.are_all_questions_answered():
		trigger_star_rating()

# Function to show the question scene
func show_question(fruit_id: int):
	current_fruit_id = fruit_id
	current_question = questions[randi() % questions.size()]
	current_answer = current_question["answer"]

	$Panel/Question.text = current_question["question"]
	self.visible = true
	
	# Only pause the game if the star rating system is not active
	if not is_star_rating_active:
		get_tree().paused = true


# Function to clear the LineEdit text
func clear_input():
	$Panel/LineEdit.text = ""

# Function to show an error message
func show_error_message(message: String):
	ErrorLabel.show_error_message(message)  # Call the ErrorLabel's method to handle the error display

# Function to display the correct result and trigger the CorrectLabel timer
func show_correct_result(message: String):
	CorrectLabel.correct_result(message, "")  # Calls the correct_result function in CorrectLabel

# Function to display the wrong result and trigger the WrongLabel timer
func show_wrong_result(message: String):
	WrongLabel.wrong_result(message, "")  # Calls the wrong_result function in WrongLabel

# Function triggered after the timer timeout to hide the panel
func _on_timer_timeout():
	self.visible = false  # Hide the question panel
	
	# Only unpause the game if the star rating system is not active
	if not is_star_rating_active:
		get_tree().paused = false

