<script setup>

import NavChat from "./section/nav-chat.vue";

</script>

<template>
  <div class="container bg">
    <div class="nav">
      <NavChat></NavChat>
    </div>
    <div class="contain whiteBg rightGap">
      <div class="friends">
        <h2>好友列表</h2>
        <div class="list">
          <div class="box pointer">
            <div class="pic">
              <img src="../../assets/logo.png" alt="">
            </div>
            <div class="mes">
              <div class="uname">用户名</div>
              <div class="info">昨天过得怎么样</div>
            </div>
          </div>
          <div class="box pointer">
            <div class="pic">
              <img src="../../assets/logo.png" alt="">
            </div>
            <div class="mes">
              <div class="uname">用户名</div>
              <div class="info">昨天过得怎么样</div>
            </div>
          </div>
          <div class="box pointer">
            <div class="pic">
              <img src="../../assets/logo.png" alt="">
            </div>
            <div class="mes">
              <div class="uname">用户名</div>
              <div class="info">昨天过得怎么样</div>
            </div>
          </div>
        </div>
      </div>
      <div class="chat bg">
        <div class="target">
          用户名
        </div>
        <div class="dialogue">
          <!--        通过值判断是当前用户还是聊天对象，如果是对象则通过通过类名置于左侧-->
          <div class="left">
            <div class="pic">
              <img src="../../assets/logo.png" alt="">
            </div>
            <div class="message">
              明天去哪玩？
            </div>
          </div>
          <div class="right">
            <div class="message">
              哪也不想去
            </div>
            <div class="pic">
              <img src="../../assets/logo.png" alt="">
            </div>
          </div>
        </div>
        <div class="input">
          <div class="tool">
            <img src="../../assets/icon/darkness.png" alt="">
            <img src="../../assets/icon/img.png" alt="">
          </div>
          <div class="text">
            <textarea placeholder="请输入内容" ref="input"></textarea>
          </div>
          <div class="btn themeBtn">
            发送
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped lang="scss">
// 设置 nav-chat 导航栏的单独样式
.container {

  $navWidth: 5rem;

  .nav {
    width: $navWidth;
  }

  .contain {
    width: calc(100% - $navWidth);
  }
}

.contain {
  margin: 1rem 1rem 1rem 0;
  display: flex;
  border-radius: 0.4rem;
  overflow: hidden;
  box-shadow: #c4c4c4 4px 1px 8px;

  .friends {
    flex: 2;
  }

  .chat {
    flex: 5;
  }
}

.friends {
  padding-top: .4rem;

  h2 {
    text-align: center;
  }

  .list {
    .box {
      $Height: 2.7rem;
      display: flex;
      height: $Height;
      border-bottom: 1px solid gainsboro;
      padding-left: 0.5rem;
      margin: 1rem 0;

      .pic {
        img {
          width: $Height;
          height: $Height;
          border-radius: 0.5rem;
        }
      }

      .mes {
        margin-left: 1rem;

        .uname {
          //font-size: 1.2rem;
        }

        .info {
          padding-top: 0.2rem;
          font-size: 0.7rem;
          color: #8d8d8d;
        }
      }
    }
  }
}

.chat {
  border-left: 1px solid gainsboro;
  display: flex;
  flex-direction: column;
  justify-content: space-between;

  .target {
    height: 2.5rem;
    text-align: center;
    line-height: 2.5rem;
    border-bottom: 1px solid gainsboro;;
    font: {
      size: 1.2rem;
      weight: bold;
    };
  }

  .dialogue {
    $Height: 2.2rem;

    .left,
    .right {
      display: flex;
      align-items: center;
      padding: 0.44rem 0.55rem;
    }

    .right {
      justify-content: flex-end;
    }

    .pic {
      margin: 0.5rem;

      img {
        width: $Height;
        height: $Height;
        border-radius: 0.5rem;
      }
    }

    .message {
      background: #d9d9d9;
      padding: 0.55rem;
      border-radius: 0.55rem;
    }

    .right {
      .message {
        background: rgba(17, 182, 0, 0.5);
      }
    }
  }

  .input {
    position: relative;
    top: 0;
    left: 0;
    border-top: 1px solid gainsboro;
    height: 10rem;

    .tool {
      height: 1.66rem;
      border-bottom: 1px solid rgba(220, 220, 220, 0.29);

      img {
        padding: 0.27rem;
        width: 1.1rem;
      }
    }

    .text {
      height: calc(10rem - 1.66rem);
      textarea {
        width: 90%;
        height: 100%;
        background: none;
        border: none;
        outline: none;
        padding: 0.55rem;
      }
    }

    .btn {
      cursor: pointer;
      position: absolute;
      bottom: 1.5rem;
      right: 1.5rem;
      width: 5rem;
      height: 1.8rem;
      line-height: 1.8rem;
      text-align: center;
      padding: 0.27rem 0.55rem;
      border-radius: 0.5rem;
      font-weight: bold;
      letter-spacing: 2px;
    }
  }
}
</style>