<template>
  <div class="bg-white">
    <header>
      <router-link to="login" class="mui-icon mui-icon-back float-left text-white"></router-link>
      <span>手机号登录</span>
    </header>
    <section>
      <form action="#" method="get">
        <div class="d-flex">
          <span class="iconfont icon-shouji1"></span>
          <input type="text" placeholder="请输入手机号" v-model="phone" v-focus>
        </div>
        <div class="d-flex">
          <span class="iconfont icon-mima"></span>
          <input type="password" placeholder="请输入密码" v-model="upwd">
        </div>
      </form>
      <input type="submit" value="登录" @click="login">
      <router-link to="forget">忘记密码?</router-link>
    </section>
    <footer></footer>
  </div>
</template>
<script>
export default {
  data(){
    return{
      phone:"",
      upwd:"",
    }
  },
  directives:{
    focus:{
      inserted:function(el){
        el.focus();
      }
    }
  },
  methods: {
    login(){
      this.axios.get("http://127.0.0.1:3001/login",{
        params:{
          phone:this.phone,
          upwd:this.upwd
        }
      }).then(res=>{
        if(res.data.code==1){
          this.$toast("登录成功");
          sessionStorage.setItem("uid",res.data.data[0].uid);
          sessionStorage.setItem("uname",res.data.data[0].uname);
          sessionStorage.setItem("img_url",res.data.data[0].img_url);
          setTimeout(() => {
            location.href="#/index";
          },900);
        }else{
          this.$toast("登录失败");
        }
      })
    }
  },
}
</script>
<style scoped>
  header{
    background-color:#C20C0C;
    color:#fff;
    padding:10px;
  }
  section{
    margin:50px 50px;
  }
  section span.iconfont{
    font-size:30px;
    margin-top:8px;
    color:#000;
  }
  section input{
    border:0;
    border-bottom:1px solid #ddd;
  }
  section input[type="submit"]{
    background-color:#C20C0C;
    width:250px;
    height:40px;
    border-radius:30px;
    margin:50px 0 50px 0;
  }
  section a{
    display:block;
    color:#333;
    font-size:14px;
    padding:0 0 280px 0;
  }
  footer{
    background-color:#C20C0C; 
    height:50px;
  }
</style>
