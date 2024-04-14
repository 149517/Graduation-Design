<script setup>
import {useRouter} from "vue-router";
import {computed, ref} from "vue";
import {useStore} from "vuex";
const store = useStore()
const router = useRouter()

// const currentPage = computed(() => store.state.currentPage);
const pic = ref(localStorage.getItem('pic'))
const openPage = (path) => {
  if(path === '/login'){
     localStorage.clear()
  }
  fixCurrent(path)


  router.push(path)
}
const CurrentPage = computed(() => store.state.currentPage)

const fixCurrent = (path)=>{

  let lastPart = path.split('/').pop();
  console.log(lastPart)

  if(lastPart === 'userInfo'){
    store.commit('changeCurrentPage',"用户信息修改")
  }
  if(lastPart === 'my_shopping'){
    store.commit('changeCurrentPage',"购物车")
  }
  if(lastPart === 'my_publish'){
    store.commit('changeCurrentPage',"我的发布")
  }
  if(lastPart === 'my_like'){
    store.commit('changeCurrentPage',"我的喜欢")
  }
  if(lastPart === 'my_collect'){
    store.commit('changeCurrentPage',"我的收藏")
  }
  if(lastPart === 'intro'){
    store.commit('changeCurrentPage',"关于网站")
  }
  console.log(CurrentPage.value)
}


</script>

<template>
  <div class="list">
    <div class="box whiteBg border">
      <div class="line" @click="openPage('/mine/userInfo')">
        <div class="tit">
          我的头像
        </div>
        <div class="pic enter">
          <img class="border" :src="pic" alt="" v-if="pic">
          <img class="border" src="../../../assets/logo.png" alt="" v-else>
        </div>
      </div>
      <div class="line" @click="openPage('/mine/userInfo')">
        <div class="tit">
          用户名和密码
        </div>
        <div class="enter">
          <img src="../../../assets/icon/right.png" alt="">
        </div>
      </div>
    </div>
    <div class="box whiteBg border">
      <div class="line" @click="openPage('/mine/my_publish')">
        <div class="tit">
          我的发布
        </div>
        <div class="enter">
          <img src="../../../assets/icon/right.png" alt="">
        </div>
      </div>
      <div class="line" @click="openPage('/mine/my_shopping')">
        <div class="tit">
          购物车
        </div>
        <div class="enter">
          <img src="../../../assets/icon/right.png" alt="">
        </div>
      </div>
      <div class="line" @click="openPage('/mine/my_like')">
        <div class="tit">
          喜欢
        </div>
        <div class="enter">
          <img src="../../../assets/icon/right.png" alt="">
        </div>
      </div>
      <div class="line" @click="openPage('/mine/my_collect')">
        <div class="tit">
          收藏
        </div>
        <div class="enter">
          <img src="../../../assets/icon/right.png" alt="">
        </div>
      </div>

    </div>
    <div class="box whiteBg border">
      <div class="line" @click="openPage('/mine/intro')">
        <div class="tit">
          关于网站
        </div>
        <div class="enter">
          <img src="../../../assets/icon/right.png" alt="">
        </div>
      </div>
      <div class="line" @click="openPage('/login')">
        <div class="tit">
          退出登录
        </div>
        <div class="enter">
          <img src="../../../assets/icon/right.png" alt="">
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped lang="scss">
.box {
  border-radius: 0.55rem;
  width: 90%;
  margin: 0 auto 1.1rem;

  .line {
    padding: 0.55rem 1.1rem;
    display: flex;
    justify-content: space-between;
    align-items: center;
    border-bottom: 1px solid gainsboro;

    img {
      width: 1.5rem;
      height: 1.5rem;
    }

    .pic {
      img {
        width: 4rem;
        height: 4rem;
        border-radius: 0.5rem;
      }
    }
  }
}
</style>