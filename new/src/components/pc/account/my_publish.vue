<script setup>
import {onMounted, ref} from "vue";
import {formatDate} from "../../../utils/utils.js";
import {activityApi, goodsApi, helpApi, postApi} from "../../../utils/api.js";
import SelectState from "../section/selectState.vue";
import {useRouter} from "vue-router";

const activeIndex = ref(0);

const post = ref([
  {
    pid: null,
    content: null,
    time: null,
    image: null,
  }
])

const goods = ref([
  {
    gid: null,
    content: null,
    time: null,
    image: null,
  }
])
const help = ref([
  {
    hid: null,
    content: null,
    time: null,
    image: null,
    status: null
  }
])
const activity = ref([
  {
    aid: null,
    content: null,
    time: null,
    image: null,
  }
])


const getData = async () => {
  let res = null;
  if (activeIndex.value === 0) {
    res = await postApi.getMyPost()
    console.log(res)
    post.value = res.data


    // 因为数据异步获取，所以导致在互助页面加载数据的时候，传递到子组件的状态是null,所以在页面第一次拿取数据的时候就一起获取
    let result = await helpApi.getMyHelp()
    console.log(result)
    help.value = result.data
  }
  if (activeIndex.value === 2) {
    res = await activityApi.getMyActivity()
    console.log(res)
    activity.value = res.data
  }
  if (activeIndex.value === 3) {
    res = await goodsApi.getMyGoods()
    console.log(res)
    goods.value = res.data
  }
}
const changeTab = (index) => {
  activeIndex.value = index;
  getData()
};

const deletePost = async (pid) => {
  const res = await postApi.deletePost(pid)
  console.log(res)

  await getData()
}
const deleteActivity = async (aid) => {
  const res = await activityApi.deleteActivity(aid)
  console.log(res)

  await getData()
}
const deleteGoods = async (gid) => {
  const res = await goodsApi.deleteGoods(gid)
  console.log(res)

  await getData()
}


const handleSelectChange = (value) => {
  console.log("类型")
  console.log('Selected value:', value);
  uploadStatus(value)
}
const router = useRouter()
const hid = ref(null)
const getHid = (id) => {
  hid.value = id
}
const uploadStatus = async (status) => {
  if (hid.value) {
    const res = await helpApi.changeStatus(hid.value, status)
    console.log(res)
    // router.go(0)
  }
}

// 打开详情页
const openPage = (type, id) => {
  if (type === 'post') {
    router.push(`/postDetails/${id}`)
  }
  if (type === 'help') {
    router.push(`/helpDetails/${id}`)
  }
  if (type === 'activity') {
    router.push(`/activityDetails/${id}`)
  }
  if (type === 'goods') {
    router.push(`/goodsDetails/${id}`)
  }
}
onMounted(() => {
  getData()
})
</script>

<template>
  <div class="card">
    <div class="li" :class="{active: activeIndex === 0}" @click.stop="changeTab(0)">帖子</div>
    <div class="li" :class="{active: activeIndex === 1}" @click.stop="changeTab(1)">求助</div>
    <div class="li" :class="{active: activeIndex === 2}" @click.stop="changeTab(2)">活动</div>
    <div class="li" :class="{active: activeIndex === 3}" @click.stop="changeTab(3)">商品</div>
  </div>
  <div class="box rightGap">
    <div v-if="activeIndex === 0">
      <div class="post">
        <div class="line whiteBg" v-for="item in post" v-if="post[0]" @click.stop="openPage('post',item.pid)">
          <div class="ll">

            <div class="text">
              {{ item.content }}

              <!--              aaaa-->
            </div>

            <div class="image" v-if="item.image">
              <img :src="item.image.image" :alt="item.image.description">
            </div>
            <div class="time">
              {{ formatDate(item.time) }}
            </div>
          </div>

          <div class="delete">
            <!--            <img src="../../../assets/icon/delete.png" alt="">-->
            <button @click.stop="deletePost(item.pid)">删除</button>
          </div>
        </div>
      </div>

    </div>
    <div v-if="activeIndex === 1">
      <div class="post">
        <div class="line whiteBg" v-for="item in help" v-if="help[0]" @click.stop="openPage('help',item.hid)">
          <div class="ll">
            <div class="text">
              {{ item.content }}
            </div>
            <div class="image" v-if="item.image">
              <img :src="item.image.image" :alt="item.image.description">
            </div>
            <div class="time">
              {{ formatDate(item.time) }}
            </div>
          </div>
          <div class="delete">
            <!--            <img src="../../../assets/icon/delete.png" alt="">-->
            <select-state :value="item.status" @selectChange="handleSelectChange"
                          @click.stop="getHid(item.hid)"></select-state>
          </div>
        </div>
      </div>
    </div>
    <div v-if="activeIndex === 2">
      <div class="post">
        <div class="line whiteBg" v-for="item in activity" v-if="activity[0]"
             @click.stop="openPage('activity',item.aid)">
          <div class="ll">

            <div class="text">
              {{ item.content }}

              <!--              aaaa-->
            </div>

            <div class="image" v-if="item.image">
              <img :src="item.image.image" :alt="item.image.description">
            </div>
            <div class="time">
              {{ formatDate(item.time) }}
            </div>
          </div>

          <div class="delete">
            <!--            <img src="../../../assets/icon/delete.png" alt="">-->
            <button @click.stop="deleteActivity(item.aid)">删除</button>
          </div>
        </div>
      </div>
    </div>
    <div v-if="activeIndex === 3">
      <div class="post">
        <div class="line whiteBg" v-for="item in goods" v-if="goods[0]" @click.stop="openPage('goods',item.gid)">
          <div class="ll">

            <div class="text">
              {{ item.content }}

              <!--              aaaa-->
            </div>

            <div class="image" v-if="item.image">
              <img :src="item.image.image" :alt="item.image.description">
            </div>
            <div class="time">
              {{ formatDate(item.time) }}
            </div>
          </div>

          <div class="delete">
            <!--            <img src="../../../assets/icon/delete.png" alt="">-->
            <button @click.stop="deleteGoods(item.gid)">删除</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped lang="scss">
.card {
  display: flex;
  justify-content: space-around;

  .li {
    width: 9rem;
    height: 40px;
    margin: 0 1rem;
    text-align: center;
    line-height: 40px;
    background: white;
    border-radius: 0.5rem;
    cursor: pointer;

    &.active {
      background: lightblue;
    }
  }
}

.box {
  padding: 1rem;

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