<script setup>
// import Home from "./components/Page.vue";
// import MobileHome from "./components/Mobile-Page.vue";
// import {computed, onMounted, ref} from "vue";
//
// const screenWidth = ref(window.innerWidth);
//
// // 监听窗口尺寸变化，更新屏幕宽度
// const updateScreenWidth = () => {
//   screenWidth.value = window.innerWidth;
// };
//
// // 在 mounted 阶段添加窗口尺寸变化监听器
// onMounted(() => {
//   window.addEventListener('resize', updateScreenWidth);
// });
//
// // 根据屏幕尺寸返回对应的组件名
// const navbarComponent = computed(() => {
//   return screenWidth.value <= 768 ? 'MobileHome' : 'Home';
// });

</script>

<template>
<!--  <div>-->
<!--    &lt;!&ndash; 根据屏幕尺寸渲染不同的组件 &ndash;&gt;-->
<!--&lt;!&ndash;    <component :is="navbarComponent"></component>&ndash;&gt;-->
<!--    <Home v-if="navbarComponent === 'Home'"/>-->
<!--    <MobileHome v-else/>-->
<!--  </div>-->
  <router-view></router-view>
</template>

<style scoped>

</style>
