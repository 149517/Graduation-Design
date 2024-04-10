import axios from "axios";

axios.defaults.baseURL = 'http://localhost:8000'

axios.interceptors.request.use((config)=>{
    let token = window.localStorage.getItem('token')
    // console.log(token)
    if (token) {
        config.headers.authorization = `Bearer ${token}`;
    }
    return config;
})
export default axios