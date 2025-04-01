// Select the main content container
const app = document.getElementById("app");

// Define routes as key-value pairs (URL hash -> Content)
const routes = {
    "#SUVs": `
            <h2>SUVs (Sport Utility Vehicles)</h2>
            <h3>Overview</h3>
            <p>SUVs are known for their ruggedness, high ground clearance, spacious interiors, and off-road capability. They offer a commanding road presence, making them popular among Indian families and adventure seekers.</p>
            <h3>Key Features</h3>
            <ul>
                <li>High seating position for better visibility.</li>
                <li>More space for passengers and luggage.</li>
                <li>Advanced safety features like multiple airbags and ABS.</li>
                <li>Available in compact, mid-size, and full-size variants.</li>
            </ul>
            <h3>Popular Cars in India</h3>
            <table>
                <tr>
                  <th>Model</th>
                  <th>Engine Options</th>
                  <th>Price Range</th>
                </tr>
                <tr>
                  <td>Tata Harrier</td>
                  <td>Diesel</td>
                  <td>₹15 - ₹25 lakh</td>
                </tr>
                <tr>
                    <td>Mahindra XUV700</td>
                    <td>Petrol/Diesel</td>
                    <td>₹14 - ₹28 lakh</td>
                  </tr>
                  <tr>
                    <td>Hyundai Creta</td>
                    <td>Petrol/Diesel</td>
                    <td>₹11 - ₹20 lakh</td>
                  </tr>
                  <tr>
                    <td>Toyota Fortuner</td>
                    <td>Diesel</td>
                    <td>₹33 - ₹51 lakh</td>
                  </tr>
                  <tr>
                    <td>Maruti Suzuki Grand Vitara</td>
                    <td>Petrol/Hybrid</td>
                    <td>₹10 - ₹20 lakh</td>
                  </tr>
              </table>
            `,
    "#Sedans": `
            <h2>Sedans</h2>
            <h3>Overview</h3>
            <p>Sedans offer comfort, sleek design, and better fuel efficiency, making them a great choice for city driving and long highway journeys. They are perfect for those who value luxury and smooth driving experience.</p>
            <h3>Key Features</h3>
            <ul>
                <li>Aerodynamic design for better fuel efficiency.</li>
                <li>Spacious seating with premium interiors.</li>
                <li>Balanced ride quality with advanced suspension.</li>
                <li>High-end technology like touchscreen infotainment and climate control.</li>
            </ul>
            <h3>Popular Cars in India</h3>
            <table>
                <tr>
                  <th>Model</th>
                  <th>Engine Options</th>
                  <th>Price Range</th>
                </tr>
                <tr>
                  <td>Honda City</td>
                  <td>Petrol</td>
                  <td>₹12 - ₹18 lakh</td>
                </tr>
                <tr>
                    <td>Hyundai Verna</td>
                    <td>Petrol</td>
                    <td>₹11 - ₹18 lakh</td>
                  </tr>
                  <tr>
                    <td>Skoda Slavia</td>
                    <td>Petrol</td>
                    <td>₹11 - ₹19 lakh</td>
                  </tr>
                  <tr>
                    <td>Toyota Camry Hybrid</td>
                    <td>	Hybrid (Petrol)</td>
                    <td>₹46 lakh</td>
                  </tr>
                  <tr>
                    <td>Maruti Suzuki Ciaz</td>
                    <td>Petrol</td>
                    <td>₹9 - ₹13 lakh</td>
                  </tr>
              </table>
            `,
    "#EVs": `
            <h2>Electric Vehicles (EVs)</h2>
            <h3>Overview</h3>
            <p>Electric vehicles (EVs) are the future of sustainable transportation, offering zero emissions, low running costs, and advanced technology. With government incentives and an expanding charging infrastructure, EV adoption is on the rise in India.</p>
            <h3>Key Features</h3>
            <ul>
                <li>No fuel costs, lower maintenance.</li>
                <li>Instant torque for quick acceleration.</li>
                <li>Advanced battery technology with long range.</li>
                <li>Smart connectivity and autonomous driving features.</li>
            </ul>
            <h3>Popular Cars in India</h3>
            <table>
                <tr>
                  <th>Model</th>
                  <th>Range</th>
                  <th>Price Range</th>
                </tr>
                <tr>
                  <td>Tata Nexon EV</td>
                  <td>465 km</td>
                  <td>₹15 - ₹20 lakh</td>
                </tr>
                <tr>
                    <td>MG ZS EV</td>
                    <td>461 km</td>
                    <td>₹23 - ₹28 lakh</td>
                  </tr>
                  <tr>
                    <td>Hyundai Ioniq 5</td>
                    <td>631 km</td>
                    <td>₹45 lakh</td>
                  </tr>
                  <tr>
                    <td>BYD Atto 3</td>
                    <td>521</td>
                    <td>₹34 lakh</td>
                  </tr>
                  <tr>
                    <td>Kia EV6</td>
                    <td>708 km</td>
                    <td>₹60 lakh</td>
                  </tr>
              </table>
            `,
    "#SportsCars": `
            <h2>Sports Cars</h2>
            <h3>Overview</h3>
            <p>Sports cars are designed for high performance, speed, and luxury. With their aerodynamic shape, powerful engines, and advanced handling, these cars deliver an unmatched driving experience.</p>
            <h3>Key Features</h3>
            <ul>
                <li>High horsepower and top speeds.</li>
                <li>Sleek, aerodynamic design for better performance.</li>
                <li>Advanced braking and suspension systems.</li>
                <li>Luxurious, driver-focused interiors.</li>
            </ul>
            <h3>Popular Cars in India</h3>
            <table>
                <tr>
                  <th>Model</th>
                  <th>Engine Options</th>
                  <th>Price Range</th>
                </tr>
                <tr>
                  <td>Porsche 911</td>
                  <td>Diesel</td>
                  <td>₹1.9 - ₹3.5 crore</td>
                </tr>
                <tr>
                    <td>BMW M340i xDrive</td>
                    <td>Petrol/Diesel</td>
                    <td>₹75 lakh</td>
                  </tr>
                  <tr>
                    <td>Audi RS5 Sportback</td>
                    <td>Petrol/Diesel</td>
                    <td>₹1.19 crore</td>
                  </tr>
                  <tr>
                    <td>Jaguar F-Type</td>
                    <td>Diesel</td>
                    <td>₹1 - ₹1.5 crore</td>
                  </tr>
                  <tr>
                    <td>Lamborghini Huracán</td>
                    <td>Petrol/Hybrid</td>
                    <td>₹3 - ₹5 crore</td>
                  </tr>
              </table>
            `
};

// Function to update content based on hash
function loadContent() {
    let hash = window.location.hash || "#SUVs"; // Default to SUVs if no hash. Gets the current hash (window.location.hash).
    app.innerHTML = routes[hash] || "<h1>404 - Page Not Found</h1>"; // Display content or 404 message
}

// Listen for hash changes and update content
window.addEventListener("hashchange", loadContent);
window.addEventListener("load", loadContent); // Load correct page on refresh
