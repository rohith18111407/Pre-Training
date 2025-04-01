// Select elements
const chatBox = document.getElementById("chatBox");
const userInput = document.getElementById("userInput");
const sendBtn = document.getElementById("sendBtn");

// Predefined bot responses
const botReplies = [
    "Hello! How can I help you?",
    "I'm just a bot, but I'm here to chat!",
    "That's interesting! Tell me more.",
    "Can you elaborate?",
    "I love chatting with you!",
    "What's on your mind?",
    "Hope you're having a great day!"
];

// Add event listener to the send button
sendBtn.addEventListener("click", sendMessage);
userInput.addEventListener("keypress", function(event) {
    if (event.key === "Enter") sendMessage();
});

// Function to send user message
function sendMessage() {
    const messageText = userInput.value.trim();
    if (messageText === "") return;

    addMessage(messageText, "user-message"); // Calls addMessage() to display the user's message in the chat.
    userInput.value = "";

    // Simulate bot response after 1 second
    setTimeout(() => {
        const botReply = botReplies[Math.floor(Math.random() * botReplies.length)];
        addMessage(botReply, "bot-message");
    }, 1000);
}

// Function to add message to chat window
function addMessage(text, className) {
    const messageDiv = document.createElement("div");
    messageDiv.classList.add("message", className);
    messageDiv.innerHTML = `<span>${text}</span> <br> <small>${getTimeStamp()}</small>`;
    
    chatBox.appendChild(messageDiv);
    chatBox.scrollTop = chatBox.scrollHeight; // Auto-scroll to the latest message
}

// Function to get current time in HH:MM format
function getTimeStamp() {
    const now = new Date();
    //string.padStart(targetLength, padString) -> targetLength → The total desired length of the final string after padding. padString (optional) → The string used for padding. If omitted, spaces (" ") are used by default.
    //09:30 instead of 9:30

    return now.getHours().toString().padStart(2, "0") + ":" + now.getMinutes().toString().padStart(2, "0");
}
