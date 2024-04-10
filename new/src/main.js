import { createApp } from 'vue'
import './style.scss'
import App from './App.vue'
import router from './utils/router.js'
import store from './utils/store.js'
import './utils/config.js'

const app = createApp(App)

app.use(router)
app.use(store)

app.mount('#app')
