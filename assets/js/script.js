$.ajax({
  url: '../backend/get_apps.php',
  method: 'GET',
  dataType: 'json',
  success: function (data) {
    let categories = {};

    data.forEach(app => {
      const catName = app.name_cat;
      const catSlug = app.slug_cat;

      // se a categoria ainda não existe ele cria a categoria
      if (!categories[catSlug]) {
        categories[catSlug] = {
          name: catName,
          apps: []
        };
      }

      categories[catSlug].apps.push(app);
    });

    const categories_session = document.getElementById("categories-session")

    for (let slug in categories) {
      const category = categories[slug];
      categories_session.innerHTML += `
        <div class="col-md-12 text-center">
          <h2>${category.name.toUpperCase()}</h2>
        </div>

        <div class="col-md-12 d-flex flex-wrap mb-4 custom-section" id="${slug}-section">
        </div>
      `;

      category.apps.forEach(cur_app => {
        document.getElementById(`${slug}-section`).innerHTML += `
        <div class="app-card col-md-2" onclick="document.getElementById('${cur_app.slug_app}').click()">
            <div class="custom-control custom-switch">

                <input type="checkbox" class="custom-control-input" id="${cur_app.slug_app}" value="${cur_app.slug_app}" onchange="switch_clicked(this)">
                    <label class="custom-control-label" >
                    </label>
            </div>
            <span class="text-white ">${cur_app.name_app}</span>
            <img src="../assets/img/${cur_app.slug_app}.svg" class="img-fluid" style="max-width: 20px;" alt="${cur_app.name_app} logo">
        </div>
    `;
      })
    }
  }
})

const comboBox_distro = document.getElementById("select-distro")
$.ajax({
  url: '../backend/get_distros.php',
  method: 'GET',
  dataType: 'json',
  success: function (data){
    data.forEach(distro => {
      comboBox_distro.innerHTML += `<option value="${distro.id_distro}">${distro.name_distro}</option>` 
    })
    
  }
})

comboBox_distro.addEventListener("change", function() {
  selectAdistro(this.value);
});

var current_distro;
function selectAdistro(selected_id){
  $.ajax({
    url: '../backend/get_distros.php',
    method: 'POST',
    dataType: 'json',
    data: {
      selected_distro: selected_id
    },
    success: function(data) {
      current_distro = data[0].name_distro;
      console.log("SUCESSO:", data);
      document.getElementById("numbers-selected-apps").innerHTML = `<p>Your Selected Distro: ${current_distro}</p>`
      
    },
    error: function(xhr) {
      console.log("ERRO:", xhr.responseText);
    }
  })
  

}


let selected = []

function switch_clicked(element) {
  const value = element.value;
  const confirm_div = document.getElementById("numbers-selected-apps")
  const apps_list = document.getElementById("apps-list")
  const floating_btn = document.getElementById("floating-btn");

  if (element.checked) {
    selected.push(value);

  } else {
    selected = selected.filter(item => item !== value);
  }

  confirm_div.innerHTML = `<p>Your Selected Distro: ${current_distro}</p>`
  apps_list.innerHTML = selected.map(item => `
  <li class="selected-item">
    ${item}
    <i class="bi bi-x-lg " onclick="removeItem('${item}',${element.id.value})"></i>
  </li>
  `).join('');

}




document.getElementById('floating-btn').addEventListener('click', function () {
  const div = document.getElementById('confirm-generation');
  const floating_btn = document.getElementById("floating-btn");

  if (div.style.display === 'none' || div.style.display === '') {
    div.style.display = 'block';
    
    floating_btn.innerHTML = "<i class='bi bi-arrow-left-square' style='font-size: x-large;'></i>"

  } else {
    div.style.display = 'none';
    floating_btn.innerHTML = "<i class='bi bi-download' style='font-size: x-large;'></i>"
  }
});

const btn = document.getElementById("floating-btn");
const box = document.getElementById("confirm-generation");
const overlay = document.querySelector(".overlay-div");
const btnConfirm = document.getElementById("btn-confirm")

btn.addEventListener("click", () => {
  box.classList.toggle("ativo");
  btn.classList.toggle("ativo");

});
btnConfirm.addEventListener("click", () => {
  overlay.classList.toggle("ativo");
})

function removeItem(item, element) {

  selected = selected.filter(i => i !== item);

  const checkbox = document.getElementById(item);
  if (checkbox) {
    checkbox.checked = false;
  }

  switch_clicked(checkbox);
}

function confirm_overlay() {
  document.getElementById("overlay-div").style.display = 'block';
  console.log(selected)
  
  const overlay_apps = document.getElementById("overlay-apps");
  const overlay_distro = document.getElementById("overlay-distro");

  selected.forEach(app => {
  overlay_apps.innerHTML += `
    <p>${app}</p>
    `;
  })

  overlay_distro.innerHTML = `<p>${current_distro}</p>`
  
}

function exit() {
  document.getElementById("overlay-div").classList.remove("ativo");
}