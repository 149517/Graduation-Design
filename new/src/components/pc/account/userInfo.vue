<script setup>


import {ref} from "vue";
import {userApi} from "../../../utils/api.js";
import ImageUpload from "../section/imageUpload.vue";
import {useStore} from "vuex";
import {useRouter} from "vue-router";

const store = useStore()
const router = useRouter()

const account = ref(localStorage.getItem('user'))
const password = ref(null)
const image = ref(null)

const fixValue = () => {
  store.commit('changeSend', true)
}
const handleSending = (value) => {
  console.log("图片")
  value.forEach((item) => {
    // console.log(item.thumbUrl)
    image.value = item.thumbUrl
  })

  fileUpload({account: account.value, password: password.value, image: image.value})
}
const fileUpload = async (data) => {
  console.log(data)

  let result = await userApi.fixUserInfo(data)
  console.log(result)

  alert(result.message)
  if (image.value) {
    localStorage.setItem('pic', image.value)
  }
  if (account.value) {
    localStorage.setItem('pic', image.value)
  }
  if (password.value) {
    localStorage.setItem('pic', image.value)
  }


  setTimeout(() => {
    router.go(-1)
  }, 1500)


}
</script>

<template>
  <div class="box whiteBg border">
    <div class="line">
      <div class="tit">
        头像修改
      </div>
      <image-upload @sending="handleSending"></image-upload>
    </div>
    <div class="line">
      <div class="tit">
        用户名修改
      </div>
      <input type="text" v-model="account">
    </div>
    <div class="line">
      <div class="tit">
        密码修改
      </div>
      <input type="text" v-model="password">
    </div>


  </div>
  <div class="btn">
    <button @click="fixValue">提交</button>
    <button @click="this.$router.go(0)">清空</button>
  </div>
</template>

<style scoped lang="scss">
.box {
  border-radius: 0.55rem;
  width: 90%;
  margin: 0 auto 1.1rem;

  .line {
    padding: 0.55rem 1.1rem;
    display: flex;
    justify-content: space-between;
    align-items: center;
    border-bottom: 1px solid gainsboro;

    img {
      width: 1.5rem;
      height: 1.5rem;
    }

    .pic {
      img {
        width: 4rem;
        height: 4rem;
        border-radius: 0.5rem;
      }
    }

    input {
      outline: none;
      height: 40px;
      border-radius: 0.5rem;
      padding: 0 0.5rem;
    }
  }
}

.btn {
  display: flex;
  justify-content: space-around;
  width: 80%;
  margin: 5rem auto;
}

</style>