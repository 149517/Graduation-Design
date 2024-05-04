<script setup>

import Nav from "../section/nav.vue";
import ImageUpload from "../section/imageUpload.vue";
import {ref} from "vue";
import store from "../../../utils/store.js";
import {activityApi, goodsApi, helpApi, postApi} from "../../../utils/api.js";
import {useRouter} from "vue-router";
import {notification} from "ant-design-vue";


const router = useRouter()
const content = ref(null)
const price = ref(null)
const type = ref(null)
const contact_info = ref(null)

const activity = ref(false)
const goods = ref(false)
const contact = ref(false)

const fileList = ref({
  content: null,
  type: null,
  images: [],
  a_type: null,
  price: null,
  contact_info: null
})

const openNotificationWithIcon = type => {
  let message = '';
  let description = '';

  if (type === 'success') {
    message = 'Success';
    description = '内容发布成功.';
  } else if (type === 'info') {
    message = '未填写';
    description = '内容不能为空.';
  } else if (type === 'warning') {
    message = '内容未填写';
    description = '商品价格为不能空';
  } else if (type === 'error') {
    message = 'Error';
    description = '添加失败.';
  }

  notification[type]({
    message: message,
    description: description
  });
};


const clear = () => {
  fileList.value = null;
  store.commit('changeSend', false)
}

// image 是否上传图片，点击即为上传
const image = ref(false)
const getImage = () => {
  image.value = true
}
// 修改sending的值，触发子组件向父组件传值，然后发送请求
const fixValue = () => {
  // if (image.value === false) {
  //   console.log(store.state.send)
  store.commit('changeSend', true)
  // } else {
  //   fileUpload()
  // }
}


// 接收子组件传递过来的图片文件，将其添加到fileList 对象内
const handleSending = (value) => {
  console.log("图片")
  value.forEach((item) => {
    // console.log(item.thumbUrl)
    fileList.value.images.push(item.thumbUrl)
  })
  // console.log(fileList.value)
  fileUpload()
}
const handleSelectChange = (value) => {

  console.log("类型")
  console.log('Selected value:', value);
  contact.value = value !== 'post';
  if (value === 'goods') {
    goods.value = true
    activity.value = false
  }
  if (value === 'activity') {
    activity.value = true
    goods.value = false
  }
  // 在这里处理选中的值
  fileList.value.type = value
  console.log(fileList.value)
}
const fileUpload = async () => {
  fileList.value.content = content.value
  fileList.value.contact_info = contact_info.value
  if (!content.value) {
    openNotificationWithIcon('info')
    store.commit('changeSend', false)
    return null
  }
  if (!fileList.value.type) {
    openNotificationWithIcon('info')
    store.commit('changeSend', false)
    return null
  }
  if (fileList.value.type !== 'post') {
    if (!fileList.value.contact_info) {
      openNotificationWithIcon('info')
      store.commit('changeSend', false)
      return null
    }
  }

  console.log(fileList.value)

  let result = null;
  try {
    let result = null;
    if (fileList.value.type === 'post') {
      result = await postApi.fileUpload(fileList.value);
    } else if (fileList.value.type === 'help') {
      result = await helpApi.fileUpload(fileList.value);
    } else if (fileList.value.type === 'activity') {
      fileList.value.a_type = type.value;
      result = await activityApi.fileUpload(fileList.value);
    } else if (fileList.value.type === 'goods') {
      if (!price.value) {
        openNotificationWithIcon('warning');
        // 重置状态，使按钮再次可点击
        store.commit('changeSend', false);
        return null;
      }
      fileList.value.price = price.value;
      result = await goodsApi.fileUpload(fileList.value);
      // alert(result.message);
    }

    openNotificationWithIcon('success');
    console.log(result);

    // 刷新页面
    setTimeout(() => {
      router.go(0);
    }, 500);
  } catch (error) {
    console.error("数据提交失败：", error);
    openNotificationWithIcon('error');
    // 重置状态，使按钮再次可点击
    clear()
  }
  console.log(result)

  // // 刷新页面
  setTimeout(() => {
    router.go(0)
  }, 500)

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
          <ImageUpload @click="getImage" @sending="handleSending"></ImageUpload>
        </div>
        <div class="type">
          发布为：
          <Select @selectChange="handleSelectChange"></Select>
        </div>
        <div class="type price" v-if="goods">
          价格：<input type="text" v-model.number="price">
        </div>
        <div class="type" v-if="activity">
          类型：
          <label>
            <input type="radio" v-model="type" :value="1">
            游戏
          </label>
          <label>
            <input type="radio" v-model="type" :value="0">
            活动
          </label>
        </div>
        <div class="type info" v-if="contact">
          联系方式：<input type="text" v-model.trim="contact_info">
        </div>
        <div class="btn">
          <button @click="fixValue()">发布</button>
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
  margin: 1.5rem 0.5rem;

  label {
    margin-right: 2rem;
  }
}

.price,
.info {
  input {
    border-radius: 0.5rem;
    height: 35px;
    line-height: 35px;
    outline: none;
    padding: 0 0.5rem;
  }
}

.btn {
  margin-top: 2rem;
  text-align: center;
}
</style>