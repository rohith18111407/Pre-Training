// Select Elements
const thumbnails = document.querySelectorAll(".thumbnail"); //selects all elements that match a given CSS selector and returns a NodeList 
const lightbox = document.getElementById("lightbox");
const lightboxImg = document.getElementById("lightbox-img");
const closeBtn = document.querySelector(".close");

// Open Lightbox on Thumbnail Click
thumbnails.forEach(thumbnail => {
    thumbnail.addEventListener("click", function () {
        let fullImageSrc = this.getAttribute("data-full");  // Get full image path
        lightboxImg.src = fullImageSrc;  // Update lightbox image
        lightbox.classList.add("active");  // Show lightbox
    });
});

// Close Lightbox on "×" Click
closeBtn.addEventListener("click", function () {
    lightbox.classList.remove("active");  // Hide lightbox
    lightboxImg.src = "";  // Clear image to avoid flickering
});

// Close Lightbox when Clicking Outside the Image
lightbox.addEventListener("click", function (e) {
    if (e.target !== lightboxImg) {
        lightbox.classList.remove("active");
        lightboxImg.src = "";  // Clear image
    }
});

// Close Lightbox with "Esc" Key
document.addEventListener("keydown", function (e) {
    if (e.key === "Escape") {
        lightbox.classList.remove("active");
        lightboxImg.src = "";  // Clear image
    }
});
