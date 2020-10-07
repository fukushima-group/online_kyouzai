window.addEventListener("DOMContentLoaded", () => {
  const path = location.pathname
  const params = path.replace(/items/g, '').replace(/transactions/g, '').replace(/\//g, '');
  const button = document.getElementById("button");
  console.log(path)
  // 生徒新規登録
  if (path == "/students/sign_up") {
    button.addEventListener("click", (e) => {
      e.preventDefault();
      document.getElementById("student_first_name").value = "中学";
      document.getElementById("student_last_name").value = "二郎";
      document.getElementById("student_first_name_kana").value = "チュウガク";
      document.getElementById("student_last_name_kana").value = "ジロウ";
      document.getElementById("student_email").value = "test@222";
      const school_year = document.getElementById("student-school-year").options;
      school_year[1].selected = true ;
      const clubs = document.getElementById("student-club-select").options;
      clubs[1].selected = true ;
      document.getElementById("student_purpose").value = "目標は学年１位です";
      const teachers = document.getElementById("teacher-select").options;
      teachers[1].selected = true ;
    })
  }
  // 先生新規登録
  if (path == "/teachers/sign_up") {
    button.addEventListener("click", (e) => {
      e.preventDefault();
      document.getElementById("teacher_first_name").value = "先生";
      document.getElementById("teacher_last_name").value = "太郎";
      document.getElementById("teacher_first_name_kana").value = "センセイ";
      document.getElementById("teacher_last_name_kana").value = "タロウ";
      document.getElementById("teacher_email").value = "test@111";
    })
  }
  // 商品購入
  if (path.includes("items") && path.includes("transactions") && /^([1-9]\d*|0)$/.test(params)) {
    button.addEventListener("click", (e) => {
      e.preventDefault();
      document.getElementById("card-number").value = "4242424242424242";
      document.getElementById("card-exp-month").value = "4";
      document.getElementById("card-exp-year").value = "25";
      document.getElementById("card-cvc").value = "123";
      document.getElementById("postal-code").value = "111-1111";
      const prefecture = document.getElementById("prefecture").options;
      prefecture[1].selected = true ;
      document.getElementById("city").value = "テスト市";
      document.getElementById("addresses").value = "テスト1-1";
      document.getElementById("building").value = "テストビル";
      document.getElementById("phone-number").value = "09011118888";
    })
  }
});