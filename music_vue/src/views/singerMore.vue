<template>
  <div>
    <header>
      <router-link to="singer" class="mui-icon mui-icon-back text-white float-left"></router-link>
      <span>歌手列表</span>
    </header>
    <section>
      <ul class="list-unstyled d-flex justify-content-around">
        <li v-for="item of list" :key="item.i">
          <img :src="item.img_url">
          <p class="text-center">{{item.author}}</p>
        </li>
      </ul>
    </section>
  </div>
</template>
<script>
export default {
  data(){
    return{
      list:[],
    }
  },
  created() {
    this.axios.get("http://127.0.0.1:3001/singerlist").then(res=>{
      this.list=res.data.data;
    })
  },
}
</script>
<style scoped>
  header{
    background-color:#C20C0C;
    color:#fff;
    padding:10px;
  }
  section ul{
    flex-wrap:wrap;
  }
  section ul>li{
    margin:5px 0;
  }
</style>