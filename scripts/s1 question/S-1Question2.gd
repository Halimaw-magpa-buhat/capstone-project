extends Control

@onready var ErrorLabel = $Panel/ErrorLabel
@onready var CorrectLabel = $Panel/CorrectLabel
@onready var WrongLabel = $Panel/WrongLabel
@onready var timer = $Timer  

signal starChanged

var questions = [
	{
		"question": "You have a table named 'Employees' with the following columns: employee_id, first_name, last_name, department, salary. Write an SQL query to find the names of all employees who work in the 'Marketing' department.",
		"answer": "SELECT first_name, last_name FROM Employees WHERE department = 'Marketing';"
	},
	{
		"question": "You have a table named 'Employees' with the following columns: employee_id, first_name, last_name, department, salary. Write an SQL query to find the first_name, last_name, and salary of employees who earn more than $50,000.",
		"answer": "SELECT first_name, last_name, salary FROM Employees WHERE salary > 50000;"
	},
	{
		"question": "You have a table named 'Employees' with the following columns: employee_id, first_name, last_name, department, salary. Write an SQL query to find the highest salary in the Employees table.",
		"answer": "SELECT MAX(salary) FROM Employees;"
	},
	{
		"question": "You have a table named 'Employees' with the following columns: employee_id, first_name, last_name, department, salary. Write an SQL query to list all employees' first_name and last_name, sorted by last_name in alphabetical order.",
		"answer": "SELECT first_name, last_name FROM Employees ORDER BY last_name ASC;"
	},
	{
		"question": "You have a table named 'Employees' with the following columns: employee_id, first_name, last_name, department, salary. Write an SQL query to find all employees with the last name 'Smith'.",
		"answer": "SELECT first_name, last_name FROM Employees WHERE last_name = 'Smith';"
	},
	{
		"question": "You have a table named 'Employees' with the following columns: employee_id, first_name, last_name, department, salary. Write an SQL query to update the salary of the employee with employee_id 10 to $55,000.",
		"answer": "UPDATE Employees SET salary = 55000 WHERE employee_id = 10;"
	},
	{
		"question": "You have a table named 'Employees' with the following columns: employee_id, first_name, last_name, department, salary. Write an SQL query to delete all employees who work in the 'HR' department.",
		"answer": "DELETE FROM Employees WHERE department = 'HR';"
	},
	{
		"question": "You have a table named 'Employees' with the following columns: employee_id, first_name, last_name, department, salary. Write an SQL query to insert a new employee into the Employees table with the following details: employee_id = 101, first_name = 'John', last_name = 'Doe', department = 'IT', salary = 70000.",
		"answer": "INSERT INTO Employees (employee_id, first_name, last_name, department, salary) VALUES (101, 'John', 'Doe', 'IT', 70000);"
	},
	{
		"question": "You have a table named 'Employees' with the following columns: employee_id, first_name, last_name, department, salary. Write an SQL query to find employees who work in either the 'Finance' or 'IT' departments.",
		"answer": "SELECT first_name, last_name, department FROM Employees WHERE department IN ('Finance', 'IT');"
	},
	{
		"question": "You have a table named 'Employees' with the following columns: employee_id, first_name, last_name, department, salary. Write an SQL query to set the salary of all employees with a NULL salary to $40,000.",
		"answer": "UPDATE Employees SET salary = 40000 WHERE salary IS NULL;"
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

	$Panel/Label.text = current_question["question"]
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

