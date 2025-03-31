// Select Elements
const taskInput = document.getElementById("taskInput");
const addTaskBtn = document.getElementById("addTaskBtn");
const taskList = document.getElementById("taskList");
const completedTasks = document.getElementById("completedTasks");
const incompleteTasks = document.getElementById("incompleteTasks");

// Load tasks from localStorage on page load
document.addEventListener("DOMContentLoaded", loadTasks);

// Add Task Event
addTaskBtn.addEventListener("click", addTask);
taskInput.addEventListener("keypress", function (event) {
    if (event.key === "Enter") addTask();
});

// Function to Add Task
function addTask() {
    let taskText = taskInput.value.trim(); //Gets the task text and removes extra spaces.
    if (taskText === "") return;

    let task = { text: taskText, completed: false }; //Creates a task object 
    saveTask(task);
    taskInput.value = "";

    loadTasks(); // Reload the UI
}

// Function to Create Task Element in UI
function createTaskElement(task, isCompletedList = false) {
    let li = document.createElement("li"); //Creates a new <li> element (li).
    let span = document.createElement("span"); //Creates a <span> for task text (span.textContent = task.text).
    span.textContent = task.text;

    let deleteBtn = document.createElement("button");
    deleteBtn.textContent = "Delete";
    deleteBtn.classList.add("delete-btn");
    deleteBtn.addEventListener("click", function () {
        deleteTask(task.text);
    });

    li.appendChild(span); //Appends elements inside <li> and returns it.

    if (!isCompletedList) {
        let doneBtn = document.createElement("button");
        doneBtn.textContent = "Complete";
        doneBtn.classList.add("done-btn");
        doneBtn.addEventListener("click", function () {
            completeTask(task.text);
        });
        li.appendChild(doneBtn);
    }

    li.appendChild(deleteBtn);

    return li;
}

// Mark Task as Completed & Move to Completed Tasks
function completeTask(taskText) {
    let tasks = JSON.parse(localStorage.getItem("tasks")) || [];   //Converts the stored string into a JavaScript array.

    tasks.forEach(task => {
        if (task.text === taskText) {
            task.completed = true;
        }
    });

    localStorage.setItem("tasks", JSON.stringify(tasks));  //Converts the array back to a string.
    loadTasks(); // Reload the UI
}

// Delete Task Permanently
function deleteTask(taskText) {
    let tasks = JSON.parse(localStorage.getItem("tasks")) || [];
    tasks = tasks.filter(task => task.text !== taskText); //Filters out the deleted task using tasks.filter().
    localStorage.setItem("tasks", JSON.stringify(tasks));

    loadTasks(); // Reload the UI
}

// Save Task to localStorage
function saveTask(task) {
    let tasks = JSON.parse(localStorage.getItem("tasks")) || [];
    tasks.push(task);
    localStorage.setItem("tasks", JSON.stringify(tasks));
}

// Load Tasks from localStorage & Update UI
function loadTasks() {
    taskList.innerHTML = ""; // Clear UI
    completedTasks.innerHTML = ""; // Clear Completed Tasks
    incompleteTasks.innerHTML = ""; // Clear Incomplete Tasks

    let tasks = JSON.parse(localStorage.getItem("tasks")) || [];

    tasks.forEach(task => {
        if (task.completed) {
            let completedLi = createTaskElement(task, true);
            completedTasks.appendChild(completedLi);
        } else {
            let todoLi = createTaskElement(task);
            taskList.appendChild(todoLi);
            incompleteTasks.appendChild(todoLi.cloneNode(true)); //creates a copy of the task to display in incomplete tasks storage.
        }
    });
}
