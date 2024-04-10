<script setup>
import {useRouter} from "vue-router";

const router = useRouter()

const openPage=()=>{
  router.push('/add')
}
</script>

<template>
<div class="card" @click="openPage">
  <img src="../../../assets/icon/add.png" alt="添加">
</div>
</template>

<style scoped lang="scss">
.card{
  margin: 0;
  padding: 0;
  width: 60px;
  height: 60px;
  border-radius: 10px;
  box-shadow: 1px 6px 10px gainsboro;
  background: #D5E80E;
  position: fixed;
  bottom: 2rem;
  right: 2rem;
  text-align: center;
  line-height: 60px;
  img{
    width: 60%;
    height: 60%;
    margin-top: 12px;
  }
}
</style>