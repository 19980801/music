<template>
  <div>
    <div class="top">
      <router-link class="mui-icon mui-icon-back float-left text-white" to="index"></router-link>
      <span>歌单广场</span>
    </div>
    <header>
      <nav id="nav" class="swiper-container p-0">
        <ul class="swiper-wrapper list-unstyled">
          <li class="swiper-slide active-nav"><a href="javascript:;">推荐</a></li>
          <li class="swiper-slide"><a href="javascript:;">精品</a></li>
          <li class="swiper-slide"><a href="javascript:;">华语</a></li>
          <li class="swiper-slide"><a href="javascript:;">民谣</a></li>
          <li class="swiper-slide"><a href="javascript:;">摇滚</a></li>
          <li class="swiper-slide"><a href="javascript:;">电子</a></li>
          <li class="swiper-slide"><a href="javascript:;">流行</a></li>
        </ul>
      </nav>
    </header>
    <div id="page" class="swiper-container">
      <div class="swiper-wrapper">
        <div class="swiper-slide slidepage navlist">
          <div class="contentTop mt-3">
            <div class="swiper-wrapper d-flex">
              <div class="swiper-slide" v-for="item of list1" :key="item.i">
                <a :href="item.a_href">
                  <img :src="item.img_url">
                  <h5>儿时睁眼数星星入眠 成年后闭眼数心事入眠</h5>
                </a>
              </div>
            </div>
          </div>
          <section class="mt-3">
            <ul class="list-unstyled d-flex justify-content-around">
              <li v-for="item of list2" :key="item.i">
                <img :src="item.img_url" class="listImg">
                <p class="listMsg">{{item.msg}}</p>
              </li>
            </ul>
          </section>
        </div>
        <div class="swiper-slide slidepage navlist">
          <section class="mt-3">
            <ul class="list-unstyled d-flex justify-content-around">
              <li v-for="item of list3" :key="item.i">
                <img :src="item.img_url" class="listImg">
                <p class="listMsg">{{item.msg}}</p>
              </li>
            </ul>
            <mt-button size="large" type="danger" @click="navlist3">加载更多</mt-button>
          </section>
        </div>
        <div class="swiper-slide slidepage navlist">
          <section class="mt-3">
            <ul class="list-unstyled d-flex justify-content-around">
              <li v-for="item of list4" :key="item.i">
                <img :src="item.img_url" class="listImg">
                <p class="listMsg">{{item.msg}}</p>
              </li>
            </ul>
          </section>
        </div>
        <div class="swiper-slide slidepage navlist">
          <section class="mt-3">
            <ul class="list-unstyled d-flex justify-content-around">
              <li v-for="item of list5" :key="item.i">
                <img :src="item.img_url" class="listImg">
                <p class="listMsg">{{item.msg}}</p>
              </li>
            </ul>
          </section>
        </div>
        <div class="swiper-slide slidepage navlist">
          <section class="mt-3">
            <ul class="list-unstyled d-flex justify-content-around">
              <li v-for="item of list6" :key="item.i">
                <img :src="item.img_url" class="listImg">
                <p class="listMsg">{{item.msg}}</p>
              </li>
            </ul>
          </section>
        </div>
        <div class="swiper-slide slidepage navlist">
          <section class="mt-3">
            <ul class="list-unstyled d-flex justify-content-around">
              <li v-for="item of list7" :key="item.i">
                <img :src="item.img_url" class="listImg">
                <p class="listMsg">{{item.msg}}</p>
              </li>
            </ul>
          </section>
        </div>
        <div class="swiper-slide slidepage navlist">
          <section class="mt-3">
            <ul class="list-unstyled d-flex justify-content-around">
              <li v-for="item of list8" :key="item.i">
                <img :src="item.img_url" class="listImg">
                <p class="listMsg">{{item.msg}}</p>
              </li>
            </ul>
          </section>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data(){
    return{
      // 推荐
      list1:[
        {img_url:"http://127.0.0.1:3001/imgs/banner1.jpg",a_href:"javascript:;",title:"儿时睁眼数星星入眠 成年后闭眼数心事入眠"},
        {img_url:"http://127.0.0.1:3001/imgs/banner2.jpg",a_href:"javascript:;",title:"听完这些歌，我们就都放下吧"},
        {img_url:"http://127.0.0.1:3001/imgs/banner3.jpg",a_href:"javascript:;",title:"KTV女生必点歌曲【惊艳】"},
        {img_url:"http://127.0.0.1:3001/imgs/banner4.jpg",a_href:"javascript:;",title:"红色高跟鞋"},
        {img_url:"http://127.0.0.1:3001/imgs/banner5.jpg",a_href:"javascript:;",title:"初夏小调丨空气中弥漫的香草气息"},
        {img_url:"http://127.0.0.1:3001/imgs/banner6.jpg",a_href:"javascript:;",title:"『网易云热歌』评论20w+（持续更新）"},
        {img_url:"http://127.0.0.1:3001/imgs/banner7.jpg",a_href:"javascript:;",title:"今天也想见到你 明天也是"},
        {img_url:"http://127.0.0.1:3001/imgs/banner8.jpg",a_href:"javascript:;",title:"2019年四月最热新歌TOP50"},
      ],
      list2:[],
      //精品分页
      list3:[],
      pno:1,
      pageSize:9,
      hasMore:true,
      //华语
      list4:[],
      // 民谣
      list5:[],
      // 摇滚
      list6:[],
      //电子
      list7:[],
      // 流行
      list8:[],
    }
  },
  created() {
    this.navlist1();
    this.navlist2();
    this.navlist3();
    this.navlist4();
    this.navlist5();
    this.navlist6();
    this.navlist7();
    this.navlist8();
  },
  mounted() {
    var myNav = new Swiper('#nav', {
      spaceBetween:10,
      slidesPerView:5,
      watchSlidesProgress:true,
      watchSlidesVisibility:true,
      on:{
        tap: function(){
          myPage.slideTo( myNav.clickedIndex)
        }
      }
  })
  var myPage = new Swiper('#page',{
    on:{
    slideChangeTransitionStart:function(){
      updateNavPosition()
    }}
  })
  function updateNavPosition(){
    $('#nav .active-nav').removeClass('active-nav');
    var activeNav = $('#nav .swiper-slide').eq(myPage.activeIndex).addClass('active-nav');
    if (!activeNav.hasClass('swiper-slide-visible')){
      if (activeNav.index()>myNav.activeIndex) {
        var thumbsPerNav = Math.floor(myNav.width/activeNav.width())-1
        myNav.slideTo(activeNav.index()-thumbsPerNav)
      }
      else {
        myNav.slideTo(activeNav.index())
        }   
      }
    }
    // top
    var mySwiper = new Swiper('.contentTop', {
      loop : true,
      centeredSlides: true,
      slidesPerView: "auto",
      initialSlide:1,
    })
  },
  methods: {
    navlist1(){
      this.axios.get("http://127.0.0.1:3001/banner").then(res=>{
        this.list1=res.data.data;
      })
    },
    navlist2(){
      this.axios.get("http://127.0.0.1:3001/list1").then(res=>{
        this.list2=res.data.data;
      })
    },
    navlist3(){
      if(this.hasMore==false){
        this.$toast("没有更多数据了");
        return;
      } 
      this.pno++;
      this.axios.get("http://127.0.0.1:3001/listall",{
        params:{
          pno:this.pno,
        },
      }).then(result=>{
        this.list3=this.list3.concat(result.data.data);
        if(this.pno>=result.data.pageCount){
          this.hasMore=false;
        }
      })
    },
    navlist4(){
      this.axios.get("http://127.0.0.1:3001/list2").then(res=>{
        this.list4=res.data.data;
      })
    },
    navlist5(){
      this.axios.get("http://127.0.0.1:3001/list5").then(res=>{
        this.list5=res.data.data;
      })
    },
    navlist6(){
      this.axios.get("http://127.0.0.1:3001/list4").then(res=>{
        this.list6=res.data.data;
      })
    },
    navlist7(){
      this.axios.get("http://127.0.0.1:3001/list6").then(res=>{
        this.list7=res.data.data;
      })
    },
    navlist8(){
      this.axios.get("http://127.0.0.1:3001/list3").then(res=>{
        this.list8=res.data.data;
      })
    }
  },
}
</script>
<style scoped>
  .top{
    background-color:#C20C0C;
    color:#fff;
    padding:10px;
  }
  header #nav{
    background-color:#fff;
    height:40px;
    line-height:40px;
  }
  #nav .active-nav{
    border-bottom:2px solid #C20C0C;
  }
  #page .slidepage{overflow: hidden;}
  .contentTop .swiper-slide img{
    width:100%;
    height:150px;      
  }
  .contentTop .swiper-slide a h5{
    color:black;
    background-color:#fff;
    margin:0;
    padding:8px 0;
    overflow: hidden;  
    text-overflow:ellipsis; 
    white-space:nowrap;  
  }
  .contentTop .swiper-container{
    width:100%;
  }
  .contentTop .swiper-slide{
    width:80%;
    transform: scale(0.9);
  }
  .contentTop .swiper-slide-active{
    -webkit-transform: scale(1);
    -moz-transform: scale(1);
    -ms-transform: scale(1);
    -o-transform: scale(1);
    transform: scale(1);
  }
  #page .navlist section ul{
    flex-wrap:wrap;
  }
  #page .navlist section .listImg{
    width:130px;
    height:130px;
    border-radius:5px;
  }
  #page .navlist section .listMsg{
    width:130px;
    overflow: hidden;  
    text-overflow:ellipsis; 
    white-space:nowrap;  
  }
</style>