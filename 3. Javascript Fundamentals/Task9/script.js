document.addEventListener("DOMContentLoaded", () => {
    const content = document.getElementById("content");
    const loading = document.getElementById("loading");

    let itemCount = 0; // Start from 0
    const itemsPerLoad = 5; // Load 5 items at a time
    let isLoading = false; // Flag to prevent multiple loading

    // Function to load items
    function loadItems(count) {
        for (let i = 0; i < count; i++) {
            let item = document.createElement("div");
            item.classList.add("item");
            item.textContent = `Item ${itemCount + 1}`;
            content.appendChild(item);
            itemCount++; // Increment the item count for each new item
        }
    }

    // Load initial items (10 items initially)
    loadItems(10);

    // Function to detect scroll near the bottom
    window.addEventListener("scroll", () => {
        // Check if we are near the bottom of the page and not already loading
        if (!isLoading && (window.innerHeight + window.scrollY >= document.body.offsetHeight - 100)) {
            isLoading = true; // Set flag to indicate loading is in progress
            loading.style.display = "block"; // Show loading message

            // Simulate data fetching (with timeout to simulate delay)
            setTimeout(() => {
                loadItems(itemsPerLoad); // Load 5 more items
                loading.style.display = "none"; // Hide loading after items are added
                isLoading = false; // Reset the flag to allow next load
            }, 1000); // Simulate delay of 1 second
        }
    });
});

// window.innerHeight: This is the height of the browser's viewport, i.e., the visible part of the web page (in pixels).
// window.scrollY: This is the vertical scroll position, i.e., the number of pixels the page has been scrolled vertically from the top.
// window.innerHeight + window.scrolly = the total amount of vertical space from the top of the document that is currently visible to the user

// document.body.offsetHeight is the total height of the entire document (or webpage), including the content that is not currently visible in the viewport.
// Subtracting 100 from document.body.offsetHeight means that we are setting a threshold 100 pixels before the bottom of the page.


