/* eslint no-console:0 */

import "@hotwired/turbo-rails"
require("@rails/activestorage").start()
require("local-time").start()

import "./channels"
import "./controllers"
import "./src/**/*"

import TomSelect from 'tom-select'

document.addEventListener("turbo:load", () => {
  document.querySelectorAll(".multi-select").forEach((selectElement) => {
    new TomSelect(selectElement, {
      plugins: ['remove_button'],
      persist: false,
      create: false,
      maxItems: null,
      render: {
        option: function(data, escape) {
          return `<div>${escape(data.text)}</div>`;
        },
        item: function(data, escape) {
          return `<div class="item">${escape(data.text)}</div>`;
        }
      }
    });
  });
});
