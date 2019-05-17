<template>
  <div>
    <my-search></my-search>
    <section class="bg-white">
      <ul class="list-unstyled" v-if="ishave">
        <li class="text-left" v-for="item in list" :key="item.i">
          <a :href="item.a_href" class="d-flex">
            <img :src="item.img_url">
            <div class="text-dark mt-4">
              <h4>{{item.msg}}</h4>
            </div>
          </a>
        </li>
      </ul>
      <div v-else class="pb-5">
        <img src="http://127.0.0.1:3001/imgs/404.jpg" class="mt-4">
        <h4 class="font-weight-bold d-flex justify-content-center">抱歉，没有找到关于
          <h3>{{this.key}}</h3>
        的相关内容</h4>
        <h4 class="font-weight-bold">请在搜搜看</h4>
      </div>
    </section>
  </div>
</template>
<script>
import mySearch from "@/components/search.vue";
export default {
  data(){
    return{
      key:"",
      list:[],
      ishave:true
    }
  },
  created() {
    this.key=this.$route.params.key;
  },
  methods: {
    search(){
      if(this.key){
        this.axios.get("http://127.0.0.1:3001/search?family="+this.key).then(res=>{
          if(res.data.code==1){
            this.list=res.data.data;
          }else{
            this.ishave=false;  
          }
        }) 
      }
    }
  },
  watch: {
    key(){
      this.search();
    }
  },
  components:{
    mySearch
  }
}
</script>
<style scoped>
  section ul>li img{
    width:120px;
    height:120px;
    border-radius:5px;
    margin:10px;
  }
  section div>img{
    width:200px;
  }
  div h3{
    margin-top:-5px;
    color:#C20C0C;
    font-weight:bolder;
  }
</style>