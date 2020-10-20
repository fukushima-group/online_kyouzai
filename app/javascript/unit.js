window.addEventListener("DOMContentLoaded", () => {

  const unitField = document.getElementById("unit_field");
  unitField.addEventListener("change", (e) => {
    const unit_id = e.target.value;
    const unit_form = e.target;
    console.log(unit_id)

    const XHR = new XMLHttpRequest();
    XHR.open("POST", "/units", true);
    XHR.responseType = "json";
    XHR.setRequestHeader("Content-Type", "application/json");
    XHR.send(unit_id);
    XHR.onload = () => {
      if (XHR.response.length == 0) return false;
      
      const units = XHR.response
      let options = "";
      units.forEach(function (unit) {
        options += `
                  <option value="${unit.id}">${unit.name}</option>
                  `;
      });
      const html = `
                  <select name="exam[unit_id]" id="exam_unit_id"><option value="">指定なし</option>
                    <option value="">---</option>
                    ${options}
                  </select>
                  `;
      unitField.insertAdjacentHTML('beforeend', html);

    };

    XHR.onerror = function () {
      alert("Request failed");
    };



    // console.log(inputUnitParent)
    // let html = buildUnitForm(inputUnitParent)
    // unitField.insertAdjacentHTML('beforeend', html);
  })
})
