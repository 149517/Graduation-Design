<script setup>
import {onMounted, ref} from "vue";
import {useRoute, useRouter} from "vue-router";
import {userApi} from "../../../utils/api.js";
import {useStore} from "vuex";

const store = useStore()

const login = ref(true)

const route = useRoute()
const router = useRouter()

// 弹窗提示
import { notification } from 'ant-design-vue';
const openNotificationWithIcon = type => {
  let message = '';
  let description = '';

  if (type === 'success') {
    message = '注册成功';
    description = '正在跳转登录，登录即可查看更多的内容';
  } else if (type === 'info') {
    message = '密码错误';
    description = '两次密码输入不一致';
  } else if (type === 'warning') {
    message = '数据格式错误';
    description = '账户名大于等于3个字符，密码不少于6位';
  } else if (type === 'error') {
    message = '信息错误';
    description = '用户名和密码输入不正确';
  }

  notification[type]({
    message: message,
    description: description
  });
};

// 判断当前路径，如果是register 那么就将login改为false
const getPath = () => {
  if (route.path === '/register') {
    login.value = false
  }
}
const openPage = (item) => {
  if (item === 'login') {
    router.push('/login')
    login.value = true
  }
  if (item === 'register') {
    router.push('/register')
    login.value = false
  }
  if (item === 'home') {
    router.push('/home')
  }
}

// 登录&注册
const account = ref(null)
const password = ref(null)
const password2 = ref(null)


// 登录
const sign_in = async () => {
  if (account.value == null || password.value == null) {
    openNotificationWithIcon("warning")
    return null
  }
  if(account.value.length < 3 || password.value.length < 6){
    openNotificationWithIcon("warning")
    password.value = null
    return null
  }
  let result = null
  try {
    result = await userApi.login(account.value, password.value);
    // 登录成功的处理逻辑
    console.log(result);
  } catch (error) {
    // 登录失败的处理逻辑
    console.error("登录失败：", error); // 在控制台打印错误信息
    // 这里你可以使用前面提到的弹窗提示方法来显示错误信息给用户
    openNotificationWithIcon('error'); // 调用显示错误提示的函数

    account.value = null
    password.value = null
  }
  if (result) {
    console.log(result)
    store.commit('addUser', result.name)
    store.commit('addPic', result.pic)
    store.commit('addUid', result.uid)
    store.commit('addCareer', result.career)

    localStorage.setItem('token', result.Token)
    localStorage.setItem('pic', result.pic)
    localStorage.setItem('user', result.name)
    localStorage.setItem('uid', result.uid)

    // 跳转
    setTimeout(() => {
      router.push('/community')
    }, 500)

  }
}

// 注册
const sign_up = async () => {
  if (account.value == null || password.value == null || password2.value == null) {
    openNotificationWithIcon("warning")
    return null
  }
  if(account.value.length < 3 || password.value.length < 6 ||  password2.value.length < 6){
    openNotificationWithIcon("warning")
    password.value = null
    password2.value = null
    return null
  }
  if(password.value !== password2.value){
    openNotificationWithIcon("info")
    password.value = null
    password2.value = null
    return null
  }
  const result = await userApi.register(account.value, password.value)
  if (result) {
    openNotificationWithIcon('success')

    // 跳转
    setTimeout(() => {
      router.push('/login')
    }, 500)
  }
}

const clear = () => {
  account.value = null
  password.value = null
  password2.value = null
}

onMounted(() => {
  getPath()
})
</script>

<template>
  <div class="login" v-if="login">
    <div class="box">
      <div class="in">
        <div class="top">
          <div class="logo">
            <img src="../../../assets/logo.png" alt="logo">
          </div>
          欢迎回来
        </div>
        <div class="text">
          登录后查看更多内容
        </div>
        <div class="middle">
          <input type="text" placeholder="account" v-model.trim="account">
          <br>
          <input type="text" placeholder="password" v-model.trim="password">
        </div>
        <div class="bottom">
          <button class="themeBtn" @click="sign_in" @keydown.enter="sign_in">登录</button>
        </div>
        <div class="tip">
          还没有账号？立刻 <span class="textLink" @click="openPage('register')">注册</span>
          <br>
          <span class="textLink" @click="openPage('home')">返回首页</span>
        </div>
      </div>
    </div>
    <div class="backdrop">

    </div>
  </div>
  <div class="register" v-if="!login">
    <div class="backdrop">

    </div>
    <div class="box">
      <div class="in">
        <div class="top">
          <div class="logo">
            <img src="../../../assets/logo.png" alt="logo">
          </div>
          欢迎加入
        </div>
        <div class="middle">
          <input type="text" placeholder="account" v-model.trim="account">
          <br>
          <input type="text" placeholder="password" v-model.trim="password">
          <br>
          <input type="text" placeholder="again password" v-model.trim="password2">
        </div>
        <div class="bottom">
          <button class="themeBtn" @click="sign_up"  @keydown.enter="sign_up">注册</button>
        </div>
        <div class="tip">
          已经有账号？去 <span class="textLink" @click="openPage('login')">登录</span>
          <br>
          <span class="textLink" @click="openPage('home')">返回首页</span>
        </div>
      </div>
    </div>

  </div>
</template>

<style scoped lang="scss">
.text{
  margin-bottom: 2rem;
  letter-spacing: 2px;
}
.login,
.register {
  display: flex;
  height: 100vh;

  .box {
    flex: 1;
    display: flex;
    justify-content: center;
    align-items: center;
  }

}

.login {

  .backdrop {
    flex: 1;
    background: url("../../../assets/login/05.jpg") no-repeat center;
    background-size: cover;
  }
}

.register {
  .bottom {
    button {
      background: #EEACB0;
    }
  }

  .backdrop {
    flex: 1;
    background: url("../../../assets/login/06.jpg") no-repeat center;
    background-size: cover;
  }
}


.in {
  height: 22.2rem;
  display: flex;
  flex-direction: column;
  justify-content: space-around;
  align-items: center;

  .top {
    flex: 4;
    display: flex;
    justify-content: center;
    align-items: center;
    font: {
      size: 2rem;
      weight: bold;
    };
  }

  .middle {

    flex: 3;

    input {
      width: 11.1rem;
      height: 2.2rem;
      padding: 0 0.55rem;
      margin-bottom: 0.55rem;
      border: 1px solid black;
      border-radius: 1rem;
      outline: none;
    }
  }

  .bottom {
    flex: 2;

    button {
      width: 8rem;
      height: 2.2rem;
      border-radius: 1rem;
      border: 0;
      outline: none;
      font: {
        size: 1.1rem;
        weight: bold;
      };
    }
  }

  .tip {
    flex: 1;
    text-align: center;
    font-size: 0.8rem;
  }
}
</style>