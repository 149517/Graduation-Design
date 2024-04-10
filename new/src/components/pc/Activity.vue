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
        <h1>活动和游戏</h1>
        <div class="search">
          <input type="text">
          <button>
            搜索
          </button>
        </div>
      </div>
      <div class="block rightGap">
        <div class="box whiteBg border">
          <img src="../../assets/images/Activity/01.jpg" alt="活动">
          <div class="info">
            <div class="line">
              <div class="type activity">
                活动
              </div>
              <div class="name">
                去海边旅游
              </div>
            </div>

            <div class="intro">
              五一打算自驾去海边，目前2个人，再来2个，会开车最好。
            </div>
          </div>
        </div>
        <div class="box whiteBg border">
          <img src="../../assets/images/Activity/01.jpg" alt="活动">
          <div class="info">
            <div class="line">
              <div class="type activity">
                活动
              </div>
              <div class="name">
                去海边旅游
              </div>
            </div>

            <div class="intro">
              五一打算自驾去海边，目前2个人，再来2个，会开车最好。
            </div>
          </div>
        </div>
        <div class="box whiteBg border">
          <img src="../../assets/images/Activity/01.jpg" alt="活动">
          <div class="info">
            <div class="line">
              <div class="type game">
                游戏
              </div>
              <div class="name">
                去海边旅游
              </div>
            </div>

            <div class="intro">
              五一打算自驾去海边，目前2个人，再来2个，会开车最好。
            </div>
          </div>
        </div>
        <div class="box whiteBg border">
          <img src="../../assets/images/Activity/01.jpg" alt="活动">
          <div class="info">
            <div class="line">
              <div class="type activity">
                活动
              </div>
              <div class="name">
                去海边旅游
              </div>
            </div>

            <div class="intro">
              五一打算自驾去海边，目前2个人，再来2个，会开车最好。
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped lang="scss">
.contain{
  margin-bottom: 1.2rem;
}
.block {
  display: grid;
  gap: 1.1rem;
  grid-template-columns: 1fr 1fr 1fr;
}

.box {
  width: 100%;
  border-radius: 0.5rem;

  img {
    width: 100%;
    max-height: 21.1rem;
    border-top-left-radius: 0.5rem;
    border-top-right-radius: 0.5rem;
  }

  .info {
    padding: 0.27rem 0.55rem;

    .line {
      display: flex;
      align-items: center;
    }

    .type {
      padding: 3px 0.27rem;
      color: white;
      border-radius: 0.27rem;
    }
    .activity{
      background: #eeb142;
    }
    .game{
      background: #4ba7ef;
    }

    .name {
      margin-left: 0.44rem;
      font: {
        weight: bold;
      };
    }

    .intro {
      margin: 0.55rem 0;
      font-size: 0.8rem;
      display: -webkit-box;
      -webkit-box-orient: vertical;
      overflow: hidden;
      text-overflow: ellipsis;
      -webkit-line-clamp: 2; /* 控制显示的行数 */
    }
  }
}
</style>