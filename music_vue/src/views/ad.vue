<template>
  <div>
    <img src="http://127.0.0.1:3001/imgs/logo.jpg">
    <div class="clock">
      <span v-show="timer">{{count}}</span>
      <span @click="pass">跳过</span>
    </div>
  </div>
</template>
<script>
export default {
  data(){
    return{
      count:5,
      timer:true
    }
  },
  created() {
    this.time();
  },
  methods: {
    time(){
      var clock=window.setInterval(()=>{
        this.count--;
        if(this.count==0){
          this.timer=false
          window.clearInterval(clock);
          this.count=5;
          location.href="#/index";
        }
      },1000);
    },
    pass(){
      location.href="#/index";
    }
  },
}
</script>
<style scoped>
  img{
    width:100%;
    height:100%;
  }
  div.clock{
    position:absolute;
    bottom:10px;
    right:10px;
    width:120px;
    height:40px;
    background-color:rgba(0,0,0,0.2);
    line-height:40px;
    border-radius:30px;
    font-size:15px;
    color:#fff;
  }
</style>