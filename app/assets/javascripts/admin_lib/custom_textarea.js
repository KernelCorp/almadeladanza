window.tinymce_body_init = function(){
tinyMCE.init({
  selector: "textarea#post_body, textarea#dance_style_description",
  theme: "advanced",
  height: "500px",
  maxlength: 100,
  toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent",
  toolbar4: "print preview media | forecolor backcolor emoticons",
  content_css: '/assets/lib/tinymce_content.css'
});
};

$(document).ready( function(){
    tinymce_body_init()
});
