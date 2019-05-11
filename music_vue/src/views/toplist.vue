<template>
  <div class="bg-white">
    <header>
      <router-link class="mui-icon mui-icon-back float-left text-white" to="index"></router-link>
      <span>排行榜</span>
    </header>
    <section>
      <ul class="list-unstyled text-left p-2">
        <h4 class="font-weight-bold">新声榜</h4>
        <li>
          <a href="javascript:;" class="d-flex">
            <img src="http://127.0.0.1:3001/imgs/toplist1.jpg">
            <ul class="list-unstyled mt-3 ml-3">
              <li v-for="(item,i) of newList" :key="i" class="text-dark font-style">{{i+1}}-{{item.title}}-{{item.author}}</li>
            </ul>
          </a>
        </li>
      </ul>
      <ul class="list-unstyled text-left p-2">
        <h4 class="font-weight-bold">官方榜</h4>
        <li class="pb-2">
          <a href="javascript:;" class="d-flex">
            <img src="http://127.0.0.1:3001/imgs/toplist2.jpg">
            <ul class="list-unstyled mt-3 ml-3">
              <li v-for="(item,i) of list1" :key="i" class="text-dark font-style">{{i+1}}-{{item.title}}-{{item.author}}</li>
            </ul>
          </a>
        </li>
        <li class="pb-2">
          <a href="javascript:;" class="d-flex">
            <img src="http://127.0.0.1:3001/imgs/toplist3.jpg">
            <ul class="list-unstyled mt-3 ml-3">
              <li v-for="(item,i) of list2" :key="i" class="text-dark font-style">{{i+1}}-{{item.title}}-{{item.author}}</li>
            </ul>
          </a>
        </li>
        <li class="pb-2">
          <a href="javascript:;" class="d-flex">
            <img src="http://127.0.0.1:3001/imgs/toplist4.jpg">
            <ul class="list-unstyled mt-3 ml-3">
              <li v-for="(item,i) of list3" :key="i" class="text-dark font-style">{{i+1}}-{{item.title}}-{{item.author}}</li>
            </ul>
          </a>
        </li>
        <li class="pb-2">
          <a href="javascript:;" class="d-flex">
            <img src="http://127.0.0.1:3001/imgs/toplist5.jpg">
            <ul class="list-unstyled mt-3 ml-3">
              <li v-for="(item,i) of list4" :key="i" class="text-dark font-style">{{i+1}}-{{item.title}}-{{item.author}}</li>
            </ul>
          </a>
        </li>
      </ul>
    </section>
    <div class="list">
      <h4 class="font-weight-bold text-left p-2">推荐榜</h4>
      <ul class="list-unstyled text-left d-flex justify-content-around">
        <li>
          <img src="http://127.0.0.1:3001/imgs/toplist6.jpg">
          <p>江小白YOLO云音乐说唱榜</p>
        </li>
        <li>
          <img src="http://127.0.0.1:3001/imgs/toplist7.jpg">
          <p>云音乐电音榜</p>
        </li>
        <li>
          <img src="http://127.0.0.1:3001/imgs/toplist8.jpg">
          <p>云音乐古典音乐榜</p>
        </li>
        <li>
          <img src="http://127.0.0.1:3001/imgs/toplist9.jpg">
          <p>抖音排行榜</p>
        </li>
        <li>
          <img src="http://127.0.0.1:3001/imgs/toplist10.jpg">
          <p>云音乐ACG音乐榜</p>
        </li>
        <li>
          <img src="http://127.0.0.1:3001/imgs/toplist11.jpg">
          <p>韩语榜</p>
        </li>
      </ul>
      <h4 class="font-weight-bold text-left p-2">全球榜</h4>
      <ul class="list-unstyled text-left d-flex justify-content-around">
        <li>
          <img src="http://127.0.0.1:3001/imgs/toplist12.jpg">
          <p>美国Billboard周榜</p>
        </li>
        <li>
          <img src="http://127.0.0.1:3001/imgs/toplist13.jpg">
          <p>UK排行榜周榜</p>
        </li>
        <li>
          <img src="http://127.0.0.1:3001/imgs/toplist14.jpg">
          <p>Beatport全球电子舞曲榜</p>
        </li>
        <li>
          <img src="http://127.0.0.1:3001/imgs/toplist15.jpg">
          <p>日本Oricon周榜</p>
        </li>
        <li>
          <img src="http://127.0.0.1:3001/imgs/toplist16.jpg">
          <p>iTunes榜</p>
        </li>
        <li>
          <img src="http://127.0.0.1:3001/imgs/toplist17.jpg">
          <p>英国Q杂志中文版周榜</p>
        </li>
      </ul>
      <h4 class="font-weight-bold text-left p-2">更多榜单</h4>
      <ul class="list-unstyled text-left d-flex justify-content-around">
        <li>
          <img src="http://127.0.0.1:3001/imgs/toplist18.jpg">
          <p>香港电台中文歌曲龙虎榜</p>
        </li>
        <li>
          <img src="http://127.0.0.1:3001/imgs/toplist19.jpg">
          <p>台湾Hito排行榜</p>
        </li>
        <li>
          <img src="http://127.0.0.1:3001/imgs/toplist20.jpg">
          <p>Hit FM Top榜</p>
        </li>
        <li>
          <img src="http://127.0.0.1:3001/imgs/toplist21.jpg">
          <p>KTV唛榜</p>
        </li>
        <li>
          <img src="http://127.0.0.1:3001/imgs/toplist22.jpg">
          <p>法国 NRJ Vos Hits 周榜</p>
        </li>
        <li>
          <img src="http://127.0.0.1:3001/imgs/toplist23.jpg">
          <p>电竞音乐榜</p>
        </li>
        <li>
          <img src="http://127.0.0.1:3001/imgs/toplist24.jpg">
          <p>云音乐国电榜</p>
        </li>
        <li>
          <img src="http://127.0.0.1:3001/imgs/toplist24.jpg">
          <p>云音乐国电榜</p>
        </li>
        <li>
          <img src="http://127.0.0.1:3001/imgs/toplist24.jpg">
          <p>云音乐国电榜</p>
        </li>
      </ul>
    </div>
    <footer></footer>
  </div>
</template>
<script>
export default {
  data(){
    return{
      // 新声榜
      newList:[],
      // 飙升榜
      list1:[],
      list2:[],
      list3:[],
      list4:[],
    }
  },
  created() {
    this.new();
    this.new1();
  },
  methods: {
    new(){
      this.axios.get("http://127.0.0.1:3001/newlist").then(res=>{
        this.newList=res.data.data.splice(0,3);
      })
    },
    new1(){
      this.axios.get("http://127.0.0.1:3001/daylist").then(res=>{
        this.list1=res.data.data.splice(0,3);
        this.list2=res.data.data.splice(4,3);
        this.list3=res.data.data.splice(7,3);
        this.list4=res.data.data.splice(10,3);
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
  a{text-decoration:none;}
  .font-style{
    font-size:14px;
  }
  section img{
    width:120px;
    height:120px;
    border-radius:5px;
  }
  section ul>li{
    width:350px;
    overflow: hidden;  /*溢出隐藏*/
    text-overflow:ellipsis; /*以省略号...显示*/
    white-space:nowrap;  /*强制不换行*/ 
  }
  .list img{
    width:120px;
    height:120px;
    border-radius:5px;
  }
  .list ul{
    flex-wrap:wrap;
  }
  .list ul>li p{
    width:120px;
    flex-wrap:wrap;
  }
  footer{
    background-color:#C20C0C;
    height:40px;
  }
</style>