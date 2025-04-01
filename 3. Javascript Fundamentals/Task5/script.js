// Quiz questions
const quizData = [
    {
        question: "What is the capital of Tamil Nadu?",
        options: ["Chennai", "Pondicherry", "Coimbatore", "Madurai"],
        answer: "Chennai"
    },
    {
        question: "Least polluted city of Tamil Nadu",
        options: ["Ooty", "Coimbatore", "Madurai", "Tirunelveli"],
        answer: "Tirunelveli"
    },
    {
        question: "Which city is known as 'Pearl City'",
        options: ["Chennai", "Tuticorin", "Kannyakumari", "Rameshwaram"],
        answer: "Tuticorin"
    },
    {
        question: "Which is famous in Tuticorin?",
        options: ["Tshirt", "Macroon", "Halwa", "Gulab Jamun"],
        answer: "Macroon"
    }
];

// Select Elements
const questionElement = document.getElementById("question");
const optionsContainer = document.getElementById("options-container");
const nextButton = document.getElementById("nextBtn");
const scoreElement = document.getElementById("score");

let currentQuestionIndex = 0;
let score = 0;

// Function to load a question
function loadQuestion() {
    let currentQuestion = quizData[currentQuestionIndex];
    
    questionElement.textContent = currentQuestion.question;
    optionsContainer.innerHTML = ""; // Clear previous options

    currentQuestion.options.forEach(option => {
        let button = document.createElement("button");
        button.textContent = option;
        button.classList.add("option");
        button.addEventListener("click", () => selectAnswer(option));
        optionsContainer.appendChild(button); //Dynamically creates buttons for each answer choice and adds a click event to handle selection.
    });
}

// Function to handle answer selection
function selectAnswer(selectedOption) {
    let correctAnswer = quizData[currentQuestionIndex].answer;
    
    if (selectedOption === correctAnswer) {
        score++; // Increase score if correct
    }

    // Move to the next question
    currentQuestionIndex++;

    if (currentQuestionIndex < quizData.length) {
        loadQuestion(); // Load next question
    } else {
        showScore(); // Show final score if quiz is over
    }
}

// Function to show the final score
function showScore() {
    questionElement.textContent = "Quiz Completed!";
    optionsContainer.innerHTML = ""; // Clear options
    nextButton.classList.add("hidden"); // Hide the Next button
    scoreElement.textContent = `Your Score: ${score} / ${quizData.length}`;
    scoreElement.classList.remove("hidden"); // Show score
}

// Load first question when page loads
loadQuestion();
