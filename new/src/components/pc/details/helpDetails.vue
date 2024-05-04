<script setup>

import {formatDate} from "../../../utils/utils.js";
import {helpApi} from "../../../utils/api.js";
import {useRoute, useRouter} from "vue-router";
import {onMounted, ref} from "vue";

const route = useRoute()
const hid = ref(null)
const wechat = ref(false)
const help = ref({
  hid: null,
  content: null,
  time: null,
  status: 1,
  contact_info:null,
  user: {
    pic: null,
    uid: null,
    username: null,
  },
  images: [{
    image: null,
    description: null,
  }],
})
const getHelps = async () => {
  const result = await helpApi.getHelpDetails(hid.value)
  console.log(result)
  help.value = result
}
const router = useRouter()

onMounted(() => {
  hid.value = route.params.hid
  getHelps()
})
</script>

<template>
  <div class="container bg">
    <div class="nav">
      <Nav></Nav>
    </div>
    <div class="contain">
      <div class="head">
        <h1>互助详情</h1>
        <div class="search">
          <!--          <input type="text">-->
          <!--          <button>-->
          <!--            搜索-->
          <!--          </button>-->
        </div>
      </div>
      <div class="block rightGap">
        <div class="box whiteBg">
          <div class="userInfo flex">
            <div class="pic">
              <img :src="help.user.pic" alt="头像">
            </div>
            <div class="name">
              {{ help.user.username }}
            </div>
          </div>
          <div class="help">
            <div class="text">
              {{
                help.content
              }}
            </div>
            <div class="images" v-for="li in help.images">
              <img :src="li.image" :alt="li.description">
            </div>
            <div class="time">
              {{ formatDate(help.time) }}
            </div>
          </div>
          <div class="btn" @click="wechat = !wechat">
            <button>联系我</button>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="wechat" v-if="wechat">
    <p v-if="help.contact_info">{{help.contact_info}}</p>
    <img v-else src="../../../assets/images/WeChat.jpg" alt="">
  </div>

</template>

<style scoped lang="scss">
.box {
  padding: 1rem;
  border-radius: 0.5rem;
}
.userInfo {
  $height: 2.78rem;
  align-items: center;

  .pic {
    width: $height;
    height: $height;
    background: salmon;
    border-radius: 50%;

    img {
      width: 100%;
      height: 100%;
      border-radius: 50%;
    }
  }

  .name {
    margin-left: 0.5rem;
    font-weight: bold;
    font-size: 1.2rem;
  }
}
.help{
  margin: 2rem 0;
  .text{

  }
  .images {
    display: flex;
    align-items: center;
    justify-content: center;
    flex-wrap: wrap;

    img {
      max-width: 50%;
      border: 1px solid gainsboro;
      border-radius: 0.5rem;
      margin: 0.5rem;
    }
  }
  .time {
    color: #8d8d8d;
    text-align: right;
  }
}
.btn{
  text-align: center;
  margin-bottom: 1rem;
}
</style>