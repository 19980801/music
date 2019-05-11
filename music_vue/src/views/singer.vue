<template>
  <div>
    <header>
      <router-link to="index" class="mui-icon mui-icon-back text-white float-left"></router-link>
      <span>歌手列表</span>
    </header>
    <section class="bg-white pt-2 text-left border">
      <div class="title p-2 d-flex justify-content-between">
        <h4 class="m-0 font-weight-bold">入驻歌手</h4>
        <router-link to="singerMore" class="iconfont icon-gengduo1 font-weight-bold text-dark">更多</router-link>
      </div>
      <ul class="list-unstyled d-flex justify-content-around">
        <li v-for="item of list1" :key="item.i">
          <img :src="item.img_url">
          <p class="text-center">{{item.author}}</p>
        </li>
      </ul>
      <div class="title p-2">
        <h4 class="m-0 font-weight-bold">热门歌手</h4>
      </div>
      <ul class="list-unstyled d-flex justify-content-around">
        <li v-for="item of list2" :key="item.i">
          <img :src="item.img_url">
          <p class="text-center">{{item.author}}</p>
        </li>
      </ul>
    </section>
    <footer></footer>
  </div>
</template>
<script>
export default {
  data(){
    return{
      list1:[],
      list2:[],
    }
  },
  created() {
    this.singer();
    this.singerlist();
  },
  methods: {
    singer(){
      this.axios.get("http://127.0.0.1:3001/singer").then(res=>{
        this.list1=res.data.data;
      })
    },
    singerlist(){
      this.axios.get("http://127.0.0.1:3001/singer").then(res=>{
        this.list2=res.data.data.splice(0,9);
      })
    },
  },
}
</script>
<style scoped>
  header{
    background-color:#C20C0C;
    color:#fff;
    padding:10px;
  }
  .title{
    border-bottom:2px solid #C20C0C;
  }
  section ul{
    flex-wrap:wrap;
  }
  section ul>li{
    margin:5px 0;
  }
  footer{
   height:40px;
   background-color:#C20C0C; 
  }
</style>
