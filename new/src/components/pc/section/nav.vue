<script setup>
import {onMounted, ref} from "vue";
import {useRoute} from "vue-router";

const link = ref([
  {
    id: 1,
    name: '首页',
    link: '/home',
    icon: '/src/assets/icon/home.png',
    active: false
  },
  {
    id: 2,
    name: '社区',
    link: '/community',
    icon: '/src/assets/icon/community.png',
    active: false
  },
  {
    id: 3,
    name: '互助',
    link: '/help',
    icon: '/src/assets/icon/cooperation.png',
    active: false
  },
  {
    id: 4,
    name: '聊天',
    link: '/chat',
    icon: '/src/assets/icon/chat.png',
    active: false
  },
  {
    id: 5,
    name: '活动',
    link: '/activity',
    icon: '/src/assets/icon/activity.png',
    active: false
  },
  {
    id: 6,
    name: '购物',
    link: '/shopping',
    icon: '/src/assets/icon/transaction.png',
    active: false
  },
  {
    id: 7,
    name: '账户',
    link: '/mine',
    icon: '/src/assets/icon/mine.png',
    active: false
  }
])

const route = useRoute()

// 当前路由路径: route.path

// 比对当前界面
const getPath = () => {
  const currentRoute = route.path;
  link.value.forEach(item => {
    item.active = item.link === currentRoute;
  });
}

onMounted(() => {
  getPath()
})

</script>

<template>
  <div class="nav whiteBg">
    <div class="in">
      <div class="logo">
        <img src="../../../assets/logo.png" alt="logo">
      </div>
      <div class="link">
        <div class="li" v-for="item in link" :key="item.id" :class="{active:item.active}">
          <router-link :to="item.link" @click="item.active = !item.active">
            <img :src="item.icon" alt="">
            {{ item.name }}
          </router-link>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped lang="scss">
.nav {
  box-sizing: border-box;
  padding: 0.55rem;
  width: 12.22rem;
  //width: calc(100% - 3.33rem);
  height: 95vh;
  text-align: center;
  border: 1px solid gainsboro;
  border-radius: 0.55rem;
  position: fixed;
  top: 50%;
  left: 1.1rem;
  transform: translateY(-50%);
}

.in {
  .link {
    .li {
      $height: 2.7rem;
      width: 100%;
      height: $height;
      line-height: $height;
      margin: 0.55rem 0;
      a{
        display: flex;
        align-items: center;
        justify-content: center;
      }


      $imgWid: 1.6rem;

      img {
        width: $imgWid;
        height: $imgWid;
        margin-right: 0.5rem;
      }
    }

    .active {
      background: #D5E80E;
      border-radius: 1.6rem;

      a {
        color: white;
        font-weight: bold;
      }
    }
  }
}
</style>