const apiKey = "021dc1c0017f2f07028d46d60e8cfa9e"; // API Key
const cityInput = document.getElementById("cityInput");
const searchBtn = document.getElementById("searchBtn");
const weatherInfo = document.getElementById("weatherInfo");
const cityName = document.getElementById("cityName");
const temperature = document.getElementById("temperature");
const humidity = document.getElementById("humidity");
const description = document.getElementById("description");
const weatherIcon = document.getElementById("weatherIcon");
const errorMessage = document.getElementById("errorMessage");

// Fetch weather data when the button is clicked
searchBtn.addEventListener("click", fetchWeather);
cityInput.addEventListener("keypress", function(event) {
    if (event.key === "Enter") {
        fetchWeather();
    }
});

function fetchWeather() {
    const city = cityInput.value.trim(); //removes any extra spaces from the input.
    if (city === "") {
        showError("Please enter a city name.");
        return;
    }

    const apiUrl = `https://api.openweathermap.org/data/2.5/weather?q=${city}&units=metric&appid=${apiKey}`; //q=${city} → Querying weather for the entered city.

    fetch(apiUrl)
    // If the response is not OK (e.g., wrong city name), an error is thrown. Otherwise, the JSON response is extracted.
        .then(response => {
            if (!response.ok) {
                throw new Error("City not found");
            }
            return response.json();
        })
    // Passes the JSON weather data to updateWeatherInfo() to update the UI.
        .then(data => {
            updateWeatherInfo(data);
        })

    // If any error occurs (e.g., invalid city, network failure), it calls showError() to display the error message.
        .catch(error => {
            showError(error.message);
        });
}

function updateWeatherInfo(data) {
    errorMessage.classList.add("hidden");
    weatherInfo.classList.remove("hidden");

    cityName.textContent = ` ${data.name}, ${data.sys.country}`;
    temperature.textContent = ` Temperature: ${data.main.temp}°C`;
    humidity.textContent = ` Humidity: ${data.main.humidity}%`;
    description.textContent = ` Condition: ${data.weather[0].description}`;
    weatherIcon.src = `https://openweathermap.org/img/wn/${data.weather[0].icon}.png`;
}

function showError(message) {
    errorMessage.textContent = message;
    errorMessage.classList.remove("hidden");
    weatherInfo.classList.add("hidden");
}
