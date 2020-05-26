$(document).on("turbolinks:load", function () {
  const buildFileField = function (index) {
    const html = `<div class="jsFileGroup" data-index="${index}">
                  <label class="jsFileLabel" for="good_pictures_attributes_${index}_goodsImage">
                  <input class="jsFile" type="file" name="good[pictures_attributes][${index}][goodsImage]" id="good_pictures_attributes_${index}_goodsImage">
                  <div class="jsRemove">画像の削除</div></label></div>`;
    return html;
  };
  const buildImg = function (index, url) {
    const html = `<img data-index="${index}" src="${url}" width="110px" height="110px">`;
    return html;
  };
  let fileIndex = [1, 2, 3, 4, 5];
  lastIndex = $(".jsFileGroup:last").data("index");
  fileIndex.splice(0, lastIndex);

  $(".hiddenDestroy").hide();

  // =====新規出品と編集=================================
  $("#image-box").on("change", ".jsFile", function (e) {
    const targetIndex = $(this).parent().parent().data("index");
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);

    if ((img = $(`img[data-index="${targetIndex}"]`).get(0))) {
      img.setAttribute("src", blobUrl);
    } else {
      $("#previews").append(buildImg(targetIndex, blobUrl));
      $("#image-box").append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
    }
  });

  // =====削除==========================================
  $("#image-box").on("click", ".jsRemove", function () {
    const targetIndex = $(this).parent().parent().data("index");
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hiddenDestroy`);
    if (hiddenCheck) hiddenCheck.prop("checked", true);

    $(`img[data-index="${targetIndex}"]`).remove();
    $(this).parent().parent().remove();

    if ($(".jsFile").length == 0)
      $("#image-box").append(buildFileField(fileIndex[0]));
  });
});
