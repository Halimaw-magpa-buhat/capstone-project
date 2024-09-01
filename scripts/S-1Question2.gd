extends Control

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
