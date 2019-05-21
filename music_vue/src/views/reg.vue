<template>
  <div class="bg-white pb-5">
    <header>
      <router-link to="index" class="mui-icon mui-icon-back text-white float-left"></router-link>
      <span>注册</span>
    </header>
    <section class="pb-5">
      <img src="http://127.0.0.1:3001/imgs/login.jpg">
      <form action="#" method="post">
        <div class="d-flex">
          <span class="iconfont icon-shouji1 mt-2 pr-2"></span>
          <input type="text" placeholder="请输手机号码" maxlength="11" v-model="phone">
        </div>
        <div class="d-flex eyeShow">
          <span class="iconfont icon-mima mt-2 pr-2"></span>
          <input :type="inputType" placeholder="请输入密码" class="m-0" @keyup="test" v-model="upwd">
          <span v-if="close" class="iconfont icon-yanjing eye" @click="show"></span>
          <span v-else class="iconfont icon-yanjing1 eye" @click="show"></span>
        </div>
        <div class="strong">
          <span id="span1">弱</span>
          <span id="span2">中</span>
          <span id="span3">强</span>
        </div>  
        <div class="d-flex eyeShow">
          <span class="iconfont icon-mima mt-2 pr-2"></span>
          <input :type="inputType" placeholder="请输入密码" class="m-0" @keyup="flag" v-model="upwd2">
          <span v-if="close" class="iconfont icon-yanjing eye" @click="show"></span>
          <span v-else class="iconfont icon-yanjing1 eye" @click="show"></span>
        </div>
        <div class="istrue" v-show="infoShow">
          <span>两次密码不一致</span>
        </div>
        <div class="d-flex mt-2">
          <span class="iconfont icon-yonghuming mt-2 pr-2"></span>
          <input type="text" placeholder="请输入用户名" v-model="uname">
        </div>
        <div class="d-flex">
          <span class="iconfont icon-youxiang mt-2 pr-2"></span>
          <input type="email" placeholder="请输入邮箱" v-model="email">
        </div>
      </form>
      <my-test></my-test>
      <input type="submit" value="注册" class="mt-4" @click="reg">
    </section>
  </div>
</template>
<script>
import myTest from './test.vue'
export default {
  data(){
    return{
      close:true,
      inputType:"password",
      phone:"",
      upwd:"",
      upwd2:"",
      uname:"",
      email:"",
      infoShow:false,
    }
  },
  methods: {
    show(){
      if(this.close==true){
        this.inputType="text";
        this.close=false;
      }else{
        this.close=true;
        this.inputType="password";
      }
    },
    test(){
      if(this.upwd.length<5){
        document.getElementById("span1").className="msg";
      }else if(this.upwd.length<8){
        document.getElementById("span2").className="msg2";
      }else{
        document.getElementById("span3").className="msg3";
      }
    },
    flag(){
      if(this.upwd==this.upwd2){
        this.infoShow=false;
      }else{
        this.infoShow=true;
      }
    },
    reg(){
      var uname=this.uname;
      var upwd=this.upwd;
      var upwd2=this.upwd2;
      var email=this.email;
      var phone=this.phone;
      var param=new URLSearchParams();
      param.append('uname',uname);
      param.append("upwd",upwd);
      param.append("upwd2",upwd2);
      param.append("email",email);
      param.append("phone",phone);
      this.axios({
        method:"post",
        url:"http://127.0.0.1:3001/reg",
        data:param
      }).then(result=>{
        if(result.data.code==1){
          this.$toast(result.data.msg);
          setTimeout(function(){
            location.href="#/login";
          },900);
          return;
        }else{
          this.$toast(result.data.msg);
        }
      })
    }
  },
  components:{
    myTest
  }
}
</script>
<style scoped>
  header{
    color:#fff;
    background-color:#C20C0C;
    padding:10px;
  }
  section{
    margin:0px 50px;
  }
  section img{
    width:100px;
    height:100px;
    margin:10px 50px;
  }
  section .eyeShow{
    position: relative;
  }
  section .eye{
    position:absolute;
    top:9px;
    right:10px
  }
  section .iconfont{
    font-size:20px;
    font-weight:bold;
    color:#000;
  }
  section input[type="submit"]{
    background-color: #C20C0C;
    border:0;
    width:250px;
    padding:10px;
    margin:5px;
    border-radius:30px;
  }
  /* 密码强度 */
  section .strong span{
    background-color:#f9d194;
    padding:2px 30px;
    font-size:14px;
  }
  .msg{
    background:red !important;
  }
  .msg2{
    background:#f97101 !important;
  }
  .msg3{
    background:green !important;
  }
  .istrue{
    font-size:14px;
    color:#fff;
    padding:2px 30px;
  }
  .istrue span{
    background-color:#C20C0C;
  }
</style>