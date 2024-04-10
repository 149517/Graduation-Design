<script setup>

</script>

<template>
<div class="list">
  <div class="box whiteBg border">
    <div class="line">
      <div class="tit">
        我的头像
      </div>
      <div class="pic enter">
        <img class="border" src="../../../assets/logo.png" alt="">
      </div>
    </div>
    <div class="line">
      <div class="tit">
        用户名和密码
      </div>
      <div class="enter">
        <img src="../../../assets/icon/right.png" alt="">
      </div>
    </div>
  </div>
  <div class="box whiteBg border">
    <div class="line">
      <div class="tit">
        我的发布
      </div>
      <div class="enter">
        <img src="../../../assets/icon/right.png" alt="">
      </div>
    </div>
    <div class="line">
      <div class="tit">
        浏览历史
      </div>
      <div class="enter">
        <img src="../../../assets/icon/right.png" alt="">
      </div>
    </div>
    <div class="line">
      <div class="tit">
        喜欢
      </div>
      <div class="enter">
        <img src="../../../assets/icon/right.png" alt="">
      </div>
    </div>
    <div class="line">
      <div class="tit">
        收藏
      </div>
      <div class="enter">
        <img src="../../../assets/icon/right.png" alt="">
      </div>
    </div>

  </div>
  <div class="box whiteBg border">
    <div class="line">
      <div class="tit">
        关于网站
      </div>
      <div class="enter">
        <img src="../../../assets/icon/right.png" alt="">
      </div>
    </div>
    <div class="line">
      <div class="tit">
        退出登录
      </div>
      <div class="enter">
        <img src="../../../assets/icon/right.png" alt="">
      </div>
    </div>
  </div>
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
    img{
      width: 1.5rem;
      height: 1.5rem;
    }
    .pic{
      img{
        width: 4rem;
        height: 4rem;
        border-radius: 0.5rem;
      }
    }
  }
}
</style>