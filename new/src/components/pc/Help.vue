<script setup>

import Nav from "./section/nav.vue";
import {onMounted, ref} from "vue";
import {helpApi} from "../../utils/api.js";
import {formatDate} from "../../utils/utils.js";
import {useRouter} from "vue-router";
import Release from "./section/release.vue";

const helps = ref([{
  hid: null,
  content: null,
  time: null,
  status: 1,
  images: [{
    image: null,
    description: null
  }]
}
])

const getHelps = async () => {
  const result = await helpApi.getHelps()
  console.log(result)
  helps.value = result.data
}
const router = useRouter()
const openDetails = (hid) =>{
  router.push(`/helpDetails/${hid}`)
}
onMounted(() => {
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
        <h1>互助</h1>
        <div class="search">
          <input type="text">
          <button>
            搜索
          </button>
        </div>
      </div>
      <div class="block rightGap whiteBg">
        <div class="box" v-for="item in helps" :key="item.hid">
          <div
              @click="openDetails(item.hid)"
              :class="{'Incomplete': item.status === 1, 'Completed': item.status === -1, 'In_progress': item.status === 0}">
            <div class="state" v-if="item.status === 1">
              <div class="color"></div>
              未完成
            </div>
            <div class="state" v-if="item.status === -1">
              <div class="color"></div>
              已完成
            </div>
            <div class="state" v-if="item.status === 0">
              <div class="color"></div>
              进行中
            </div>
            <div class="content">
              {{ item.content }}
            </div>
            <div class="images" v-for="li in item.images">
              <img :src="li.image" :alt="li.description">
            </div>
            <div class="time">
              {{ formatDate(item.time) }}
            </div>
          </div>
        </div>


      </div>
    </div>
    <Release></Release>
  </div>

</template>

<style scoped lang="scss">


.box {
  border-radius: 0.5rem;
  padding: 0.5rem 0.5rem 0.5rem 1.5rem;
  margin-bottom: 20px;

  .state {
    font: {
      size: 0.8rem;
    }
    display: flex;
    align-items: center;

    .color {
      margin-right: 1rem;
      width: 0.5rem;
      height: 0.5rem;
      border-radius: 0.25rem;
    }

  }

  .Incomplete {
    background: #fff0f0;
    padding: 1rem;
    border-radius: 0.5rem;

    .color {
      background: #cc5858;
    }
  }

  .In_progress {
    background: #dcf6de;
    padding: 1rem;
    border-radius: 0.5rem;

    .color {
      background: #71ee7b;
    }
  }

  .Completed {
    background: #d9d9d9;
    padding: 1rem;
    border-radius: 0.5rem;

    .color {
      background: #858585;
    }
  }

  .content {
    margin: 20px 0;
  }

  .images {
    display: flex;
    flex-wrap: wrap;
    width: 100%;

    img {
      max-width: 30%;
      margin: 0.5rem;
      border: 1px solid gainsboro;
      border-radius: 0.5rem;
    }
  }

  .time {
    text-align: right;
    margin-right: 2rem;
    font: {
      style: italic;
      size: 0.6rem;
    };
    color: #8d8d8d;
  }
}
</style>