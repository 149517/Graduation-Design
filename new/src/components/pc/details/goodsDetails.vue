<script setup>

import {formatDate} from "../../../utils/utils.js";
import {goodsApi} from "../../../utils/api.js";
import {useRoute, useRouter} from "vue-router";
import {onMounted, ref} from "vue";

const route = useRoute()
const gid = ref(null)
const wechat = ref(false)
const data = ref({
  gid: null,
  content: null,
  time: null,
  status: 1,
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
const getGoods = async () => {
  const result = await goodsApi.getGoodsDetails(gid.value)
  console.log(result)
  data.value = result
}
const router = useRouter()

// 添加购物车
const addShoppingCart = async () => {
  let quantity = 1
  const result = await goodsApi.addShoppingCart(gid.value, quantity)
  // console.log(result)

  if (result.response) {
    alert(result.response.data.message)
  } else {
    alert(result.message)
  }

}
onMounted(() => {
  gid.value = route.params.gid
  getGoods()
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
          <div class="goods">
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
            <button @click="wechat = !wechat">联系我</button>
            <button @click="addShoppingCart">加入购物车</button>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="wechat" v-if="wechat">
    <img src="../../../assets/images/WeChat.jpg" alt="">
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

.goods {
  margin: 2rem 0;

  .text {

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

.btn {
  display: flex;
  justify-content: center;
  align-items: center;
  margin-bottom: 1rem;

  button {
    margin-left: 2rem;
  }
}
</style>