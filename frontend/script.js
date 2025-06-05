const baseUrl = "http://localhost:8000/";
const tableInput = document.getElementById("inputTbody");
const searchBtn = document.getElementById("searchBtn");

searchBtn.addEventListener("click", () => {
  searchClass();
});

const searchClass = () => {
  const email = document.querySelector('input[name="email"]').value;

  fetch(baseUrl + "inscriptions/get/?" + new URLSearchParams({ user_email: email }))
    .then((res) => {
      if (!res.ok) throw new Error(`HTTP error! status: ${res.status}`);
      return res.json();
    })
    .then((data) => {
      tableInput.innerHTML = "";

      data.forEach((element) => {
        const row = document.createElement("tr");

        row.innerHTML = `
          <td>${element.time}</td>
          <td>${element.modality}</td>
          <td>${element.instructor}</td>
          <td>${element.duration}</td>
          <td>${element.capacity}</td>
          <td>${generate_opt(element)}</td>
        `;

        tableInput.appendChild(row);
      });
    })
    .catch((error) => {
      console.error("Erro ao buscar aulas:", error);
    });
};

const delete_inscription = (id, time, modality) => {
  const email = document.querySelector('input[name="email"]').value;
  const confirmDelete = confirm(`Tem certeza que deseja deletar a inscrição na aula ${time} - ${modality}?`);
  if (!confirmDelete) return;

  fetch(baseUrl + "inscriptions/delete?" + new URLSearchParams({ inscription_id: id, user_email: email}), {
    method: "DELETE"
  })
    .then((res) => {
      if (!res.ok) throw new Error(`HTTP error! status: ${res.status}`);
      return res.json();
    })
    .then(() => {
      alert("Inscrição deletada com sucesso!");
      searchClass();
    })
    .catch((err) => {
      console.error("Erro ao deletar inscrição:", err);
    });
};

const generate_opt = (inscription) => {
  return `
    <button class="inv" onclick="delete_inscription(${inscription.id}, '${inscription.time}', '${inscription.modality}')">
      <i class="fa fa-trash-o" id="${inscription.id}"></i>
    </button>
  `;
};
