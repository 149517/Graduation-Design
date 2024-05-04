<script setup>

import {formatDate} from "../../../utils/utils.js";
import {activityApi} from "../../../utils/api.js";
import {useRoute, useRouter} from "vue-router";
import {onMounted, ref} from "vue";

const wechat = ref(false)
const route = useRoute()
const aid = ref(null)
const data = ref({
  aid: null,
  content: null,
  time: null,
  type: 0,
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
const comment = ref([
  {
    user: {
      uid: null,
      pic: null,
      name: null
    },
    time: null,
    content: null,
  }
])
const getActivity = async () => {
  const result = await activityApi.getActivityDetails(aid.value)
  console.log(result)
  data.value = result
}

// 获取评论
const getComment = async () => {
  const result = await activityApi.getDiscuss(aid.value)
  console.log(result)
  comment.value = result.data
}
const content = ref(null)
const addComment = async () => {
  const result = await activityApi.addDiscuss(aid.value, content.value)
  console.log(result)
  comment.value = null
  content.value = null
  await getComment()
}

const router = useRouter()

onMounted(() => {
  aid.value = route.params.aid
  getActivity()
  getComment()
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
          <div class="btn"  @click="wechat = !wechat">
            <button>联系我</button>
          </div>
        </div>
        <div class="discuss">
          <div class="box whiteBg">
            <h3>讨论</h3>
            <div class="addComment">
              <input type="text" v-model="content" @keydown.enter="addComment">
              <button @click="addComment">发表</button>
            </div>

            <div class="list">
              <div class="li" v-for="li in comment">
                <div class="user flex">
                  <div class="pic">
                    <img :src="li.user.pic" alt="头像">
                  </div>
                  <div class="name">
                    {{ li.user.name }}
                  </div>
                </div>
                <div class="text">
                  {{ li.content }}
                </div>
                <div class="time">
                  {{ formatDate(li.time) }}
                </div>
              </div>
            </div>
          </div>

        </div>
      </div>
    </div>
  </div>
  <div class="wechat" v-if="wechat">
    <p v-if="data.contact_info">{{data.contact_info}}</p>
    <img v-else src="../../../assets/images/WeChat.jpg" alt="">
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

.activity {
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
  text-align: center;
  margin-bottom: 1rem;
}

.discuss {
  margin: 2rem 0;

  .box {
    padding-bottom: 30px;
  }

  .addComment {
    display: flex;
    align-items: center;
    $height: 40px;
    margin: 30px 0;

    input {
      flex: 1;
      margin-right: 20px;
      padding: 0 16px;
      height: $height;
      outline: none;
      border: 1px solid gainsboro;
      border-radius: 8px;
    }

    button {
      width: 100px;
      height: $height;
    }
  }

  .list {
    .li {
      margin: 20px 0;
      position: relative;
      top: 0;
      left: 0;
      border-bottom: 1px solid gainsboro;

      .user {
        $Height: 30px;

        .pic {
          img {
            width: $Height;
            height: $Height;
            border-radius: 50%;
          }
        }

        .name {
          height: $Height;
          line-height: $Height;
          margin-left: 1rem;
          color: #8d8d8d;
        }
      }

      .text {
        margin: 5px;
        font-size: 0.8rem;
      }

      .time {
        position: absolute;
        top: 10px;
        right: 20px;
        color: #b6b6b6;
        font-size: 0.5rem;
      }
    }
  }
}
</style>