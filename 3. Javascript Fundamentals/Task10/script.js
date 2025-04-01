document.addEventListener("DOMContentLoaded", () => {

    // The DOMContentLoaded event ensures that the JavaScript runs only after the HTML page is fully loaded.

    const productsContainer = document.getElementById("products");
    const cartContainer = document.getElementById("cart-items");
    const subtotalElement = document.getElementById("subtotal");
    const taxElement = document.getElementById("tax");
    const totalElement = document.getElementById("total");
    const cartCountElement = document.getElementById("cart-count");

    // The cart data is saved in localStorage so that when the user refreshes the page, their items don’t disappear. JSON.parse() converts the stored string back into a JavaScript array.
    let cart = JSON.parse(localStorage.getItem("cart")) || [];

    // Sample product data
    const products = [
        { id: 1, name: "Asus Zenbook 14", price: 89990, category: "electronics", image: "https://i.ytimg.com/vi/nBnrblcilPU/maxresdefault.jpg", description: "Great ultraportable laptops. The ASUS has a sturdier build, a wider port selection, and a better touchpad and webcam. Also, it's available with faster Intel Meteor Lake CPUs and faster 120Hz OLED displays." },
        { id: 2, name: "Samsung S25 Ultra", price: 165999, category: "electronics", image: "https://i.ytimg.com/vi/_9E9NGLqoWo/maxresdefault.jpg", description: "The S25 Ultra gives slight overhaul to the existing design language of the S Ultra phones: the camera module remains mostly the same so the phone is instantly recognizable as a Samsung phone from the back." },
        { id: 3, name: "Bowers & Wilkins (B&W) Px8 McLaren Edition", price: 136000, category: "electronics", image: "https://d2cdo4blch85n8.cloudfront.net/wp-content/uploads/2022/12/Bowers-Wilkins-Px8-McLaren-Edition-Headphones-3-1024x683.jpg", description: "Bowers & Wilkins' pricing reflects their commitment to using top-notch materials and meticulous craftsmanship, resulting in products known for their acoustic excellence and artisanal quality. Each element is carefully chosen for its acoustic properties and aesthetic appeal, ensuring a superior audio experience" },
        { id: 4, name: "Zara T-shirt", price: 2499, category: "fashion", image: "https://i.pinimg.com/736x/f2/f5/e3/f2f5e3b025a9512536d13240bc2b14cf.jpg", description: " High quality T-shirts start with 100% high quality, pre-shrunk cotton. That means no itchy synthetic fibers, and no shrinking or shape-changing after your T-shirt has gone through the wash." },
        { id: 5, name: "Sofa", price: 60000, category: "home", image: "https://foter.com/photos/241/jackson-furniture-belmont-chenille-sofa-1.jpg", description: "Luxury Sofa" }
    ];

    // Render Products - dynamically displays products based on search and filter criteria.
    function renderProducts(filterText = "", category = "all") {
        productsContainer.innerHTML = "";
        products.forEach(product => {
            if (
                (category === "all" || product.category === category) &&
                (filterText === "" || product.name.toLowerCase().includes(filterText.toLowerCase()))
            ) {
                const productElement = document.createElement("div");
                productElement.classList.add("product");
                productElement.innerHTML = `
                    <img src="${product.image}" alt="${product.name}">
                    <h3>${product.name}</h3>
                    <p>${product.description}</p>
                    <p>Price: Rs.${product.price}</p>
                    <button onclick="addToCart(${product.id})">Add to Cart</button>
                `;
                productsContainer.appendChild(productElement);
            }
        });
    }

    // Search & Filter
    window.filterProducts = () => {
        const searchText = document.getElementById("search").value;
        const category = document.getElementById("category-filter").value;
        renderProducts(searchText, category);
    };

    // Add to cart
    window.addToCart = (productId) => {
        const product = products.find(p => p.id === productId);
        const existingItem = cart.find(item => item.id === productId);

        if (existingItem) {
            existingItem.quantity++;
        } else {
            cart.push({ ...product, quantity: 1 });
        }

        updateCart();
    };

    // Remove from cart
    window.removeFromCart = (productId) => {
        cart = cart.filter(item => item.id !== productId);
        updateCart();
    };

    // Update cart UI & localStorage
    function updateCart() {
        cartContainer.innerHTML = "";
        let subtotal = 0;

        cart.forEach(item => {
            subtotal += item.price * item.quantity;
            const cartItem = document.createElement("div");
            cartItem.classList.add("cart-item");
            cartItem.innerHTML = `
                <p>${item.name} x ${item.quantity} - $${item.price * item.quantity}</p>
                <button onclick="removeFromCart(${item.id})">Remove</button>
            `;
            cartContainer.appendChild(cartItem);
        });

        const tax = subtotal * 0.05;
        const total = subtotal + tax;

        subtotalElement.textContent = subtotal.toFixed(2);
        taxElement.textContent = tax.toFixed(2);
        totalElement.textContent = total.toFixed(2);

        cartCountElement.textContent = cart.reduce((sum, item) => sum + item.quantity, 0);

        localStorage.setItem("cart", JSON.stringify(cart));
    }

    renderProducts();
    updateCart();
});
