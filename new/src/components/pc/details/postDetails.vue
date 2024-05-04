<script setup>
import Nav from "../section/nav.vue";
import {onMounted, ref} from "vue";
import {postApi} from "../../../utils/api.js";
import {useRoute} from "vue-router";
import {formatDate} from "../../../utils/utils.js"

const route = useRoute()
const pid = ref(null)
const content = ref(null)
const post = ref(
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
const getPost = async () => {
  const result = await postApi.getPostDetails(pid.value)
  console.log(result)
  post.value = result
}

// 获取评论
const getComment = async () => {
  const result = await postApi.getComment(pid.value)
  console.log(result)
  comment.value = result.data
}
const Like = async (pid, item) => {
  const result = await postApi.Like_post(pid)
  console.log(result)
  // 更新点赞数量
  item.likes = result.data.like_count;
  item.liked = result.data.liked;
}

// 添加评论
const addComment = async () => {
  const result = await postApi.addComment(pid.value, content.value)
  console.log(result)
  comment.value = null
  content.value = null
  await getComment()
}
const Collect = async (pid, item) => {
  const result = await postApi.Collect_post(pid)
  console.log(result)
  // 更新点赞数量
  item.collects = result.data.collect_count;
  item.collected = result.data.collected;
}


onMounted(() => {
  pid.value = route.params.pid
  console.log(pid.value)
  getPost()
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
        <h1>帖子详情</h1>
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
              <img :src="post.user.pic" alt="">
            </div>
            <div class="name">
              {{ post.user.username }}
            </div>
          </div>
          <div class="post">
            <div class="text">
              {{
                post.content
              }}
            </div>
            <div class="images" v-for="li in post.images">
              <img :src="li.image" :alt="li.description">
            </div>
            <div class="time">
              {{ formatDate(post.time) }}
            </div>
          </div>
          <div class="interactive">
            <div class="collect" @click="Collect(post.pid,post)">
              <img src="../../../assets/icon/collect_active2.png" alt="" v-if="post.collected">
              <img src="../../../assets/icon/collect.png" alt="" v-else>
              {{ post.collects }}
            </div>
            <div class="comment">
              <img src="../../../assets/icon/comment.png" alt="">

            </div>
            <div class="like" @click="Like(post.pid,post)">
              <img src="../../../assets/icon/like_active2.png" alt="" v-if="post.liked">
              <img src="../../../assets/icon/like.png" alt="" v-else>
              {{ post.likes }}
            </div>
          </div>
        </div>
        <div class="discuss">
          <div class="box whiteBg">
            <h3>评论</h3>
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
</template>

<style scoped lang="scss">
.box {
  width: 100%;
  box-sizing: border-box;
  padding: 30px 30px 0;
  border-radius: 10px;
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

.post {
  margin: 1rem 0;
  font-size: 0.88rem;
  line-height: 1.5rem;

  .images {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 1rem;

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
  padding: 1rem 0;
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