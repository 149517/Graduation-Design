import axios from "axios";

// 用户API
const userApi = {
    login(account, password) {
        return axios
            .post("/user/login", {username: account, password: password})
            .then((res) => res.data)
            .catch((err) => {
                throw err;
            });
    },
    register(account, password) {
        return axios
            .post("/user/register", {username: account, password: password})
            .then((res) => res.data)
            .catch((err) => {
                throw err;
            });
    },
};

// 帖子API
const postApi = {
    getPost() {
        return axios
            .post("/post/all")
            .then((res) => res.data)
            .catch((err) => {
                throw err;
            });
    },
    getPostDetails(pid) {
        return axios
            .post("/post/by", {pid: pid})
            .then((res) => res.data)
            .catch((err) => {
                throw err;
            });
    },
    Like_post(pid) {
        return axios.post('/post/like', {pid: pid})
            .then((res) => res.data)
            .catch((err) => {
                throw err;
            });
    },
    Collect_post(pid) {
        return axios.post('/post/collect', {pid: pid})
            .then((res) => res.data)
            .catch((err) => {
                throw err;
            });
    },
    getComment(pid) {
        return axios.post('/post/comment', {pid: pid})
            .then((res) => res.data)
            .catch((err) => {
                throw err;
            });
    },
    addComment(pid, content) {
        return axios.post('/post/add_comment', {pid: pid, content: content})
            .then((res) => res.data)
            .catch((err) => {
                throw err;
            });
    },
    fileUpload(fileList) {
        return axios.post('/post/add_post', fileList)
            .then((res) => res.data)
            .catch((err) => {
                throw err;
            });
    },
};

const helpApi = {
    getHelps() {
        return axios.post('/help/all')
            .then((res) => res.data)
            .catch((err) => {
                throw err;
            });
    },
    getHelpDetails(hid) {
        return axios.post('/help/by', {hid: hid})
            .then((res) => res.data)
            .catch((err) => {
                throw err;
            });
    },
    fileUpload(fileList) {
        return axios.post('/help/add_help', fileList)
            .then((res) => res.data)
            .catch((err) => {
                throw err;
            });
    }
}

const activityApi = {
    getActivity() {
        return axios.post('/activity/all')
            .then((res) => res.data)
            .catch((err) => {
                throw err;
            });
    },
    getActivityDetails(aid) {
        return axios.post('/activity/by', {aid: aid})
            .then((res) => res.data)
            .catch((err) => {
                throw err;
            });
    }
}

const goodsApi = {
    getGoods() {
        return axios.post('/goods/all')
            .then((res) => res.data)
            .catch((err) => {
                throw err;
            });
    },
    getGoodsDetails(gid) {
        return axios.post('/goods/by', {gid: gid})
            .then((res) => res.data)
            .catch((err) => {
                throw err;
            });
    }
}
export {userApi, postApi, helpApi, activityApi,goodsApi};