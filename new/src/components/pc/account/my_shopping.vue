<script setup>
import {onMounted, ref} from "vue";
import {goodsApi} from "../../../utils/api.js";
import {useRouter} from "vue-router";

const data = ref([{
  gid: null,
  image: null,
  content: null,
  price: null,
}])
const total = ref(0)
const getData = async () => {
  const res = await goodsApi.getShoppingCart()
  console.log(res)
  data.value = res.data
  getTotal()
}
const getTotal = () => {
  data.value.forEach((item) => {
    total.value += parseFloat(item.price);
  })
}

const router = useRouter()
const openDetails = (id) =>{
  router.push(`/goodsDetails/${id}`)
}
const deleteShopping = async (gid) => {
  console.log(gid)
  const res = await goodsApi.deleteShopping(gid)
  console.log(res)

  data.value = null
  total.value = 0
  await getData()
}

onMounted(() => {
  getData()
})

</script>

<template>
  <div class="block">
    <div class="box whiteBg" v-for="item in data" :key="item.gid" @click="openDetails(item.gid)">
      <div class="image">
        <img :src="item.image.image" :alt="item.image.description" v-if="item.image">
        <img src="../../../assets/No_image.jpg" alt="" v-else>
      </div>
      <div class="text">
        {{ item.content }}
      </div>
      <div class="price">
        ￥ {{ item.price }}
      </div>
      <div class="delete">
        <button @click.stop="deleteShopping(item.gid)">删除</button>
      </div>
    </div>
    <div class="btn">
      结算 <span>（{{ total }}）</span>
    </div>
  </div>
</template>

<style scoped lang="scss">
.block {
}

.box {
  box-sizing: border-box;
  margin: 1rem 0;
  padding: 0.5rem 1.5rem;
  display: flex;
  justify-content: space-between;
  align-items: center;

  .image {
    width: 5rem;
    height: 5rem;

    img {
      width: 5rem;
      height: 5rem;
      border-radius: 0.5rem;
    }
  }

  .price {
    font-size: 1.2rem;
    font-weight: bold;
    letter-spacing: 2px;
  }

  .delete {
    button {
      width: 6rem;
      height: 2rem;
      font-size: 1rem;
    }
  }
}

.btn {
  width: 16rem;
  height: 2.8rem;
  margin: 5rem auto;
  background: black;
  border-radius: 0.5rem;
  color: #D5E80E;
  text-align: center;
  line-height: 50px;
  font-weight: bold;
  position: fixed;
  bottom: 2rem;
  left: 50%;
  transform: translateX(-50%);
}
</style>