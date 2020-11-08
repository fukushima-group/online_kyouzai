window.addEventListener("DOMContentLoaded", () => {

  const path = location.pathname
  const params = path.replace(/exams/g, '').replace(/edit/g, '').replace(/\//g, '');

  if (path == "/exams/new" || path.includes("exams") && path.includes("edit") && /^([1-9]\d*|0)$/.test(params)) {

    const unitForms = document.querySelectorAll('.unit-select-form'); // 単元のフォーム

    if (unitForms.length == 0) return null // カテゴリのフォームが無いなら以後実行しない

    unitChanged = (e) => { // カテゴリが変更された時、ajax通信を行い次のフォームを組み立てて追加する
      const selectedUnitId = e.target.value; // 選択されたカテゴリのid
      const changedForm = e.target; // 選択されたフォームの要素
  
      if (changedForm.nextElementSibling) changedForm.nextElementSibling.remove(); // 後ろのフォームをリセットする
  
  
      if (!selectedUnitId) return null; // 「ーーーーー」を選択したときはここで中断
  
      // ajax準備
      const XHR = new XMLHttpRequest();
      // ?Unit_id=${selectedUnitId}をパスに含めることでparams[:unit_id]に選択したカテゴリのIDが送られる
      XHR.open("GET", `/units/?unit_id=${selectedUnitId}`, true);
      XHR.responseType = "json";
      // ajax開始
      XHR.send();
  
      XHR.onload = () => {
  
        if (XHR.status != 200) { // ajaxに失敗した時の処理
          alert("failed");
          alert(`Error ${XHR.status}: ${XHR.statusText}`);
          return null;
        }
  
        console.log("successed");
  
        console.table(XHR.response);
  
        console.log(XHR.response.html);  // render json: { html: html }の内容を表示する
  
        if (!XHR.response.html) return null; // 孫単元が選択されたときはここでストップ
  
        const newUnitForm = document.createElement('div'); // 新しいカテゴリのフォームを作る下準備
        console.log("newUnitForm(フォーム追加前):", document.createElement('div'));
        newUnitForm.innerHTML = XHR.response.html; // コントローラから返ってきたフォームを挿入する
        console.log("newUnitForm(フォーム追加後):", newUnitForm);
        console.log("newUnitFormの最初の子要素:", newUnitForm.firstElementChild);
        console.log(newUnitForm.firstChild)
        newUnitForm.firstChild.addEventListener('change', unitChanged); // コントローラから返ってきたフォームにイベントをセットする
  
        changedForm.insertAdjacentElement("afterend", newUnitForm); // 新しいカテゴリのフォームをビューに表示する
      }
    }

    unitForms.forEach(unitForm => {  // カテゴリのフォームにイベントを設定する
      unitForm.addEventListener('change', unitChanged);
    });
  };
});
