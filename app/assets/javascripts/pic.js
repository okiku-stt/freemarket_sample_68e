$(function(){
  $(".sell-img-box__dropbox").on("dragenter", function(e){
    console.log("dragenter");
    e.preventDefault();
  });
  $(".sell-img-box__dropbox").on("dragover", function(e){
    console.log("dragover");
    e.preventDefault();
  });
  $(".sell-img-box__dropbox").on("drop", function(e){
    console.log("drop");
    e.preventDefault();
    var f = e.originalEvent.dataTransfer.files;
    console.log(f);
    document.getElementById("upload-form-fileselect").files = e.originalEvent.dataTransfer.files;
  });
  return false;
});


$(document).ready(function(){
  $('.sell-img-box__dropbox').on('change', 'input[type="file"]', function(e) {
    console.log("hello")
    var file = e.target.files[0],
        reader = new FileReader(),
        $preview = $(this);
        t = this;

    if(file.type.indexOf("image") < 0){
      return false;
    }

    reader.onload = (function(file) {
      return function(e) {
        $preview.empty();
        $preview.append($('<img>').attr({
                  src: e.target.result,
                  class: "preview-1",
                  title: file.name
              }));
      };
    })(file);

    reader.readAsDataURL(file);
  });
});