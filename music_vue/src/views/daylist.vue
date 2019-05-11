<template>
  <div>
    <header class="text-left justify-content-between d-flex">
      <router-link to="index" class="mui-icon mui-icon-back p-2 text-white"></router-link>
      <span class="iconfont icon-zhengzaibofang p-2"></span>
    </header>
    <section class="bg-white border">
      <nav class="d-flex justify-content-between">
        <span class="iconfont icon-bofang"><a href="javascript:;" class="ml-2 text-dark">全部播放</a></span>
        <span class="iconfont icon-guanli">多选</span>
      </nav>
      <ul class="list-unstyled mt-2">
        <li class="p-2" v-for="item of list" :key="item.i">
          <a :href="item.a_href">
						<img class="mui-media-object mui-pull-left mr-2" :src="item.img_url">
						<div class="mui-media-body text-left d-flex justify-content-between">
              <div class="msg mt-2">
                <h4 class="text-dark" v-text="item.title"></h4>
                <p class='msg m-0' v-text="item.author"></p>
              </div>
              <div class="mt-3 text-secondary btn">
                <span class="iconfont icon-bofang"></span>
                <span class="iconfont icon-gengduo" @click="menuShow"></span>
              </div>
						</div>
					</a>
        </li>
      </ul>
			<div class="btnMenu">
				<mt-popup v-model="popupVisible" position="bottom" pop-transition="popup-fade" class="menu">
          <div class="top">
            <p>下载后仍可以在音乐包有限期内离线播放</p>
          </div>
          <ul class="list-unstyled">
            <li>
              <span class="iconfont icon-bofang"></span>
              <span>下一首播放</span>
            </li>
            <li>
              <span class="iconfont icon-tianjia"></span>
              <span>收藏到歌单</span>
            </li>
            <li>
              <span class="iconfont icon-ic_download"></span>
              <span>下载</span>
            </li>
            <li>
              <span class="iconfont icon-pinglun"></span>
              <span>评论</span>
            </li>
            <li>
              <span class="iconfont icon-fenxiang"></span>
              <span>分享</span>
            </li>
            <li>
              <span class="iconfont icon-geshou"></span>
              <span>歌手</span>
            </li>
            <li>
              <span class="iconfont icon-zhuanji"></span>
              <span>专辑</span>
            </li>
            <li>
              <span class="iconfont icon-shipin"></span>
              <span>查看视频</span>
            </li>
            <li>
              <span class="iconfont icon-guanbi"></span>
              <span>不感兴趣</span>
            </li>
          </ul>
				</mt-popup>
			</div>
    </section>
    <footer></footer>
  </div>
</template>
<script>
export default {
  data(){
    return{
      list:[],
      popupVisible:false,
    }
  },
  created() {
    this.daylist();
  },
  methods: {
    daylist(){
      this.axios.get("http://127.0.0.1:3001/daylist").then(res=>{
        this.list=res.data.data;
      })
    },
    menuShow(){
      this.popupVisible=true;
    }
  },
}
</script>
<style scoped>
  a{text-decoration:none;}
  header{
    width:100%;
    height:220px;
    color:#fff;
    background:url("http://127.0.0.1:3001/imgs/f2-2.png") no-repeat top center;
    background-size:100% 220px;
  }
  section{
    margin-top:-30px;
    border-radius:20px 20px 0 0;
  }
  section nav{
    height:40px;
    line-height:40px;
  }
  section nav span{
    margin:0 10px;
    font-size:18px;
    font-weight:bolder;
    color:#000;
  }
  section ul>li img{
    width:70px;
    height:70px;
    border-radius:5px;
  }
  section .msg{
    width:180px;
    overflow: hidden;  /*溢出隐藏*/
    text-overflow:ellipsis; /*以省略号...显示*/
    white-space:nowrap;  /*强制不换行*/
  }
  section .btn span{
    font-size:24px;
    padding:0 8px;
  }
  section .btnMenu .menu{
    width:100%;
    border-radius:20px 20px 0 0;
  }
  .btnMenu .top{
    height:30px;
    border-bottom:1px solid #ddd;
  }
  section .btnMenu ul>li{
    color:black;
    text-align:left;
    height:40px;
    line-height:40px;
    border-bottom:1px solid #ddd;
  }
  .btnMenu ul>li .iconfont{
    font-size:20px;
    padding:0 5px;
    font-weight:bold;
  }
  footer{
    height:40px;
    background-color:#C20C0C;
  }
</style>