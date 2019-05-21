<template>
	<header>
    <span class="mui-icon mui-icon-mic float-left mt-2 ml-2"></span>
    <div class="search">
      <input type="text" placeholder="搜索音乐、歌词、电台" v-model="key" v-focus @keyup.13="search">
      <img src="http://127.0.0.1:3001/imgs/search.png" @click="search">
    </div>
	</header>
</template>
<script>
export default {
  data(){
    return{
     key:""
    }
  },
  // input自动获取焦点
  directives:{
    focus:{
      inserted:function(el){
        el.focus();
      }
    }
  },
  created() {
    this.key=this.$route.params.key;
  },
  methods: {
    search(){
      var key=this.key;
      if(!key){
        this.$toast("请输入您要搜索的内容");
        return;
      }
      if(this.key.trim()!==""){
        this.$router.push(`/searchlist/${this.key}`);
      }
      if(this.$route.path.split("/")[1]=="searchlist"){
        // console.log(this.$route.path.split("/")[1])
        location.reload();
      }
    }
  },
}
</script>
<style scoped>
  header{
    background-color:#C20C0C;
    color:#fff;
    height:50px;
    line-height:50px;
    width:100%;
  }
  header input{
    width:250px;
		height:35px;
		border:0;
		border-radius:30px;
  }
  header .mui-icon{
    font-size:30px;
  }
  header img{
    position:absolute;
    top:17px;
    /* right:80px; */
    right:20%;
  }
  header input[type="text"]{
    top:8px;
    font-size:15px;
    color:#000;
  }
</style>