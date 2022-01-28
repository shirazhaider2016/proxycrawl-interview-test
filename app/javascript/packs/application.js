import $ from 'jquery';
window.$ = window.jQuery = $;
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import 'bootstrap';
import '../stylesheets/application';
import "@fortawesome/fontawesome-free/js/all";

Rails.start()
Turbolinks.start()
ActiveStorage.start()

document.addEventListener("turbolinks:load", () => {
    $('[data-toggle="tooltip"]').tooltip()
    $('.overall_search').on("change", function (e) {
        $('#overall_search').submit()
    })
});