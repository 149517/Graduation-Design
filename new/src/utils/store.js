import { createStore } from 'vuex'

const store = createStore({
    state () {
        return {
            // User
            user:localStorage.getItem('user'),
            pic:localStorage.getItem('pic'),
            intro:localStorage.getItem('intro'),
            uid:localStorage.getItem('uid'),
            career:null,
            // 内容发布
            send:false,

            currentPage:"我的账户"
        }
    },
    mutations: {
        addUser(state,value){
            state.user = value
        },
        addPic(state,value){
            state.pic = value
        },
        addIntro(state,value){
            state.intro = value
        },
        addUid(state,value){
            state.uid = value
        },
        addCareer(state,value){
            state.career = value
        },
        changeSend(state,value){
            state.send = value
        },
        changeCurrentPage(state,value){
            state.currentPage = value
        }
    }
})

export default store