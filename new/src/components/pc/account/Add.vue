<script setup>

import Nav from "../section/nav.vue";
import ImageUpload from "../section/imageUpload.vue";
import {ref} from "vue";
import store from "../../../utils/store.js";
import {helpApi, postApi} from "../../../utils/api.js";
import {useRouter} from "vue-router";


const router = useRouter()
const content = ref(null)


const fileList = ref({
  content: null,
  type: null,
  images: []
})


const clear = () => {
  fileList.value = null;
  store.commit('changeSend', false)
}

// 修改sending的值，触发子组件向父组件传值，然后发送请求
const fixValue = () => {
  store.commit('changeSend', true)
}


// 接收子组件传递过来的图片文件，将其添加到fileList 对象内
const handleSending = (value) => {
  console.log("图片")
  value.forEach((item) => {
    // console.log(item.thumbUrl)
    fileList.value.images.push(item.thumbUrl)
  })
  fileList.value.content = content.value
  fileUpload()
}
const handleSelectChange = (value) => {
  console.log("类型")
  console.log('Selected value:', value);
  // 在这里处理选中的值
  fileList.value.type = value
  // console.log(fileList.value)
}
const fileUpload = async () => {
  console.log(fileList.value)

  let result = null;
  if(fileList.value.type === 'post'){
    result = await postApi.fileUpload(fileList.value)
    alert(result.message)
  }
  if(fileList.value.type === 'help'){
    result = await helpApi.fileUpload(fileList.value)
    alert(result.message)
  }

  console.log(result)

  // 刷新页面
  setTimeout(()=>{
    router.go(0)
  },1500)

}


</script>

<template>
  <div class="container bg">
    <div class="nav">
      <Nav></Nav>
    </div>
    <div class="contain">
      <div class="head">
        <h1>内容发布</h1>
        <div class="search">
          <!--            <input type="text">-->
          <!--            <button>-->
          <!--              搜索-->
          <!--            </button>-->
        </div>
      </div>
      <div class="block rightGap">
        <textarea id="text" v-model="content"></textarea>
        <div class="img">
          <ImageUpload @sending="handleSending"></ImageUpload>
        </div>
        <div class="type">
          发布为：
          <Select @selectChange="handleSelectChange"></Select>
        </div>
        <div class="btn">
          <button @click="fixValue">发布</button>
        </div>

      </div>
    </div>
  </div>
</template>
<style scoped lang="scss">
#text {
  box-sizing: border-box;
  width: 100%;
  height: 16rem;
  outline: none;
  border-radius: 10px;
  padding: 1rem;
  font-size: 1.2rem;
  line-height: 1.6rem;
}

.img {

}

.type {
  margin: 1rem 0.5rem;
}

.btn {
  margin-top: 2rem;
  text-align: center;
}
</style>