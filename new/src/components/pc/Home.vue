<script setup>

import NavLine from "./section/nav-line.vue";
</script>

<template>
  <div class="bg homeBg">
    <nav-line></nav-line>
    <div class="vessel">
      <div class="left-text">
        <div class="left">
          <div class="decline">
            <h1 class="one">欢迎来到 窗</h1>
            <p>在这里我们将开启
              <br>
              更加丰富的校园生活体验
            </p>

            <button @click="this.$router.push('/community')">
              进入社区
            </button>
          </div>

        </div>
        <div class="right">
          <img src="../../assets/images/Home/left-text-2.jpg" alt="社区">
        </div>
      </div>
      <div class="picture-column">
        <h1>满足校园内日常生活所需</h1>
        <p>在这里你可以进购物，参与活动，或者向他人求助</p>
        <div class="in">
          <div class="card">
            <img src="../../assets/images/Home/shopping.png" alt="购物">
            <h2>商品交易</h2>
            <p>提供校园范围内的商品交易，大家可以借此卖出或者购物一些东西</p>
            <div class="link">
              <router-link to="/shopping" class="textLink">
                立刻去看>>
              </router-link>
            </div>
          </div>
          <div class="card">
            <img src="../../assets/images/Home/activity.png" alt="活动">
            <h2>活动和游戏</h2>
            <p>参与游戏和活动吗，和校园内的其他人一起。</p>
            <div class="link">
              <router-link to="/activity" class="textLink">
                立刻去看>>
              </router-link>
            </div>
          </div>
          <div class="card">
            <img src="../../assets/images/Home/help.png" alt="互助">
            <h2>帮助或者求助别人</h2>
            <p>如果你需要别人的帮助或者刚好有时间，你可以来这里。</p>
            <div class="link">
              <router-link to="/help" class="textLink">
                立刻去看>>
              </router-link>
            </div>
          </div>
        </div>
      </div>
      <div class="left-text">
        <div class="left">
          <div class="decline">
          <h1>
            浏览校园内同学的帖子<br>
            可以参与讨论<br>
            发表自己的观点
          </h1>
          <br>
          <button @click="this.$router.push('/community')">
            进入社区
          </button>
          </div>
        </div>
        <div class="right">
          <img src="../../assets/images/Home/left-text-3.png" alt="社区">
        </div>
      </div>
      <div class="left-picture">
        <h1>浏览查看校园内的好友的动态</h1>
        <div class="in">
          <div class="left">
            <img src="../../assets/images/Home/left-picture-1.png" alt="社区">
          </div>
          <div class="right">
            <p>
              为他点一个赞，或者评论，或许会增进你们之间的关系
            </p>
            <button @click="this.$router.push('/community')">
              好友动态
            </button>
          </div>
        </div>
      </div>
      <div class="bottom">
        <div class="left">
          <h3>欢迎来到 窗</h3>
          <p>如果你还不知道看什么<br>
            那么你可以尝试先 <span class="textLink" @click="this.$router.push('/login')">登录</span>
            <br>
            登录后你可以查看更多的资讯和开启更多的功能
          </p>
        </div>
        <div class="right">
          <div class="logo">
            <img src="../../assets/logo2.png" alt="">
          </div>
        </div>

      </div>
    </div>
  </div>
</template>

<style scoped lang="scss">
.vessel {
  width: 90%;
  margin: auto;
}


.left-text {
  display: flex;
  justify-content: space-between;

  .one{
    font-size: 3.7remx;
  }
  .left{
    flex: 1;
    position: relative;
    top: 0;
    left: 0;
    .decline{
      position: absolute;
      top: 40%;
      left: 3.5rem;
      transform: translateY(-50%);
    }
  }
  h1{
    margin: 2.1rem 0;
  }
  p{
    margin-bottom: 2.1rem;
    line-height: 2.1rem;
  }
  .right{
    flex: 2;
    img{
      width: 100%;
    }
  }
}
.picture-column{
  text-align: center;
  h1{
    margin: 0.7rem 0;
  }
  p{
    margin-bottom: 1.4rem;
  }
  .in{
    display: flex;
    justify-content: space-around;
    .card{
      width: 30%;
      img{
        width: 100%;
      }
      h2{
        font-size: 1.7rem;
        margin-bottom: 0.5rem;
      }
      p{
        font-size: 0.8rem;
        line-height: 1.2rem;
        text-align: left;
        margin: 0;
      }
      .link{
        text-align: left;
        a{
          font-size: 0.8rem;
        }
      }
    }
  }
}
.left-picture{
  h1{
    text-align: center;
    margin: 30px 0;
  }
  .in{
    display: flex;
    .left{
      flex: 2;
      img{
        width: 100%;
      }
    }
    .right{
      flex: 1;
      position: relative;
      top: 150px;
      left: 30px;
      p{
        margin-bottom: 30px;
        line-height: 1.2rem;
      }
    }
  }
}
.bottom{
  width: 100%;
  margin-top: 30px;
  display: flex;
  justify-content: space-around;
  align-items: center;
  border-top: 1px solid gainsboro;
  .left{
    padding: 30px 0;
    h3{
      margin: 12px 0;
    }
    p{
      letter-spacing: 1px;
    }
  }
}
</style>