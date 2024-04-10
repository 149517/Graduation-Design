<script setup>
import {ref} from "vue";

const link = ref([
  {
    id: 1,
    name: '首页',
    link: '/home',
    active: true
  },
  {
    id: 2,
    name: '社区',
    link: '/community',
    active: false
  },
  {
    id: 3,
    name: '互助',
    link: '/help',
    active: false
  },
  {
    id: 4,
    name: '聊天',
    link: '/chat',
    active: false
  },
  {
    id: 5,
    name: '活动',
    link: '/activity',
    active: false
  },
  {
    id: 6,
    name: '购物',
    link: '/shopping',
    active: false
  },
  {
    id: 7,
    name: '登录',
    link: '/login',
    active: false
  }
])
</script>

<template>
  <div class="nav">
    <div class="in">
      <div class="logo">
        <img src="../../../assets/logo.png" alt="logo">
      </div>
      <div class="link">
        <div class="li" v-for="item in link" :key="item.id">
          <router-link :to="item.link" :class="{active:item.active}">
            {{ item.name }}
          </router-link>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped lang="scss">
.active{
  font-weight: bold;
}
.nav{
  padding-top: 0.27rem;
  width: 100%;
  height: 3rem;
  border-bottom: 1px solid #dadada;
}
.in{
  width: 80%;
  margin: auto;
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.logo{
  img{
    width: 3rem;
    height: 3rem;

  }
}
.link{
  display: flex;
  .li{
    width: 3.5rem;
    height: 3rem;
    line-height: 3rem;
    a{
      font-size: 1rem;
    }
  }
}
</style>