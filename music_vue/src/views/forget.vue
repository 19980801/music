<template>
  <div class="bg-white pb-5">
    <header>
      <router-link to="index" class="mui-icon mui-icon-back text-white float-left"></router-link>
      <span>忘记密码</span>
    </header>
    <section class="pb-5">
      <img src="http://127.0.0.1:3001/imgs/login.jpg">
      <form action="#" method="post">
        <div class="d-flex">
          <span class="iconfont icon-shouji1 mt-2 pr-2"></span>
          <input type="text" placeholder="请输手机号码" maxlength="11" v-model="phone">
        </div>
        <div class="d-flex mt-2">
          <span class="iconfont icon-yanzhengma mt-2 pr-2"></span>
          <input type="text" placeholder="请输入验证码" v-model="num" class="test">
          <div @click="getcode">
            <span v-show="time" class="mui-btn count">获取验证码</span>
            <span v-show="!time" class="mui-btn count">{{count}}s后重新发送</span>
          </div>
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
      </form>
      <input type="submit" value="确认修改" class="mt-5" @click="updata">
    </section>
    <footer></footer>
  </div>
</template>
<script>
export default {
  data(){
    return{
      close:true,
      inputType:"password",
      phone:"",
      upwd:"",
      upwd2:"",
      num:"",
      infoShow:false,
      time:true,
      count:60,
      code:"",
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
        console.log(1);
        console.log(uname,upwd,upwd2,email,phone);
        if(result.data.code==1){
          console.log(uname,upwd,upwd2,email,phone);
          this.$toast(result.data.msg);
          setTimeout(function(){
            location.href="#/login";
          },900);
          return;
        }else{
          this.$toast(result.data.msg);
        }
      })
    },
    // 获取验证码
    getcode(){
      var code="";
      var codelength=6;
      var random=new Array(0,1,2,3,4,5,6,7,8,9);
      for(var i=0;i<codelength;i++){
        var index=Math.floor(Math.random()*9);
        code+=random[index];
      };
      this.time=false;
      this.code=code;
      console.log(`您本次的验证码是${this.code}`);
      // 倒计时
      var clock=window.setInterval(()=>{
        this.count--;
        if(this.count==0){
          this.time=true
         window.clearInterval(clock);
         this.count=60;
        }
      },1000);
    },
    updata(){
      var phone=this.phone;
      var upwd=this.upwd;
      var upwd2=this.upwd2;
      var param=new URLSearchParams();
      param.append("phone",phone);
      param.append("upwd",upwd);
      param.append("upwd2",upwd2);
      if(this.num==this.code){
        this.axios({
          method:"post",
          url:"http://127.0.0.1:3001/updata",
          data:param
        }).then(res=>{
          if(res.data.code==1){
            this.$toast(res.data.msg);
            setTimeout(function(){
              location.href="#/phonelogin";
            },900);
          }
          return;
        })
      }else{
        this.$toast("验证码错误!");
      }
    }
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
    margin:20px 50px;
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
  section .strong{
    margin:4px 50px 4px 50px;
  }
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
  /* 获取验证码 */
  .count{
    display:block;
    width:120px;
    height:40px;
    line-height:30px;
    background-color:#ddd;
    border:0;
    color:#000;
    padding:5px;
  }
  .test{
    width:150px;
    margin-right:18px;
  }
  footer{
    background-color: #fff;
    height:150px;
  }
</style>