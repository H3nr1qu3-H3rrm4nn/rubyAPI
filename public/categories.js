async function loadCategories() {
  try {
    const response = await fetch(`${API_BASE}/categories`);
    const categories = await response.json();
    const categoriesTableBody = document.querySelector("#categories-table tbody");
    categoriesTableBody.innerHTML = "";

    categories.forEach((category, index) => {
      const row = document.createElement("tr");

      const idCell = document.createElement("td");
      idCell.textContent = index + 1;
      row.appendChild(idCell);

      const nameCell = document.createElement("td");
      nameCell.textContent = category.name;
      row.appendChild(nameCell);

      const descriptionCell = document.createElement("td");
      descriptionCell.textContent = category.description;
      row.appendChild(descriptionCell);

      categoriesTableBody.appendChild(row);
    });
  } catch (err) {
    console.error("Failed to load categories:", err);
  }
}

// Add Category
document.getElementById("add-category-form").addEventListener("submit", async (e) => {
  e.preventDefault();
  const name = document.getElementById("category-name").value;
  const description = document.getElementById("category-description").value;
  const errorMessage = document.getElementById("category-error-message");

  errorMessage.textContent = "";

  try {
    const response = await fetch(`${API_BASE}/categories`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ name, description }),
    });

    if (response.ok) {
      loadCategories();
      document.getElementById("add-category-form").reset();
    } else {
      const errorData = await response.json();
      errorMessage.textContent = JSON.stringify(errorData);
    }
  } catch (err) {
    errorMessage.textContent = "An unexpected error occurred. Please try again.";
    console.error("Error:", err);
  }
});
