// Select all list items
const items = document.querySelectorAll(".draggable");
const list = document.getElementById("sortable-list");

// Add drag event listeners to each item
items.forEach(item => {
    item.addEventListener("dragstart", dragStart);
    item.addEventListener("dragover", dragOver);
    item.addEventListener("drop", drop);
    item.addEventListener("dragend", dragEnd);
});

let draggedItem = null; // Holds the item being dragged

// When dragging starts
function dragStart(event) {
    draggedItem = event.target; //Stores the dragged item in draggedItem.
    event.target.classList.add("dragging"); //Adds a "dragging" class to change appearance. 
}

// When an item is over another item
function dragOver(event) {
    event.preventDefault(); // Allow dropping
    const targetItem = event.target; // Get the item being hovered over

    // Check if the target is a draggable item and not the same as the dragged item
    if (targetItem.classList.contains("draggable") && targetItem !== draggedItem) {
        let itemsArray = Array.from(list.children); // Convert list items to an array
        let draggedIndex = itemsArray.indexOf(draggedItem); // Get index of dragged item
        let targetIndex = itemsArray.indexOf(targetItem); // Get index of hovered item

        // Swap positions
        if (draggedIndex < targetIndex) {
            list.insertBefore(draggedItem, targetItem.nextSibling); //Moves the dragged item after the target item.     
        } else {
            list.insertBefore(draggedItem, targetItem); //Moves the dragged item before the target ite
        }
    }
}

// When an item is dropped
function drop(event) {
    event.preventDefault(); // Prevent default behavior
}

// When dragging ends
function dragEnd() {
    draggedItem.classList.remove("dragging");
    draggedItem = null;
}
