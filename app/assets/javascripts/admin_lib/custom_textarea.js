window.tinymce_body_init = function(){
tinyMCE.init({
  selector: "textarea#post_body",
  theme: "advanced",
  height: "500px",
  maxlength: 100,
  toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent",
  toolbar4: "print preview media | forecolor backcolor emoticons",
  content_css: '/assets/lib/tinymce_content.css',
  style_formats: [
  {title: 'Основной текст', block: 'p', styles: {
    'font-size': '20px',
    'font-family': 'Gregor'
  }},
  {title: 'Розовая вставка', block: 'p', classes: 'pink', styles: {
    'font-size': '30px',
    'font-family': 'Gregor',
    'color': '#767676',
    'line-height': '35px'
  }}
  ]
});
};

$(document).ready( function(){
    tinymce_body_init()
});
