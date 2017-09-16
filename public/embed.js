// public/embed.js

window.onload = function() {
   //Params
   var scriptPram = document.getElementById('load_widget');
   var id = scriptPram.getAttribute('data-page');

   //iFrame
   var iframe = document.createElement('iframe');
   iframe.style.display = "none";
   iframe.src = "http://127.0.0.1:3000/embed/compilations/" + id;
   document.body.appendChild(iframe);
};