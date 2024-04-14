<script setup>

import Nav from "./section/nav.vue";
import {onMounted, ref} from "vue";
import {postApi} from "../../utils/api.js";
import router from "../../utils/router.js";
import {formatDate} from "../../utils/utils.js"
import Release from "./section/release.vue";


const data = ref([
  {
    user: {
      pic: null,
      uid: null,
      username: null,
    },
    content: null,
    pid: null,
    time: null,
    collects: 0,
    likes: 0,
    liked: false,
    collected: false,
    images: [
      {
        image: null,
        description: "图片"
      }
    ],
  }
])


const getPost = async () => {
  const result = await postApi.getPost()
  console.log(result)
  data.value = result.data
  console.log(data.value)
}

const hot = ref([
  {
    pid:null,
    content:null
  }
])
const hotData = async () =>{
  const res = await postApi.getHosData()
  console.log(res)
  hot.value = res.data
}
const openDetails = (pid) => {
  router.push(`/postDetails/${pid}`)
}

const Like = async (pid, item) => {
  const result = await postApi.Like_post(pid)
  console.log(result)
  // 更新点赞数量
  item.likes = result.data.like_count;
  item.liked = result.data.liked;
}

const Collect = async (pid, item) => {
  const result = await postApi.Collect_post(pid)
  console.log(result)
  // 更新点赞数量
  item.collects = result.data.collect_count;
  item.collected = result.data.collected;
}

onMounted(() => {
  getPost()
  hotData()
})
</script>

<template>
  <div class="container bg">
    <div class="nav">
      <Nav></Nav>
    </div>
    <div class="contain">
      <div class="head">
        <h1>社区</h1>
        <div class="search">
          <input type="text">
          <button>
            搜索
          </button>
        </div>
      </div>
      <div class="block">
        <div class="community">
          <div class="box whiteBg" v-for="item in data" :key="item.pid">
            <div class="userInfo flex">
              <div class="pic">
                <img :src="item.user.pic" alt="">
              </div>
              <div class="name">
                {{ item.user.username }}
              </div>
            </div>
            <div class="post" @click="openDetails(item.pid)">
              <div class="text">
                {{ item.content }}
              </div>
              <div class="images" v-for="li in item.images">
                <img :src="li.image" :alt="li.description">
              </div>
              <div class="time">
                {{ formatDate(item.time) }}
              </div>
            </div>
            <div class="interactive">
              <div class="collect" @click="Collect(item.pid,item)">
                <img src="../../assets/icon/collect_active.png" alt="" v-if="item.collected">
                <img src="../../assets/icon/collect.png" alt="" v-else>
                {{ item.collects }}
              </div>
              <div class="comment" @click="openDetails(item.pid)">
                <img src="../../assets/icon/comment.png" alt="">

              </div>
              <div class="like" @click="Like(item.pid,item)">
                <img src="../../assets/icon/like_active.png" alt="" v-if="item.liked">
                <img src="../../assets/icon/like.png" alt="" v-else>
                {{ item.likes }}
              </div>
            </div>
          </div>

        </div>
        <div class="hot">
          <div class="in whiteBg">
            <h3>热门</h3>

            <div class="list">
              <div class="ll flex" v-for="(item,index) in hot" :key="item.pid" @click="openDetails(item.pid)">
                <div class="num">{{ index + 1}}</div>
                <div class="entry one-line-ellipsis">
                  {{ item.content }}
                </div>
              </div>


            </div>
          </div>
          <Release></Release>

        </div>
      </div>
    </div>
  </div>
</template>

<style scoped lang="scss">


.block {
  display: flex;

  .community {
    flex: 1;
  }

  .hot {
    width: 13rem;
    margin: 0 1.2rem;
  }
}

// 帖子样式
.box {
  box-sizing: border-box;
  padding: 0.5rem 1rem;
  border: 1px solid gainsboro;
  border-radius: 0.5rem;
  margin-bottom: 1.2rem;

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

  .post {
    margin: 1rem 0;
    font-size: 0.88rem;
    line-height: 1.5rem;

    .images {
      display: grid;
      grid-template-columns: 1fr 1fr 1fr;
      gap: 0.5rem;

      img {
        width: 100%;
        border: 1px solid gainsboro;
        border-radius: 0.5rem;
      }
    }

    .time {
      color: #8d8d8d;
      text-align: right;
    }
  }

  .interactive {
    border-top: 1px solid gainsboro;
    padding-top: 0.5rem;
    display: flex;

    .like,
    .collect,
    .comment {
      flex: 1;
      text-align: center;

      img {
        width: 1.5rem;
        height: 1.5rem;
        vertical-align: bottom;
      }
    }

    .comment {
      border-left: 1px solid gainsboro;
      border-right: 1px solid gainsboro;
    }
  }
}

.hot {
  position: relative;
  top: 0;
  left: 0;


  .in {
    width: 13.4rem;
    position: fixed;
    top: 5rem;
    right: 1.2rem;
    bottom: 10rem;
    border: 1px solid gainsboro;
    border-radius: 0.5rem;

    h3 {
      text-align: center;
      color: darkred;
      margin-top: 0.5rem;
    }

    .list {
      line-height: 1.2rem;
      margin: 1.2rem 0;
      padding: 0 0.5rem;

      .ll {
        margin: 0.83rem 0;
        padding-bottom: 5px;
        border-bottom: 1px gainsboro dashed;
      }

      .num {
        margin-right: 0.5rem;
        font: {
          size: 1.2rem;
          weight: bold;
          style: italic;
        }
      }

      .entry {
        font-size: 0.8rem;
      }
    }
  }
}
</style>