import * as params from "@params";
import {
  newNavStore,
  initColorScheme,
  bridgeTurboAndAlpine,
} from "./nav/index";
import Alpine from "jslibs/alpinejs/v3/alpinejs/dist/module.esm.js";
import intersect from "jslibs/alpinejs/v3/intersect/dist/module.esm.js";
import persist from "jslibs/alpinejs/v3/persist/dist/module.esm.js";

// Client state.
(function () {
  // Now we know that the browser has JS enabled.
  document.documentElement.classList.remove("no-js");
})();

// Turbolinks init.
(function () {
  document.addEventListener("turbo:render", function (e) {
    // This is also called right after the body start. This is added to prevent flicker on navigation.
    initColorScheme();
  });

  // TODO1 form actions?
})();

// Set up and start Alpine.
(function () {
  // Register AlpineJS plugins.
  {
    Alpine.plugin(intersect);
    Alpine.plugin(persist);
  }

  // Register AlpineJS controllers.
  {
    // None for now.
  }

  // Set up AlpineJS stores.
  {
    Alpine.store("nav", newNavStore(Alpine));
  }

  // Start Alpine.
  Alpine.start();

  // Start the Turbo-Alpine bridge.
  bridgeTurboAndAlpine(Alpine);
})();
