import {createRouter, createWebHistory} from "vue-router";

import Home from '../components/pc/Home.vue'
import MobileHome from "../components/mobile/Mobile-Home.vue";
import Community from "../components/pc/Community.vue";
import Help from "../components/pc/Help.vue";
import Chat from "../components/pc/Chat.vue";
import Activity from "../components/pc/Activity.vue";
import Shopping from "../components/pc/Shopping.vue";
import Mine from "../components/pc/Mine.vue";
import Login from "../components/pc/account/Login.vue";
import PostDetails from "../components/pc/details/postDetails.vue";
import Add from "../components/pc/account/Add.vue";
import helpDetails from "../components/pc/details/helpDetails.vue";
import activityDetails from "../components/pc/details/activityDetails.vue";
import goodsDetails from "../components/pc/details/goodsDetails.vue";
import List from "../components/pc/account/list.vue";
import userInfo from "../components/pc/account/userInfo.vue";
import myShopping from "../components/pc/account/my_shopping.vue";
import myPublish from "../components/pc/account/my_publish.vue";
import myCollect from "../components/pc/account/my_collect.vue";
import myLike from "../components/pc/account/my_like.vue";
import Intro from "../components/pc/account/intro.vue";

const router = createRouter({
    history: createWebHistory(),
    routes: [
        {path: '/home', redirect: '/'},
        {
            path: '/',
            component: Home,
            // 屏幕小于768时候，响应小屏的组件
            beforeEnter: (to, from, next) => {
                if (window.innerWidth < 768) {
                    next('/mobileHome');
                } else {
                    next()
                }
            }
        },
        {
            path: '/mobileHome',
            component: MobileHome,
            beforeEnter: (to, from, next) => {
                if (window.innerWidth > 768) {
                    next('/');
                } else {
                    next()
                }
            }
        },
        {
            path:'/community',
            component:Community,
            beforeEnter:(to,from,next)=>{
                if(window.innerWidth < 768){
                    next('/mobileCommunity');
                }else {
                    next()
                }
            }
        },
        {
            path:'/postDetails/:pid',
            component:PostDetails,
            beforeEnter:(to,from,next)=>{
                if(window.innerWidth < 768){
                    next('/mobilePostDetails/:pid');
                }else {
                    next()
                }
            }
        },
        {
            path:'/help',
            component:Help,
            beforeEnter:(to,from,next)=>{
                if(window.innerWidth < 768){
                    next('/mobileHelp');
                }else {
                    next()
                }
            }
        },
        // {
        //     path:'/chat',
        //     component:Chat,
        //     beforeEnter:(to,from,next)=>{
        //         if(window.innerWidth < 768){
        //             next('/mobileChat');
        //         }else {
        //             next()
        //         }
        //     }
        // },
        {
            path:'/activity',
            component:Activity,
            beforeEnter:(to,from,next)=>{
                if(window.innerWidth < 768){
                    next('/mobileActivity');
                }else {
                    next()
                }
            }
        },
        {
            path:'/shopping',
            component:Shopping,
            beforeEnter:(to,from,next)=>{
                if(window.innerWidth < 768){
                    next('/mobileShopping');
                }else {
                    next()
                }
            }
        },
        {
            path:'/mine',
            component:Mine,
            beforeEnter:(to,from,next)=>{
                if(window.innerWidth < 768){
                    next('/mobileMine');
                }else {
                    next()
                }
            },
            // redirect:'/mine/list',
            children:[
                {path:'',component:List},
                {path:'userInfo',component:userInfo},
                {path:'my_shopping',component:myShopping},
                {path:'my_publish',component:myPublish},
                {path:'my_like',component:myLike},
                {path:'my_collect',component:myCollect},
                {path:'intro',component:Intro},

            ]
        },
        {
            path:'/login',
            component:Login,
            beforeEnter:(to,from,next)=>{
                if(window.innerWidth < 768){
                    next('/mobileLogin');
                }else {
                    next()
                }
            }
        },
        {
            path:'/register',
            component:Login,
            beforeEnter:(to,from,next)=>{
                if(window.innerWidth < 768){
                    next('/mobileRegister');
                }else {
                    next()
                }
            }
        },
        {
            path:'/add',
            component:Add,
            beforeEnter:(to,from,next)=>{
                if(window.innerWidth < 768){
                    next('/mobileAdd');
                }else {
                    next()
                }
            }
        },
        {
            path:'/helpDetails/:hid',
            component:helpDetails,
            beforeEnter:(to,from,next)=>{
                if(window.innerWidth < 768){
                    next('/mobileHelpDetails/:hid');
                }else {
                    next()
                }
            }
        },
        {
            path:'/activityDetails/:aid',
            component:activityDetails,
            beforeEnter:(to,from,next)=>{
                if(window.innerWidth < 768){
                    next('/mobileActivityDetails/:aid');
                }else {
                    next()
                }
            }
        },
        {
            path:'/goodsDetails/:gid',
            component:goodsDetails,
            beforeEnter:(to,from,next)=>{
                if(window.innerWidth < 768){
                    next('/mobileGoodsDetails/:gid');
                }else {
                    next()
                }
            }
        },

    ],
})
export default router