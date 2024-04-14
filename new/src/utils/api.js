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
    fixUserInfo(data) {
        return axios.post('/user/update_info', {data: data})
            .then((res) => res.data)
            .catch((err) => {
                throw err;
            });
    }
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
    getMyPost() {
        return axios.post('/post/userPost')
            .then((res) => res.data)
            .catch((err) => {
                throw err;
            });
    },
    getUserLike() {
        return axios.post('/post/userLike')
            .then((res) => res.data)
            .catch((err) => {
                throw err;
            });
    },
    getUserCollect() {
        return axios.post('/post/userCollect')
            .then((res) => res.data)
            .catch((err) => {
                throw err;
            });
    },
    deletePost(pid) {
        return axios.post('/post/deletePost', {pid: pid})
            .then((res) => res.data)
            .catch((err) => {
                throw err;
            });
    },
    getHosData() {
        return axios.get('/post/hot')
            .then((res) => res.data)
            .catch((err) => {
                throw err;
            });
    }
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
    },
    getMyHelp() {
        return axios.post('/help/userHelp')
            .then((res) => res.data)
            .catch((err) => {
                throw err;
            });
    },
    changeStatus(hid, status) {
        return axios.post('/help/changeStatus', {hid: hid, status: status})
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
    },
    fileUpload(fileList) {
        return axios.post('/activity/add_activity', fileList)
            .then((res) => res.data)
            .catch((err) => {
                throw err;
            });
    },
    getDiscuss(aid) {
        return axios.post('/activity/discuss', {aid: aid})
            .then((res) => res.data)
            .catch((err) => {
                throw err;
            });
    },
    addDiscuss(aid, content) {
        return axios.post('/activity/add_discuss', {aid: aid, content: content})
            .then((res) => res.data)
            .catch((err) => {
                throw err;
            });
    },
    getMyActivity() {
        return axios.post('/activity/userActivity')
            .then((res) => res.data)
            .catch((err) => {
                throw err;
            });
    },
    deleteActivity(aid) {
        return axios.post('/activity/deleteActivity', {aid: aid})
            .then((res) => res.data)
            .catch((err) =>
                err
            );
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
    },
    fileUpload(fileList) {
        return axios.post('/goods/add_goods', fileList)
            .then((res) => res.data)
            .catch((err) => {
                throw err;
            });
    },
    addShoppingCart(gid, quantity) {
        return axios.post('/goods/shoppingCart', {gid: gid, quantity: quantity})
            .then((res) => res.data)
            .catch((err) =>
                err
            );
    },
    getMyGoods() {
        return axios.post('/goods/userGoods',)
            .then((res) => res.data)
            .catch((err) =>
                err
            );
    },
    getShoppingCart() {
        return axios.post('/goods/userShoppingCart',)
            .then((res) => res.data)
            .catch((err) =>
                err
            );
    },
    deleteShopping(gid) {
        return axios.post('/goods/deleteShopping', {gid: gid})
            .then((res) => res.data)
            .catch((err) =>
                err
            );
    },
    deleteGoods(gid) {
        return axios.post('/goods/deleteGoods', {gid: gid})
            .then((res) => res.data)
            .catch((err) =>
                err
            );
    }
}
export {userApi, postApi, helpApi, activityApi, goodsApi};