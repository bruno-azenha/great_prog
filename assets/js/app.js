// We import the CSS which is extracted to its own file by esbuild.
// Remove this line if you add a your own CSS build pipeline (e.g postcss).
// import "../css/app.css"

// If you want to use Phoenix channels, run `mix help phx.gen.channel`
// to get started and then uncomment the line below.
// import "./user_socket.js"

// You can include dependencies in two ways.
//
// The simplest option is to put them in assets/vendor and
// import them using relative paths:
//
//     import "./vendor/some-package.js"
//
// Alternatively, you can `npm install some-package` and import
// them using a path starting with the package name:
//
//     import "some-package"
//

// Include phoenix_html to handle method=PUT/DELETE in forms and buttons.
import "phoenix_html"
// Establish Phoenix Socket and LiveView configuration.
import { Socket } from "phoenix"
import { LiveSocket } from "phoenix_live_view"
import topbar from "topbar"

let Hooks = {}
// Hooks.Example = { mounted() { } }

let csrfToken = document
  .querySelector("meta[name='csrf-token']")
  .getAttribute('content')

let liveSocket = new LiveSocket('/live', Socket, {
  hooks: Hooks,
  params: { _csrf_token: csrfToken },
  dom: {
    onBeforeElUpdated(from, to) {
      if (from._x_dataStack) {
        window.Alpine.clone(from, to);
      }
    }
  }
})

// Show progress bar on live navigation and form submits
topbar.config({ barColors: { 0: "#29d" }, shadowColor: "rgba(0, 0, 0, .3)" })
window.addEventListener("phx:page-loading-start", info => topbar.show())
window.addEventListener("phx:page-loading-stop", info => topbar.hide())

// connect if there are any LiveViews on the page
liveSocket.connect()

// expose liveSocket on window for web console debug logs and latency simulation:
// >> liveSocket.enableDebug()
// >> liveSocket.enableLatencySim(1000)  // enabled for duration of browser session
// >> liveSocket.disableLatencySim()
window.liveSocket = liveSocket

// Hook for the Values Exercise - adds a warning when trying to leave
Hooks.ValuesExercise = {
  mounted() {
    // Store the handler function so we can remove it later
    this.beforeUnloadHandler = (e) => {
      // Only show warning if not on the results screen (final step)
      const currentStep = this.el.dataset.currentStep;
      if (currentStep && currentStep !== "results") {
        // Standard way to show confirmation dialog when leaving page
        e.preventDefault();
        e.returnValue = "You haven't completed your core values exercise. Are you sure you want to leave?";
        return e.returnValue;
      }
    };
    
    // Add warning when trying to close the tab during exercise
    window.addEventListener('beforeunload', this.beforeUnloadHandler);
    
    // Add confirmation to navbar links
    this.interceptNavbarLinks();
    
    // Store the current step to detect changes
    this.lastStep = this.el.dataset.currentStep;
  },

  updated() {
    // Check if the step has changed
    const currentStep = this.el.dataset.currentStep;
    if (currentStep !== this.lastStep) {
      // Scroll to top when moving between steps
      window.scrollTo({top: 0, behavior: 'smooth'});
      this.lastStep = currentStep;
    }
  },
  
  // Intercepts clicks on navbar links to confirm navigation
  interceptNavbarLinks() {
    const navbarLinks = document.querySelectorAll('#main-nav a');
    const currentPath = window.location.pathname;
    
    // Only apply to links from the values exercise page
    if (!currentPath.includes('/exercises/core-values')) {
      return;
    }
    
    navbarLinks.forEach(link => {
      // Skip links that already point to the current page
      if (link.getAttribute('href') === currentPath) {
        return;
      }
      
      link.addEventListener('click', (e) => {
        const currentStep = this.el.dataset.currentStep;
        // Only prompt if exercise is not complete
        if (currentStep && currentStep !== "results") {
          const confirmLeave = confirm("Navigating away will cause you to lose your progress in the values exercise. Are you sure you want to leave?");
          if (!confirmLeave) {
            e.preventDefault();
            return false;
          }
        }
      });
    });
  },
  
  destroyed() {
    // Clean up the event listener when the component is destroyed
    window.removeEventListener('beforeunload', this.beforeUnloadHandler);
  }
}
