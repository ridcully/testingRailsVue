/* eslint no-console: 0 */

import Vue from 'vue/dist/vue.esm'
import App from '../app.vue'

// Load main app.
document.addEventListener('DOMContentLoaded', () => {
  const el = document.getElementsByTagName('vue-app')[0];
  const app = new Vue({
      el,
      render: h => h(App)
    });
});
