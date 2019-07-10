<template>
  <div>
    <!-- 插槽 -->
    <my-header>
      <div slot="title">广告管理</div>
    </my-header>
    <header class="text-left justify-content-between d-flex">
      <router-link to="index" class="mui-icon mui-icon-back p-2 text-white"></router-link>
      <span class="mt-2">电台</span>
      <span class="iconfont icon-zhengzaibofang p-2"></span>
    </header>
		<div class="banner">
			<mt-swipe :auto="8000">
				<mt-swipe-item v-for="item of bannerList" :key="item.i">
					<a :href="item.a_href"><img :src="item.img_url"></a>
				</mt-swipe-item>
			</mt-swipe>
		</div>
    <section class="box">
      <div class="content">
        <div class="left" ref="left">
          <ul>
            <li v-for="(item, index) in right" :key="index" @click="selectItem(index, $event)">
              <span class="left-item">{{item.name}}</span>
            </li>
          </ul>
        </div>
        <div class="right" ref="right">
          <ul>
            <li class="right-item right-item-hook" v-for="item in right" :key="item.i">
              <h4 class="font-weight-bold text-left p-2">{{item.name}}</h4>
              <ul class="d-flex">
                <li v-for="num in item.content1" :key="num.i" class="list">
                  <a :href="item.a_href">
                    <div class="top">
                      <img :src="num.img_url">  
                      <span>{{num.author}}</span>
                    </div>
                    <p>{{num.title}}</p>
                  </a>
                </li>
                <li v-for="num in item.content2" :key="num.i" class="list">
                  <a :href="item.a_href">
                    <div class="top">
                      <img :src="num.img_url">  
                      <span>{{num.author}}</span>
                    </div>
                    <p>{{num.title}}</p>
                  </a>
                </li>
                <li v-for="num in item.content3" :key="num.i" class="list">
                  <a :href="item.a_href">
                    <div class="top">
                      <img :src="num.img_url">  
                      <span>{{num.author}}</span>
                    </div>
                    <p>{{num.title}}</p>
                  </a>
                <li v-for="num in item.content4" :key="num.i" class="list">
                  <a :href="item.a_href">
                    <div class="top">
                      <img :src="num.img_url">  
                      <span>{{num.author}}</span>
                    </div>
                    <p>{{num.title}}</p>
                  </a>
                </li>
                <li v-for="num in item.content5" :key="num.i" class="list">
                  <a :href="item.a_href">
                    <div class="top">
                      <img :src="num.img_url">  
                      <span>{{num.author}}</span>
                    </div>
                    <p>{{num.title}}</p>
                  </a>
                </li> 
                <li v-for="num in item.content6" :key="num.i" class="list">
                  <a :href="item.a_href">
                    <div class="top">
                      <img :src="num.img_url">  
                      <span>{{num.author}}</span>
                    </div>
                    <p>{{num.title}}</p>
                  </a>
                </li> 
                <li v-for="num in item.content7" :key="num.i" class="list">
                  <a :href="item.a_href">
                    <div class="top">
                      <img :src="num.img_url">  
                      <span>{{num.author}}</span>
                    </div>
                    <p>{{num.title}}</p>
                  </a>
                </li> 
                <li v-for="num in item.content8" :key="num.i" class="list">
                  <a :href="item.a_href">
                    <div class="top">
                      <img :src="num.img_url">  
                      <span>{{num.author}}</span>
                    </div>
                    <p>{{num.title}}</p>
                  </a>
                </li> 
                <li v-for="num in item.content9" :key="num.i" class="list">
                  <a :href="item.a_href">
                    <div class="top">
                      <img :src="num.img_url">  
                      <span>{{num.author}}</span>
                    </div>
                    <p>{{num.title}}</p>
                  </a>
                </li> 
                <li v-for="num in item.content10" :key="num.i" class="list">
                  <a :href="item.a_href">
                    <div class="top">
                      <img :src="num.img_url">  
                      <span>{{num.author}}</span>
                    </div>
                    <p>{{num.title}}</p>
                  </a>
                </li> 
              </ul>
            </li>
          </ul>
        </div>
      </div>
    </section>
  </div>
</template>

<script>
import BScroll from 'better-scroll'
import myHeader from '@/components/header.vue'
export default {
  data () {
    return {
      bannerList:[],
      right: [
        {name:'精品推荐',content1: []},
        {name:'创作|翻唱',content2: []},
        {name:'3D|电子',content3: []},
        {name:'情感调频',content4: []},
        {name:'音乐故事',content5: []},
        {name:'二次元',content6: []},
        {name:'美文读物',content7: []},
        {name:'知识技能',content8: []},
        {name:'商业财经',content9: []},
        {name:'脱口秀',content10: []},
      ],
      listHeight: [],
      scrollY: 0, //实时获取当前y轴的高度
      clickEvent: false
    }
  },
  created() {
    this.banner();
    this.list1();
    this.list2();
    this.list3();
    this.list4();
    this.list5();
    this.list6();
    this.list7();
    this.list8();
    this.list9();
    this.list10();
  },
  methods: {
   banner(){
     this.axios.get("http://127.0.0.1:3001/banner").then(res=>{
       this.bannerList=res.data.data;
     })
   },
    list1(){
     this.axios.get("http://127.0.0.1:3001/radio1").then(res=>{
       this.right[0].content1=res.data.data;
     })
   },
   list2(){
     this.axios.get("http://127.0.0.1:3001/radio2").then(res=>{
       this.right[1].content2=res.data.data;
     })
   },
   list3(){
     this.axios.get("http://127.0.0.1:3001/radio3").then(res=>{
       this.right[2].content3=res.data.data;
     })
   }, 
   list4(){
     this.axios.get("http://127.0.0.1:3001/radio4").then(res=>{
       this.right[3].content4=res.data.data;
     })
   },
   list5(){
     this.axios.get("http://127.0.0.1:3001/radio5").then(res=>{
       this.right[4].content5=res.data.data;
     })
   },
   list6(){
     this.axios.get("http://127.0.0.1:3001/radio6").then(res=>{
       this.right[5].content6=res.data.data;
     })
   },
   list7(){
     this.axios.get("http://127.0.0.1:3001/radio7").then(res=>{
       this.right[6].content7=res.data.data;
     })
   },
   list8(){
     this.axios.get("http://127.0.0.1:3001/radio8").then(res=>{
       this.right[7].content8=res.data.data;
     })
   },
   list9(){
     this.axios.get("http://127.0.0.1:3001/radio9").then(res=>{
       this.right[8].content9=res.data.data;
     })
   },
   list10(){
     this.axios.get("http://127.0.0.1:3001/radio10").then(res=>{
       this.right[9].content10=res.data.data;
     })
   },
    _initScroll () {
      //better-scroll的实现原理是监听了touchStart,touchend事件，所以阻止了默认的事件（preventDefault）
      //所以在这里做点击的话，需要在初始化的时候传递属性click,派发一个点击事件
      //在pc网页浏览模式下，点击事件是不会阻止的，所以可能会出现2次事件，所以为了避免2次，可以在绑定事件的时候把$event传递过去
      this.lefts = new BScroll(this.$refs.left, {
        click: true
      })
      this.rights = new BScroll(this.$refs.right, {
        probeType: 3  //探针的效果，实时获取滚动高度
      })
      //rights这个对象监听事件，实时获取位置pos.y
      this.rights.on('scroll', (pos) => {
        this.scrollY = Math.abs(Math.round(pos.y))
      })
    },
    _getHeight () {
      let rightItems = this.$refs.right.getElementsByClassName('right-item-hook')
      let height = 0
      this.listHeight.push(height)
      for(let i = 0; i < rightItems.length; i++){
        let item = rightItems[i]
        height += item.clientHeight
        this.listHeight.push(height)
      }
    },
    selectItem(index,event){
      this.clickEvent = true
      //在better-scroll的派发事件的event和普通浏览器的点击事件event有个属性区别_constructed
      //浏览器原生点击事件没有_constructed所以当时浏览器监听到该属性的时候return掉
      if(!event._constructed){
        return
      }else{
        let rightItems = this.$refs.right.getElementsByClassName('right-item-hook')
        let el = rightItems[index]
        this.rights.scrollToElement(el,500)
      }
    }
  },
  mounted () {
    this.$nextTick(() => {
      this._initScroll()
      this._getHeight()
    })
  },
  // computed: {
  //   currentIndex () {
  //     for(let i = 0; i < this.listHeight.length; i ++){
  //       let height = this.listHeight[i]
  //       let height2 = this.listHeight[i + 1]
  //       //当height2不存在的时候，或者落在height和height2之间的时候，直接返回当前索引
  //       //>=height，是因为一开始this.scrollY=0,height=0
  //       if(!height2 || (this.scrollY >= height && this.scrollY < height2)){
  //         return i
  //       }
  //       if(this.listHeight[this.listHeight.length - 1] - this.$refs.right.clientHeight <= this.scrollY){
  //         if(this.clickTrue){
  //           return this.currentNum
  //         }else{
  //           return (this.listHeight.length - 1)
  //         }
  //       }
  //     }
  //     //如果this.listHeight没有的话，就返回0
  //     return 0
  //   }
  // }
  components:{
    myHeader
  }
}
</script>

<style scoped>
  a{text-decoration:none;}
  header{
    color:#fff;
    background-color:#C20C0C;
  }
  .banner{
    height:200px;
    width:100%;
  }
  .banner img{
    width:95%;
    height:180px;
    margin:10px;
    border-radius:10px;
  }
  ul{
    list-style:none;
    padding:0;
  }
  .content{
    display:flex;
    position:absolute;
    top:240px;
    bottom:1px;
    width:100%;
    overflow:hidden;
    background: #eee;
  }
  .left{
    flex: 0 0 100px;
    background-color: #f3f5f7;
  }
  .left li{
    width:100%;
  }
  .current{
    background-color:#C20C0C;
  }
  .left-item{
    display: block;
    width:100%;
    line-height: 50px;
    text-align: center;
    border-bottom:1px solid #ddd;
  }
  .right-item img{
    width:140px;
    height:140px;
    border-radius:5px;
  }
  .right-item ul{
    flex-wrap:wrap;
    justify-content:space-around;
  }
  .right-item li{
    height:100%;
    text-align:center;
  }
  .top{position:relative;}
  .top span{
    position:absolute;
    color:#fff;
    bottom:2px;
    left:2px;
    overflow: hidden;  
    text-overflow:ellipsis; 
    white-space:nowrap;  
  }
  .right-item p{
    width:140px;
    overflow: hidden;  
    text-overflow:ellipsis; 
    white-space:nowrap; 
  }
</style>