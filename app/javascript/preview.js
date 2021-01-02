window.addEventListener("DOMContentLoaded", () => {
  // 商品出品・編集のフォームを取得
  const testForm = document.querySelector(".test-content");
  // 商品出品・編集のフォームがないなら実行せずここで終了
  if (!testForm) return null;
  const image_limits = 5;

  // プレビュー画像を生成・表示する
  const buildPreviewImage = (dataIndex, blob) => {
    // プレビュー画像の親要素を生成
    const previewWrapper = document.createElement("div");
    previewWrapper.setAttribute("class", "preview");

    // プレビュー画像にdata-indexを設定
    previewWrapper.setAttribute("data-index", dataIndex);

    // プレビュー画像のimg要素を生成
    const previewImage = document.createElement("img");
    previewImage.setAttribute("src", blob);
    previewImage.setAttribute("class", "preview-image");

    // プレビュー画像の親要素に子要素としてimg要素を追加する
    previewWrapper.appendChild(previewImage);

    // 削除ボタンを生成
    const deleteButton = document.createElement("div");
    deleteButton.setAttribute("class", "image-delete-button");
    deleteButton.innerText = "削除";

    // 削除ボタンをクリックしたらプレビューとfile_fieldを削除させる
    deleteButton.addEventListener("click", () => deleteImage(dataIndex));

    // プレビュー画像の親要素に子要素として削除ボタンを追加する
    previewWrapper.appendChild(deleteButton);

    // プレビュー画像一覧にプレビュー画像を挿入する
    const previewsList = document.querySelector("#previews");
    previewsList.appendChild(previewWrapper);
  };



  // 画像編集時の削除機能実装中（西村）
  // const deletePreview = document.querySelector(
  //   `.image-delete-button[data-index="${dataIndex}"]`
  // );
  // console.log(deletePreview)
  // deletePreview.addEventListener("click", (e) => {
  //   const dataIndex = e.target.getAttribute("data-index");
  //   const fileField = document.querySelector(
  //     `.preview[data-index="${dataIndex}"]`
  //   );
  //   fileField.remove();
  // })


  // 画像用のfile_fieldを生成・表示する
  const buildNewFileField = () => {
    // 新しいfile_fieldを生成
    const newFileField = document.createElement("input");
    newFileField.setAttribute("type", "file");
    newFileField.setAttribute("name", "test[images][]");

    // 最後のfile_fieldを取得
    const lastFileField = document.querySelector('input[type="file"][name="test[images][]"]:last-child')
    // nextDataIndex = 最後のfile_fieldのdata-index + 1
    const nextDataIndex = Number(lastFileField.getAttribute("data-index")) + 1;
    newFileField.setAttribute("data-index", nextDataIndex);

    // file_fieldにchangeイベントをセット
    newFileField.addEventListener("change", changedFileField);

    // file_fieldを追加
    const fileFieldsArea = document.querySelector(".click-upload");
    fileFieldsArea.appendChild(newFileField);
  };

  // 指定したdata-indexを持つプレビューとfile_fieldを削除する
  const deleteImage = (dataIndex) => {
    const previewWrapper = document.querySelector(
      `.preview[data-index="${dataIndex}"]`
    );
    previewWrapper.remove();
    const fileField = document.querySelector(
      `input[type="file"][data-index="${dataIndex}"]`
    );
    fileField.remove();

    // 画像の枚数が最大のときに削除ボタンを押したらfile_fieldを1つ追加しておく
    const image_count = document.querySelectorAll(".preview").length;
    if (image_count == image_limits - 1) buildNewFileField();
  };

  // 画像のfile_fieldの内容が変化（新しく選択、もしくは消える）したら発火するイベントで行われる処理
  const changedFileField = (e) => {
    // data-index（何番目を操作しているか）を取得
    const dataIndex = e.target.getAttribute("data-index");

    const file = e.target.files[0];

    if (!file) {
      deleteImage(dataIndex);
      return null;
    }
    
    // 選択されたファイルはblobという形式でブラウザが所持している
    const blob = window.URL.createObjectURL(file);

    // data-indexを使って既にプレビューが表示されているかを確認する
    const oldPreviewWrapper = document.querySelector(
      `.preview[data-index="${dataIndex}"]`
    );
    if (oldPreviewWrapper) {
      // 既にプレビューが表示されているので画像の差し替えのみを行い終了する
      const oldPreviewImage = oldPreviewWrapper.querySelector("img");
      oldPreviewImage.setAttribute("src", blob);
      return null;
    }

    // dataIndexとblobを使ってプレビューを表示させる
    buildPreviewImage(dataIndex, blob);

    // 画像の枚数制限に引っかからなければ新しいfile_fieldを追加する
    const image_count = document.querySelectorAll(".preview").length;
    if (image_count < image_limits) buildNewFileField();
  };

  // 画像のfile_field
  const fileField = document.querySelector(
    'input[type="file"][name="test[images][]"]'
  );

  // 画像のfile_fieldの内容が変化（新しく選択、もしくは消える）したら発火するイベント
  fileField.addEventListener("change", changedFileField);
});