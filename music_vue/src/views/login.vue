<template>
  <div>
    <header>
      <img src="http://127.0.0.1:3001/imgs/login.jpg">
    </header>
    <section>
      <ul class="list-unstyled">
        <li>
          <a class="mui-btn" href="#/phonelogin">手机号登录</a>
        </li>
        <li>
          <a class="mui-btn" href="#/reg">注册</a>
        </li>
      </ul>
      <a href="#/index" class="text-white">游客试用
        <span class="mui-icon mui-icon-arrowright"></span>
      </a>
    </section>
    <footer>
      <p>其他登录方式</p>
      <ul class="list-unstyled d-flex justify-content-around">
        <li>
          <a href="javascript:;">
            <span class="mui-icon mui-icon-weixin"></span>
          </a>
        </li>
        <li>
          <a href="javascript:;">
            <span class="mui-icon mui-icon-qq"></span>
          </a>
        </li>
        <li>
          <a href="javascript:;">
            <span class="mui-icon mui-icon-weibo"></span>
          </a>
        </li>
        <li>
          <a href="javascript:;">
            <span class="mui-icon mui-icon-contact"></span>
          </a>
        </li>
      </ul>
    </footer>
  </div>
</template>
<script>
export default {
  data(){
    return{

    }
  }
}
</script>
<style scoped>
  header img{
    width:120px;
    height:120px;
    border-radius:50%;
    margin-top:180px;
  }
  div{
    background-color:#C20C0C;
    height:100%;
    width:100%;
  }
  section{
    margin:50px auto; 
  }
  section a{
    padding:12px;
    width:250px;
    border-radius:30px;
    margin:10px 0;
    outline:0;
    font-size:16px;
  }
  section a .mui-icon{
    font-size:16px;
  }
  footer{
    margin:70px;
  }
  footer ul>li>a{
    display:block;
    width:50px;
    height:50px;
    border-radius:50%;
    background-color:#fff;
    color:#C20C0C;
    line-height:50px;
  }
  footer p{
    color:#fff;
  }
  footer p::after{
    content:"———";
  }
  footer p::before{
    content:"———";
  }
</style>