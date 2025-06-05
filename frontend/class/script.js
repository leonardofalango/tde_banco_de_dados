const baseUrl = "http://localhost:8000";
const aulasBody = document.getElementById("aulasBody");
const modal = document.getElementById("modal");
const closeModal = document.getElementById("closeModal");
const modalInfo = document.getElementById("modalInfo");
const emailInput = document.getElementById("emailInput");
const confirmBtn = document.getElementById("confirmBtn");

let selectedAulaId = null;
const get_capacity = (aula) => {
  const totalVagas = aula.capacidade;
  const inscritos = aula.inscricoes || 0;
  return `
    <span style="color: ${inscritos >= totalVagas ? 'red' : 'green'};">
      ${inscritos}
    </span>/
    <span>
      ${totalVagas}
    </span>`;
}
// Buscar aulas disponíveis
fetch(`${baseUrl}/classes/getAll`)
  .then(response => response.json())
  .then(data => {
    data.forEach(aula => {
      const row = document.createElement("tr");

      row.innerHTML = `
        <td>${aula.horario}</td>
        <td>${aula.modalidade}</td>
        <td>${aula.instrutor}</td>
        <td>${aula.duracao}</td>
        <td>${get_capacity(aula)}</td>
        <td><button onclick="openModal(${aula.id}, '${aula.modalidade}', '${aula.horario}')">Inscrever-se</button></td>
      `;

      aulasBody.appendChild(row);
    });
  })
  .catch(error => console.error("Erro ao buscar aulas:", error));

function openModal(id, modalidade, horario) {
  selectedAulaId = id;
  modalInfo.textContent = `Modalidade: ${modalidade} | Horário: ${horario}`;
  emailInput.value = "";
  modal.style.display = "block";
}

closeModal.onclick = function() {
  modal.style.display = "none";
};

confirmBtn.onclick = function() {
  const email = emailInput.value.trim();
  if (!email) {
    alert("Por favor, insira um e-mail válido.");
    return;
  }

  fetch(`${baseUrl}/classes/create`, {
    method: "POST",
    headers: {
      "Content-Type": "application/json"
    },
    body: JSON.stringify({
      fk_Aula_ID_Aula: selectedAulaId,
      email: email
    })
  })
  .then(response => {
    console.log("Resposta do servidor:", response);
    if (response.ok) {
      alert("Inscrição realizada com sucesso!");
      modal.style.display = "none";
    } else {
      alert(`Erro ao enviar inscrição: ${response.detail || "Erro desconhecido"}`);
    }
  })
  .catch(error => {
    console.error("Erro ao enviar inscrição:", error);
    alert(`Erro ao enviar inscrição: ${error.message}`);
  });
};

// Fechar modal ao clicar fora
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
};
