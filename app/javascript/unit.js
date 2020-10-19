window.addEventListener("DOMContentLoaded", () => {
  const buildUnitForm = (units) => {
    console.log(units)
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
    return html;
  }

  const unitField = document.getElementById("unit_field");
  const unitParent = document.getElementById("exam_unit_id");

  unitParent.addEventListener("change", () => {
    const inputUnitParent = document.getElementById("exam_unit_id").value;
    console.log(inputUnitParent)
    let html = buildUnitForm(inputUnitParent)
    unitField.insertAdjacentHTML('beforeend', html);
  })
})
