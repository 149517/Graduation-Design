<script setup>

import {formatDate} from "../../../utils/utils.js";
import {activityApi, helpApi} from "../../../utils/api.js";
import {useRoute, useRouter} from "vue-router";
import {onMounted, ref} from "vue";


const route = useRoute()
const aid = ref(null)
const data = ref({
  aid: null,
  content: null,
  time: null,
  type: 0,
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
const getActivity = async () => {
  const result = await activityApi.getActivityDetails(aid.value)
  console.log(result)
  data.value = result
}
const router = useRouter()

onMounted(() => {
  aid.value = route.params.aid
  getActivity()
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
              <img :src="data.user.pic" alt="头像">
            </div>
            <div class="name">
              {{ data.user.username }}
            </div>
          </div>
          <div class="activity">
            <div class="text">
              {{
                data.content
              }}
            </div>
            <div class="images" v-for="li in data.images">
              <img :src="li.image" :alt="li.description">
            </div>
            <div class="time">
              {{ formatDate(data.time) }}
            </div>
          </div>
          <div class="btn">
            <button>联系我</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped lang="scss">
.box {
  padding: 1rem;
  border-radius: 0.5rem;
  margin-bottom: 1.2rem;
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
.activity{
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