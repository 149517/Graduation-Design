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
        <h1>物品交易</h1>
        <div class="search">
          <input type="text">
          <button>
            搜索
          </button>
        </div>
      </div>
      <div class="block rightGap">
        <div class="box whiteBg border">
          <img src="../../assets/images/Activity/cup.jpg" alt="商品">
          <div class="info">
            <div class="line">
              <div class="price">
                <span>￥</span>50
              </div>
              <div class="name">
                水杯
              </div>
            </div>

            <div class="intro">
              买多了，出一个
            </div>
          </div>
        </div>
        <div class="box whiteBg border">
          <img src="../../assets/images/Activity/cup.jpg" alt="商品">
          <div class="info">
            <div class="line">
              <div class="price">
                <span>￥</span>50
              </div>
              <div class="name">
                水杯
              </div>
            </div>

            <div class="intro">
              买多了，出一个
            </div>
          </div>
        </div>
        <div class="box whiteBg border">
          <img src="../../assets/images/Activity/cup.jpg" alt="商品">
          <div class="info">
            <div class="line">
              <div class="price">
                <span>￥</span>50
              </div>
              <div class="name">
                水杯
              </div>
            </div>

            <div class="intro">
              买多了，出一个
            </div>
          </div>
        </div>
        <div class="box whiteBg border">
          <img src="../../assets/images/Activity/cup.jpg" alt="商品">
          <div class="info">
            <div class="line">
              <div class="price">
                <span>￥</span>50
              </div>
              <div class="name">
                水杯
              </div>
            </div>

            <div class="intro">
              买多了，出一个
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped lang="scss">
.contain {
  margin-bottom: 1.2rem;
}

.block {
  display: grid;
  gap: 1.11rem;
  grid-template-columns: 1fr 1fr 1fr;
}
.box{
  border-radius: 0.55rem;
  img{
    width: 100%;
    //height: 11.11rem;
    border-top-left-radius: 0.55rem;
    border-top-right-radius: 0.55rem;
    border-bottom: 1px solid gainsboro;
  }
  .info{
    .line{
      display: flex;
      justify-content: center;
      align-items: center;
    }
    .price{
      line-height: 1.8rem;
      span{
        color: orange;
        font: {
          weight: bold;
          size: 1.2rem;
        };
      }
    }
    .intro{
      padding: 0 0.55rem 0.55rem;
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