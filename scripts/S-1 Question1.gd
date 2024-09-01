extends Control

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
var current_fruit_id = -1  # Declared the variable here

@export var maxStars = 3
var currentStar = 0
var answered_fruits = []

func _ready():
	self.visible = false
	$Panel/Send.pressed.connect(_on_send_pressed)
	starChanged.connect(get_node("/root/Node/StarRatingSystem/StarRatingControl").star_rating_system)

func _on_send_pressed():
	var user_input = $Panel/LineEdit.text

	# Check if the user's input matches the correct answer
	if user_input.strip_edges() == current_answer.strip_edges():
		print("Correct answer!")
		currentStar += 1
		starChanged.emit(currentStar)
	else:
		print("Wrong answer!")

	# Mark the question as answered for the corresponding fruit
	GameManager.mark_question_answered(current_fruit_id)

	# Clear the LineEdit input field
	clear_input()

	# Close the question window and unfreeze the game
	self.visible = false
	get_tree().paused = false

	# After answering the question, check and trigger star rating system if all are done
	GameManager.check_and_trigger_star_rating()

# Function to show the question scene
func show_question(fruit_id: int):
	current_fruit_id = fruit_id  # Store the ID of the current fruit
	current_question = questions[randi() % questions.size()]
	current_answer = current_question["answer"]

	$Panel/Label.text = current_question["question"]
	self.visible = true
	get_tree().paused = true

# Function to clear the LineEdit text
func clear_input():
	$Panel/LineEdit.text = ""
