<script setup>

import Nav from "./section/nav.vue";
import {onMounted, ref} from "vue";
import {goodsApi} from "../../utils/api.js";
import {useRouter} from "vue-router";
import Release from "./section/release.vue";

const goods = ref([{
  gid: null,
  active:true,
  content: null,
  time: null,
  price: null,
  number: 1,
  images: {
    image: null,
    description: null,
  }
}])

const getGoods = async () => {
  const result = await goodsApi.getGoods()
  console.log(result)
  // 判断数据中的 active 字段，只添加 active 为 true 的数据到 goods.value
  goods.value = result.data.filter(item => item.active === true)
}
const router = useRouter()
const openDetails = (gid) =>{
  router.push(`/goodsDetails/${gid}`)
}
onMounted(() => {
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
        <h1>物品交易</h1>
        <div class="search">
          <input type="text">
          <button>
            搜索
          </button>
        </div>
      </div>
      <div class="block rightGap">
        <div class="box" v-for="item in goods" :key="item.gid">
          <div class="in whiteBg border" @click="openDetails(item.gid)">

            <img :src="item.images && item.images.length > 0 ? item.images[0].image : ''"
                 :alt="item.images && item.images.length > 0 ? item.images[0].description : ''"
                 v-if="item.images !== null && item.images.length > 0">
            <div class="info">
              <div class="line">
                <div class="price">
                  <span>￥</span>{{ item.price }}
                </div>
                <div class="name">
                </div>
              </div>

              <div class="intro">
                {{ item.content }}
              </div>
            </div>
          </div>

        </div>

      </div>
    </div>
  </div>
  <Release></Release>
</template>

<style scoped lang="scss">
.contain {
  margin-bottom: 1.2rem;
}

.block {
  //display: flex;
  //flex-wrap: wrap;
  //justify-content: center;
  //align-items: center;
  width: 100%;
  display: grid;
  gap: 1.11rem;
  grid-template-columns: 1fr 1fr 1fr 1fr;
}

.in{
  border-radius: 0.55rem;
  margin: 1rem;


  img {
    width: 100%;
    //width: 200px;
    //height: 200px;
    object-fit: contain;
    //object-fit: cover;
    //height: 11.11rem;
    border-top-left-radius: 0.55rem;
    border-top-right-radius: 0.55rem;
    border-bottom: 1px solid gainsboro;
  }

  .info {
    .line {
      margin: 0.5rem 0;
      //display: flex;
      //justify-content: center;
      //align-items: center;
    }

    .price {
      line-height: 1.8rem;
      background: orange;
      border-radius: 0.5rem;
      color: white;
      margin: 0 0.8rem;
      padding: 0 0.5rem;
      width: 5rem;

      span {
        color: #e1e1e1;
        font: {
          weight: bold;
          size: 1.2rem;
        };
      }
    }

    .intro {
      padding: 0 0.55rem 0.55rem;
      margin:1rem 0.5rem;
      display: -webkit-box;
      -webkit-box-orient: vertical;
      overflow: hidden;
      text-overflow: ellipsis;
      -webkit-line-clamp: 2; /* 控制显示的行数 */
    }
  }
}
</style>