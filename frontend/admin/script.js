const baseUrl = "http://localhost:8000/";
const tableInput = document.getElementById("inputTbody");
const modal = document.getElementById("modal");
const closeModal = document.getElementById("closeModal");

let page_num = 0;

const search_users = (page_number = 0) => {
  fetch(baseUrl + "user/get_all?" + new URLSearchParams({ page: page_number }))
    .then((res) => {
      if (!res.ok) throw new Error(`HTTP error! status: ${res.status}`);
      return res.json();
    })
    .then((data) => {
      tableInput.innerHTML = "";
      data.forEach(user => add_user_row(user));
    })
    .catch((error) => {
      console.error("Erro ao buscar usuários:", error);
    });
};


closeModal.onclick = function() {
  modal.style.display = "none";
};

function show_address(id, logradouro, cidade, cep, complemento, name) {
  selectedAulaId = id;
  modalInfo.innerHTML = `<h2>Endereço de ${name}</h2>
    <p><strong>Logradouro:</strong> ${logradouro}</p>
    <p><strong>Cidade:</strong> ${cidade}</p>
    <p><strong>CEP:</strong> ${cep}</p>
    <p><strong>Complemento:</strong> ${complemento}</p>`;
  
  modal.style.display = "block";
}


const add_user_row = (user) => {
  const row = document.createElement("tr");
  console.log("USER", user.endereco);
  row.innerHTML = `
    <td><input type="text" value="${user.name}" /></td>
    <td><input type="text" value="${user.email}" /></td>
    <td><input type="date" value="${user.birth_date}" /></td>
    <td><input type="text" value="${user.contact}" /></td>
    <td><input type="text" value="${user.cpf}" /></td>
    <td>
      <button type="button" onclick="show_address(
      '${user.endereco.endereco_pk}','${user.endereco.logradouro}','${user.endereco.cidade}','${user.endereco.cep}','${user.endereco.complemento}', '${user.name}')"
      )" value="${user.endereco_id}" class="bntEndereco">
        Mostrar Endereço <i class="fa fa-map-marker"></i>
      </button>
    </td>
    <td>
      <button onclick="update_user(this, ${user.id})"><i class="fa fa-save"></i></button>
      <button onclick="delete_user(${user.id})"><i class="fa fa-trash-o"></i></button>
    </td>
  `;

  tableInput.appendChild(row);
};

const add_new_user_row = () => {
  const row = document.createElement("tr");
  row.innerHTML = `
    <td><input type="text" placeholder="Nome" /></td>
    <td><input type="text" placeholder="Email" /></td>
    <td><input type="date" /></td>
    <td><input type="text" placeholder="Celular" /></td>
    <td><input type="text" placeholder="CPF" /></td>
    <td><input type="number" placeholder="Endereço ID" value="1" /></td>
    <td>
      <button onclick="create_user(this)"><i class="fa fa-plus"></i></button>
    </td>
  `;
  tableInput.appendChild(row);
};

const create_user = (btn) => {
  const inputs = btn.parentNode.parentNode.querySelectorAll("input");
  const [name, email, birth_date, contact, cpf, endereco_id] = [...inputs].map(input => input.value);

  fetch(baseUrl + "user/create", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ name, email, birth_date, contact, cpf, endereco_id: Number(endereco_id) })
  })
  .then((res) => {
    if (!res.ok) throw new Error(`Erro: ${res.status}`);
    return res.json();
  })
  .then(() => {
    alert("Usuário criado com sucesso!");
    search_users();
  })
  .catch((err) => {
    console.error("Erro ao criar usuário:", err);
  });
};

const update_user = (btn, id) => {
  const inputs = btn.parentNode.parentNode.querySelectorAll("input");
  const [name, email, birth_date, contact, cpf, endereco_id] = [...inputs].map(input => input.value);

  fetch(baseUrl + "user/update", {
    method: "PUT",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ id, name, email, birth_date, contact, cpf, endereco_id: Number(endereco_id) })
  })
  .then((res) => {
    if (!res.ok) throw new Error(`Erro: ${res.status}`);
    return res.json();
  })
  .then(() => {
    alert("Usuário atualizado com sucesso!");
    search_users();
  })
  .catch((err) => {
    console.error("Erro ao atualizar usuário:", err);
  });
};

const delete_user = (user_id) => {
  if (!confirm("Tem certeza que deseja deletar este usuário?")) return;

  fetch(baseUrl + "user/delete?" + new URLSearchParams({ user_id }), {
    method: "DELETE"
  })
  .then((res) => {
    if (!res.ok) throw new Error(`Erro: ${res.status}`);
    return res.json();
  })
  .then(() => {
    alert("Usuário deletado com sucesso!");
    search_users();
  })
  .catch((err) => {
    console.error("Erro ao deletar usuário:", err);
  });
};

window.addEventListener("load", () => search_users(page_num));
