<script setup>

import Nav from "./section/nav.vue";
import List from "./account/list.vue";
</script>

<template>
  <div class="container bg">
    <div class="nav">
      <Nav></Nav>
    </div>
    <div class="contain rightGap">
      <div class="head">
        <h1>我的账户</h1>
      </div>
      <div class="block">
        <List></List>
      </div>
    </div>
  </div>
</template>

<style scoped lang="scss">
.head {
  justify-content: center;
}



</style>