<script setup>

import {formatDate} from "../../../utils/utils.js";
import {onMounted, ref} from "vue";
import {postApi} from "../../../utils/api.js";

const post = ref([{
  pid: null,
  content: null,
  first_image: null,
  time: null,
}])

const getData= async () =>{
  const res = await postApi.getUserLike()
  console.log(res)
  post.value = res.data
}
onMounted(()=>{
  getData()
})
</script>

<template>
  <div class="box rightGap">
    <div class="line whiteBg" v-for="item in post" v-if="post[0]" @click="this.$router.push(`/postDetails/${item.pid}`)">
      <div class="ll">

        <div class="text">
          {{ item.content }}

          <!--              aaaa-->
        </div>

        <div class="image" v-if="item.first_image">
          <img :src="item.first_image" alt="">
        </div>
        <div class="time">
          {{ formatDate(item.time) }}
        </div>
      </div>

    </div>
  </div>
</template>

<style scoped lang="scss">
.box {
  padding: 1rem;
  margin-bottom: 1rem;

  .line {
    box-sizing: border-box;
    width: 100%;
    min-height: 8rem;
    border-radius: 0.5rem;
    padding: 0.5rem 1.5rem;
    margin: 1.5rem;
  }
}

.line {
  display: flex;
  justify-content: space-between;
}


.text {
  line-height: 40px;
  height: 50px;
  margin-bottom: 0.5rem;
}

.image {
  img {
    width: 100px;
    height: 100px;
    border-radius: 0.5rem;
  }
}

.time {
  font-size: 0.6rem;
  color: #8d8d8d;
}

.delete {
  display: flex;
  justify-content: center;
  align-items: center;
  //img{
  //  width: 50px;
  //  height: 50px;
  //}
  button {
    width: 6rem;
    height: 2rem;
    font-size: 0.8rem;
  }
}

</style>