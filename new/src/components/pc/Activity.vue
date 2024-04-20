<script setup>
import {onMounted, ref} from "vue";

const data = ref([{
  aid: null,
  content: null,
  type: 0,
  images: [
    {
      image: null,
      description: "无"
    }
  ]
}])
const router = useRouter()
const openDetails = (aid) => {
  router.push(`/activityDetails/${aid}`)
}
const getActivity = async () => {
  const result = await activityApi.getActivity()
  console.log(result)
  data.value = result.data
}

// 字符串截取
const getTruncatedContent = (content) => {
  if (content) {
    const commaIndex = content.indexOf('，');
    return commaIndex !== -1 ? content.substring(0, commaIndex) : content;
  } else {
    return '';
  }
}

onMounted(() => {
  getActivity()
})
import Nav from "./section/nav.vue";
import {activityApi} from "../../utils/api.js";
import {useRouter} from "vue-router";
import Release from "./section/release.vue";
</script>

<template>
  <div class="container bg">
    <div class="nav">
      <Nav></Nav>
    </div>
    <div class="contain">
      <div class="head">
        <h1>活动和游戏</h1>
        <div class="search">
          <input type="text">
          <button>
            搜索
          </button>
        </div>
      </div>
      <div class="block rightGap">
        <div class="box whiteBg border" v-for="item in data" :key="item.aid" @click="openDetails(item.aid)">
          <img :src="item.images && item.images.length > 0 ? item.images[0].image : ''"
               :alt="item.images && item.images.length > 0 ? item.images[0].description : ''"
               v-if="item.images !== null && item.images.length > 0">

          <!--          <div class="img" :style="{ 'background-image': 'url(' + item.images[0].image + ')' }"></div>-->

          <div class="info">
            <div class="line">
              <div class="type activity" v-if="item.type === 0">
                活动
              </div>
              <div class="type game" v-if="item.type === 1">
                游戏
              </div>
              <div class="name">
                {{ getTruncatedContent(item.content) }}
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
  <Release></Release>
</template>

<style scoped lang="scss">
.contain {
  margin-bottom: 1.2rem;
}

.block {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  //gap: 1.1rem;
  //grid-template-columns: 1fr 1fr 1fr;
}

.box {
  //flex: 1;
  width: 20%;
  border-radius: 0.5rem;
  margin: 1rem;
  //min-height: 21.1rem;

  img {
    width: 100%;
    //width: 330px;
    min-height: 225px;
    object-fit: cover;
    border-top-left-radius: 0.5rem;
    border-top-right-radius: 0.5rem;
    border-bottom: 1px solid gainsboro;
  }

  .info {
    padding: 0.27rem 0.55rem;

    .line {
      display: flex;
      align-items: center;
    }

    .type {
      padding: 3px 0.27rem;
      color: white;
      border-radius: 0.27rem;
    }

    .activity {
      background: #eeb142;
    }

    .game {
      background: #4ba7ef;
    }

    .name {
      margin-left: 0.44rem;
      font: {
        weight: bold;
      };
    }

    .intro {
      margin: 0.55rem 0;
      font-size: 0.8rem;
      display: -webkit-box;
      -webkit-box-orient: vertical;
      overflow: hidden;
      text-overflow: ellipsis;
      -webkit-line-clamp: 2; /* 控制显示的行数 */
    }
  }
}
</style>