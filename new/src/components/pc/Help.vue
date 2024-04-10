<script setup>

import Nav from "./section/nav.vue";
</script>

<template>
  <div class="container bg">
    <div class="nav">
      <Nav></Nav>
    </div>
    <div class="contain">
      <div class="head">
        <h1>互助</h1>
        <div class="search">
          <input type="text">
          <button>
            搜索
          </button>
        </div>
      </div>
      <div class="block rightGap">
        <div class="box whiteBg">
          <div class="state">
            <div class="color">
              *
              <!--              通过设置内容的重要级别来显示不同的颜色-->
            </div>
            进行中
          </div>
          <div class="content">
            找一个同学帮忙打印一份文件送给老师，感谢！！
          </div>
          <div class="images">
            <img src="../../assets/logo.png" alt="">
            <img src="../../assets/logo.png" alt="">
            <img src="../../assets/logo.png" alt="">
            <img src="../../assets/logo.png" alt="">
          </div>
          <div class="time">
            2024.04.06
          </div>
        </div>
        <div class="box whiteBg">
          <div class="state">
            <div class="color">
              *
            </div>
            进行中
          </div>
          <div class="content">
            找一个同学帮忙打印一份文件送给老师，感谢！！
          </div>
          <div class="images">
            <img src="../../assets/logo.png" alt="">
            <img src="../../assets/logo.png" alt="">
          </div>
          <div class="time">
            2024.04.06
          </div>
        </div>
        <div class="box whiteBg">
          <div class="state">
            <div class="color">
              *
            </div>
            进行中
          </div>
          <div class="content">
            找一个同学帮忙打印一份文件送给老师，感谢！！
          </div>
          <div class="images">
            <img src="../../assets/logo.png" alt="">

          </div>
          <div class="time">
            2024.04.06
          </div>
        </div>
      </div>
    </div>
  </div>

</template>

<style scoped lang="scss">


.box {
  border-radius: 0.5rem;
  padding: 0.5rem 0.5rem 0.5rem 1.5rem;
  margin-bottom: 20px;

  .state {
    font: {
      size: 0.8rem;
    }
    display: flex;

    .color {
      padding-right: 1rem;
    }
  }

  .content {
    margin: 20px 0;
  }

  .images {
    display: grid;
    grid-template-columns: 1fr 1fr 1fr 1fr;

    img {
      border: 1px solid gainsboro;
      border-radius: 0.5rem;
    }
  }

  .time {
    text-align: right;
    margin-right: 2rem;
    font: {
      style: italic;
      size: 0.6rem;
    };
    color: #8d8d8d;
  }
}
</style>