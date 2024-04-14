<script setup>

import Nav from "./section/nav.vue";
import List from "./account/list.vue";
import {useStore} from "vuex";
import {computed} from "vue";

const store = useStore();

// 访问 vuex 中的数据

const currentPage = computed(() => store.state.currentPage);
</script>

<template>
  <div class="container bg">
    <div class="nav">
      <Nav></Nav>
    </div>
    <div class="contain rightGap">
      <div class="head">
        <h1>{{ currentPage }}</h1>
      </div>
      <div class="block">
        <router-view></router-view>
      </div>
    </div>
  </div>
</template>

<style scoped lang="scss">
.head {
  justify-content: center;
}



</style>