// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.




require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


require("datatables.net")
require('datatables.net-bs4')
require("datatables.net-bs4/css/dataTables.bootstrap4.min.css")

//najelegantnija opcija
global.$ = require("jquery");

const dataTables = [];

document.addEventListener("turbolinks:load", () => {
  if (dataTables.length === 0 && $('.data-table').length !== 0) {
    $('.data-table').each((_, element) => {
      dataTables.push($(element).DataTable({
        pageLength: 25,
        "lengthChange": false,
        "filter":true,
        "language":{
          "info":"Prikazujemo stranicu _PAGE_ od _PAGES_ ",
          "zeroRecords": "Ništa nije pronađeno",
          "infoFiltered": "(Ukupan broj filtriranih redova: _MAX_ )",
          "search":"Pretraži:"
        }
      }));
    });
  }
});

document.addEventListener("turbolinks:before-cache", () => {
  while (dataTables.length !== 0) {
    dataTables.pop().destroy();
  }
});
// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
// Support component names relative to this directory:
var componentRequireContext = require.context("components", true);
var ReactRailsUJS = require("react_ujs");
ReactRailsUJS.useContext(componentRequireContext);
