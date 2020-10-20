window.addEventListener("DOMContentLoaded", () => {

  function nextAll(node, selector) {
    var list = [];
    var next = node.nextElementSibling;
    
    while (next && next.nodeType === 1) {
      list.push(next);
      next = next.nextElementSibling;
    }
  
    if (selector) {
      var node = [].slice.call(document.querySelectorAll(selector));
      
      list = list.filter(function(item) {
        return node.indexOf(item) !== -1;
      });
    }
  
    return list;
  }

  const unitField = document.getElementById("unit_field");
  unitField.addEventListener("change", (e) => {
    const unit_id = e.target.value;
    // const unit_form = e.target;
    console.log(unit_id)

    const XHR = new XMLHttpRequest();
    XHR.open("POST", "/units", true);
    XHR.responseType = "json";
    XHR.setRequestHeader("Content-Type", "application/json");
    XHR.send(unit_id);
    XHR.onload = () => {
      if (XHR.response.length == 0) return false;
      const form = nextAll(document.querySelector('#exam_unit_id'), '.next_unit_id');
      
      if (form.length == 2) {
        console.log("test2")
        console.log(form)
        form.forEach(function (form) {
          form.remove();
        })
      } else {
        console.log("test1")
        console.log(form)
        // unit_form[1].remove();
      }
      
      
      
      const units = XHR.response
      let options = "";
      units.forEach(function (unit) {
        options += `
                  <option value="${unit.id}">${unit.name}</option>
                  `;
      });
      const html = `
                  <select name="exam[unit_id]" class="next_unit_id">
                    <option value="">---</option>
                    ${options}
                  </select>
                  `;
      unitField.insertAdjacentHTML('beforeend', html);

    };

    XHR.onerror = function () {
      alert("Request failed");
    };
  })
})
