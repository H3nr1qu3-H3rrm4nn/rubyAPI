const API_BASE = "http://localhost:3000";

// Carrega os usuários ao carregar a página
document.addEventListener("DOMContentLoaded", () => {
  loadUsers();
  loadCategories();
  document.querySelector(".tab-button").click();
});

// Tabs functionality
document.querySelectorAll(".tab-button").forEach((button) => {
  button.addEventListener("click", () => {
    // Remove active class from all buttons and content
    document.querySelectorAll(".tab-button").forEach((btn) => btn.classList.remove("active"));
    document.querySelectorAll(".tab-content").forEach((section) => section.classList.remove("active"));

    // Add active class to the clicked button and corresponding content
    button.classList.add("active");
    const tabId = button.getAttribute("data-tab");
    document.getElementById(tabId).classList.add("active");
  });
});

document.getElementById("add-user-form").addEventListener("submit", async (e) => {
  e.preventDefault();
  const name = document.getElementById("user-name").value;
  const email = document.getElementById("user-email").value;
  const errorMessage = document.getElementById("user-error-message");

  // Limpa a mensagem de erro anterior
  errorMessage.textContent = "";

  try {
    const response = await fetch(`${API_BASE}/users`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ name, email }),
    });

    if (response.ok) {
      loadUsers();
      document.getElementById("add-user-form").reset();
    } else {
      const errorData = await response.json();
      errorMessage.textContent = JSON.stringify(errorData);
    }
  } catch (err) {
    errorMessage.textContent = "An unexpected error occurred. Please try again.";
    console.error("Error:", err);
  }
});
// Carrega usuários e insere na tabela
async function loadUsers() {
  try {
    const response = await fetch(`${API_BASE}/users`);
    const users = await response.json();
    const usersTableBody = document.querySelector("#users-table tbody");
    usersTableBody.innerHTML = ""; // Limpa a tabela antes de inserir

    users.forEach((user, index) => {
      const row = document.createElement("tr");

      // Número sequencial
      const idCell = document.createElement("td");
      idCell.textContent = index + 1;
      row.appendChild(idCell);

      // Nome
      const nameCell = document.createElement("td");
      nameCell.textContent = user.name;
      row.appendChild(nameCell);

      // E-mail
      const emailCell = document.createElement("td");
      emailCell.textContent = user.email;
      row.appendChild(emailCell);

      usersTableBody.appendChild(row);
    });
  } catch (err) {
    console.error("Failed to load users:", err);
  }
}
