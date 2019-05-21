<template>
	<div class="app-index pb-5">
		<section>
			<div class="mui-content">
				<div id="tabbar" class="mui-control-content mui-active">
					<my-search></my-search>
					<div class="container p-0 pb-4">
						<div class="banner">
							<mt-swipe :auto="8000">
								<mt-swipe-item v-for="item of bannerList" :key="item.i">
									<a :href="item.a_href"><img :src="item.img_url"></a>
								</mt-swipe-item>
							</mt-swipe>
						</div>
						<div class="nav">
							<ul class="list-unstyled d-flex mt-3 justify-content-around">
								<li>
									<router-link to="daylist">
										<img src="http://127.0.0.1:3001/imgs/nav1.png">
									</router-link>
									<p>每日推荐</p>
								</li>
								<li>
									<router-link to="toplist">
										<img src="http://127.0.0.1:3001/imgs/nav2.png">
									</router-link>
									<p>排行榜单</p>
								</li>
								<li>
									<router-link to="singer">
										<img src="http://127.0.0.1:3001/imgs/nav3.png">
									</router-link>
									<p>歌手</p>
								</li>
								<li>
									<router-link to="radio">
										<img src="http://127.0.0.1:3001/imgs/nav4.png">
									</router-link>
									<p>电台</p>
								</li>
							</ul>
						</div>
						<div class="text-left mt-4">	
							<h5 class="font-weight-bold text-dark ml-2">推荐歌曲</h5>
							<ul class="f1-list list-unstyled d-flex justify-content-around">
								<li v-for="item of playList" :key="item.i">
									<a :href="item.a_href">
										<div class="top">
											<img :src="item.img_url">
											<div class="msg">
												<span class="iconfont icon-erji ml-2"></span>
												<span>{{item.point}}</span>
												<span class="iconfont icon-bofang ml-5"></span>
											</div>
										</div>
										<p class="text-center text-dark">{{item.msg}}</p>
									</a>
								</li>
							</ul>
						</div>
						<div class="text-left mt-2 f2 pb-4">
							<h5 class="text-dark font-weight-bold ml-2">云村精选</h5>
							<div class="mui-card" v-for="item of readList" :key="item.i">
								<div class="mui-card-header mui-card-media" style="height:35vw" :style="item.img_url"></div>
								<div class="mui-card-content">
									<div class="mui-card-content-inner">
										<p style="color:#333;">{{item.title}}</p>
									</div>
								</div>
								<div class="mui-card-footer">
									<a class="mui-card-link">
										<img src="http://127.0.0.1:3001/imgs/dianzan.png">
										<span>{{item.point}}</span>
									</a>
									<a class="mui-card-link">Read more</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div id="tabbar-with-music" class="mui-control-content">
					<header>
						<span class="mui-icon mui-icon-back float-left" @click="prev"></span>
						<span>我的音乐</span>
					</header>
					<ul class="mui-table-view mui-table-view-chevron">
						<li class="mui-table-view-cell">
							<a href="javascript:;" class="mui-navigate-right text-left">
								<span class="iconfont icon-yinyue"></span>
								<span class="ml-4">本地音乐</span>
							</a>
						</li>
						<li class="mui-table-view-cell">
							<a href="javascript:;" class="mui-navigate-right text-left">
								<span class="iconfont icon-weibiaoti--"></span>
								<span class="ml-4">最近播放</span>
							</a>
						</li>
						<li class="mui-table-view-cell">
							<a href="javascript:;" class="mui-navigate-right text-left">
								<span class="iconfont icon-xianxing_diantai"></span>
								<span class="ml-4">我的电台</span>
							</a>
						</li>
						<li class="mui-table-view-cell">
							<a href="javascript:;" class="mui-navigate-right text-left">
								<span class="iconfont icon-shoucang"></span>
								<span class="ml-4">我的收藏</span>
							</a>
						</li>
					</ul>
					<div class="bg-white border-top container mt-2 m-0">
						<ul class="list-unstyled ">
							<li class="p-2">
								<div class="d-flex">
									<div @click="toggle(1)" class="row">
										<span class="mui-icon mui-icon-arrowright"></span>
										<h4 class="text-dark font-weight-bold">我创建的歌单</h4>
									</div>
									<div class="right">
										<span class="mui-icon mui-icon-plusempty font-weight-bold" @click="closeOnClickModal"></span>
										<mt-popup v-model="popupVisible" position="bottom" pop-transition="popup-fade" class="create">
											<div class="d-flex justify-content-between mt-2">
												<span class="text-dark mt-1 ml-3" @click="closeOnClickModal">取消</span>
												<h4 class="text-dark font-weight-bold">新建歌单</h4>
												<span class="text-dark mt-1 mr-3" @click="createmusiclist">完成</span>
											</div>
											<form action="#" method="get" class="mt-3">
												<input type="text" class="w-75" placeholder="歌单标题" required v-model="title">
											</form>
										</mt-popup>
										<!-- <span class="iconfont icon-gengduo font-weight-bold"></span> -->
									</div>
								</div>
								<div v-show="show===1" class="list" v-if="isLogin">
									<ul class="list-unstyled">
										<li v-for="(item,i) of musicList" :key="i">
											<div class="mui-table-view-cell p-1" >
												<div class="mui-slider-right">
													<a class="mui-btn mui-btn-red text-white">删除</a>
												</div>
												<div class="mui-slider-handle">
													<div class="mui-media">
														<a href="javascript:;">
															<img class="mui-media-object mui-pull-left" src="http://127.0.0.1:3001/imgs/musiclist.jpg">
															<div class="mui-media-body text-left pt-1">
																<h4 class="text-dark">{{item.title}}</h4>
																<p class='mui-ellipsis'>已下载0首</p>
															</div>
														</a>
													</div>
												</div>
											</div>
										</li>
									</ul>
								</div>
							</li>
							<li class="p-2">
								<div class="d-flex">
									<div @click="toggle(2)" class="row">
										<span class="mui-icon mui-icon-arrowright"></span>
										<h4 class="text-dark font-weight-bold">我收藏的歌单</h4>
									</div>
									<!-- <div class="right">
										<span class="iconfont icon-gengduo font-weight-bold"></span>
									</div> -->
								</div>
								<div v-show="show===2" class="list" v-if="isLogin">
									<ul class="list-unstyled">
										<li v-for="(item,i) of likeList" :key="i">
											<div class="mui-table-view-cell p-1">
												<div class="mui-slider-right">
													<a class="mui-btn mui-btn-red text-white">删除</a>
												</div>
												<div class="mui-slider-handle">
													<div class="mui-media">
														<a href="javascript:;">
															<img class="mui-media-object mui-pull-left" src="http://127.0.0.1:3001/imgs/musiclist.jpg">
															<div class="mui-media-body text-left pt-1">
																<h4 class="text-dark">{{item.title}}</h4>
																<p class='mui-ellipsis'>已下载0首,by{{item.author}}</p>
															</div>
														</a>
													</div>
												</div>
											</div>
										</li>
									</ul>
								</div>
							</li>
						</ul>
					</div>
				</div>
				<div id="tabbar-with-contact" class="mui-control-content">
					<header>
						<span class="mui-icon mui-icon-back float-left" @click="prev"></span>
						<span>发现更多</span>
					</header>
					<section class="bg-white container p-0">
						<div class="f1 text-left">
							<nav class="d-flex justify-content-around">
								<span class="iconfont icon-tuijian mt-2"></span>
								<span class="text-dark font-weight-bold mt-2" @click="cur=0" :class="{active:cur==0}">热门推荐</span>
								<div class="menuList">
									<ul class="list-unstyled d-flex">
										<li @click="cur=1" :class="{active:cur==1}" class="pl-1"><a href="#" class="font-style text-dark">华语</a></li>
										<li @click="cur=2" :class="{active:cur==2}" class="pl-1"><a href="#" class="font-style text-dark">流行</a></li>
										<li @click="cur=3" :class="{active:cur==3}" class="pl-1"><a href="#" class="font-style text-dark">摇滚</a></li>
										<li @click="cur=4" :class="{active:cur==4}" class="pl-1"><a href="#" class="font-style text-dark">民谣</a></li>
										<li @click="cur=5" :class="{active:cur==5}" class="pl-1"><a href="#" class="font-style text-dark">电子</a></li>
									</ul>
								</div>
								<router-link class="mt-2 iconfont icon-gengduo1 text-dark" to="more">更多</router-link>
							</nav>
							<div class="menuContent">
								<div v-show="cur==0">
									<ul class="list-unstyled text-left d-flex justify-content-around mt-2">
										<li v-for="item of list1" :key="item.i" class="mt-2">
											<a :href="item.a_href">
												<div class="top">
													<img :src="item.img_url">
													<div class="msg">
														<span class="iconfont icon-erji ml-2"></span>
														<span>{{item.point}}万</span>
														<span class="iconfont icon-bofang ml-5"></span>
													</div>
												</div>
												<p class="text-center text-dark">{{item.msg}}</p>
											</a>
										</li>
									</ul>
								</div>
								<div v-show="cur==1">
									<ul class="list-unstyled text-left d-flex justify-content-around mt-2">
										<li v-for="item of list2" :key="item.i" class="mt-2">
											<a :href="item.a_href">
												<div class="top">
													<img :src="item.img_url">
													<div class="msg">
														<span class="iconfont icon-erji ml-2"></span>
														<span>{{item.point}}万</span>
														<span class="iconfont icon-bofang ml-5"></span>
													</div>
												</div>
												<p class="text-center text-dark">{{item.msg}}</p>
											</a>
										</li>
									</ul>
								</div>
								<div v-show="cur==2">
									<ul class="list-unstyled text-left d-flex justify-content-around mt-2">
										<li v-for="item of list3" :key="item.i" class="mt-2">
											<a :href="item.a_href">
												<div class="top">
													<img :src="item.img_url">
													<div class="msg">
														<span class="iconfont icon-erji ml-2"></span>
														<span>{{item.point}}万</span>
														<span class="iconfont icon-bofang ml-5"></span>
													</div>
												</div>
												<p class="text-center text-dark">{{item.msg}}</p>
											</a>
										</li>
									</ul>
								</div>
								<div v-show="cur==3">
									<ul class="list-unstyled text-left d-flex justify-content-around mt-2">
										<li v-for="item of list4" :key="item.i" class="mt-2">
											<a :href="item.a_href">
												<div class="top">
													<img :src="item.img_url">
													<div class="msg">
														<span class="iconfont icon-erji ml-2"></span>
														<span>{{item.point}}万</span>
														<span class="iconfont icon-bofang ml-5"></span>
													</div>
												</div>
												<p class="text-center text-dark">{{item.msg}}</p>
											</a>
										</li>
									</ul>
								</div>
								<div v-show="cur==4">
									<ul class="list-unstyled text-left d-flex justify-content-around mt-2">
										<li v-for="item of list5" :key="item.i" class="mt-2">
											<a :href="item.a_href">
												<div class="top">
													<img :src="item.img_url">
													<div class="msg">
														<span class="iconfont icon-erji ml-2"></span>
														<span>{{item.point}}万</span>
														<span class="iconfont icon-bofang ml-5"></span>
													</div>
												</div>
												<p class="text-center text-dark">{{item.msg}}</p>
											</a>
										</li>
									</ul>
								</div>
								<div v-show="cur==5">
									<ul class="list-unstyled text-left d-flex justify-content-around mt-2">
										<li v-for="item of list6" :key="item.i" class="mt-2">
											<a :href="item.a_href">
												<div class="top">
													<img :src="item.img_url">
													<div class="msg">
														<span class="iconfont icon-erji ml-2"></span>
														<span>{{item.point}}万</span>
														<span class="iconfont icon-bofang ml-5"></span>
													</div>
												</div>
												<p class="text-center text-dark">{{item.msg}}</p>
											</a>
										</li>
									</ul>
								</div>
							</div>
						</div>
						<div class="f2">
							<nav class="text-left">
								<span class="iconfont icon-tuijian mt-2 ml-2 mr-2"></span>
								<span class="text-dark font-weight-bold mt-2" @click="cur=0" :class="{active:cur==0}">个性推荐</span>
								<span class="iconfont icon-huanyipi float-right font-weight-bold" @click="navlist6">换一批</span>
							</nav>
							<div class="f2-content">
								<ul class="list-unstyled text-left d-flex justify-content-around">
									<li v-for="item of list7" :key="item.i" class="mt-2">
										<a :href="item.a_href">
											<div class="top">
												<img :src="item.img_url">
												<div class="msg">
													<span class="iconfont icon-erji ml-2"></span>
													<span>{{item.point}}万</span>
													<span class="iconfont icon-bofang ml-5"></span>
												</div>
											</div>
											<p class="text-center text-dark">{{item.msg}}</p>
										</a>
									</li>
								</ul>
							</div>
						</div>
						<div class="f2">
							<nav class="text-left">
								<span class="iconfont icon-tuijian mt-2 ml-2 mr-2"></span>
								<span class="text-dark font-weight-bold mt-2" @click="cur=0" :class="{active:cur==0}">新歌上架</span>			
							</nav>
							<section>
								<my-swiper></my-swiper>
							</section>
						</div>
					</section>
				</div>
				<div id="tabbar-with-my" class="mui-control-content">
					<header>
						<span class="mui-icon mui-icon-back float-left" @click="prev"></span>
						<span>账号</span>
					</header>
					<section class="bg-white pt-4">
						<div v-if="isLogin==false">
							<h4 class="text-dark">登录网易云音乐</h4>
							<h4 class="text-dark">手机电脑多端同步，尽享海量高品质音乐</h4>
							<router-link to="login" class="mui-btn mui-btn-danger text-white">登录</router-link>
						</div>
						<div v-else class="true">
							<img :src="img">
							<div  @click.stop="uploadHeadImg">
								<span class="mui-icon mui-icon-compose"></span>
								<input type="file" accept="image/*" class="hiddenInput">
							</div>
							<p class="text-dark">{{uname}}</p>
						</div>
					</section>
					<div class="mt-2 set">
						<ul class="list-unstyled bg-white mb-2">
							<li>
								<span class="iconfont icon-shezhi">设置</span>
								<span class="mui-icon mui-icon-arrowright"></span>
							</li>
							<li class="mui-table-view-cell">
					     	<span class="iconfont icon-yejianmoshi">夜间模式</span>
								<div class="mui-switch mui-switch-mini">
									<div class="mui-switch-handle"></div>
								</div>
							</li>
							<li>
								<span class="iconfont icon-dingshi_l">定时关闭</span>
								<span class="mui-icon mui-icon-arrowright"></span>	
							</li>
							<li>
								<span class="iconfont icon-naozhong">音乐闹钟</span>
								<span class="mui-icon mui-icon-arrowright"></span>
							</li>
						</ul>
						<ul class="bg-white list-unstyled mb-2 set">
							<li>
								<span class="iconfont icon-ico_zaixiankefu">在线听歌免流量</span>
								<span class="mui-icon mui-icon-arrowright"></span>
							</li>
							<li>
								<span class="iconfont icon-airudiantubiaohuizhi-zhuanqu_youxi">精品游戏推荐</span>
								<span class="mui-icon mui-icon-arrowright"></span>
							</li>
							<li>
								<span class="iconfont icon-youhuiquan-m">优惠券</span>
								<span class="mui-icon mui-icon-arrowright"></span>
							</li>
						</ul>
						<ul class="bg-white list-unstyled set">
							<li>
								<span class="iconfont icon-fenxiang">分享网易云音乐</span>
								<span class="mui-icon mui-icon-arrowright"></span>
							</li>
							<li>
								<span class="iconfont icon-guanyuwomen">关于我们</span>
								<span class="mui-icon mui-icon-arrowright"></span>
							</li>
						</ul>	
						<button type="button" class="mui-btn mui-btn-block" v-show="isLogin" @click="exit">退出登录</button>
					</div>
				</div>
			</div>
		</section>
		<footer>
			<nav class="mui-bar mui-bar-tab">
				<a class="mui-tab-item mui-active" href="#tabbar">
					<span class="mui-icon mui-icon-home"></span>
					<span class="mui-tab-label">首页</span>
				</a>
				<a class="mui-tab-item" href="#tabbar-with-music">
					<span class="mui-icon mui-icon-extra mui-icon-extra-custom"></span>
					<span class="mui-tab-label">我的</span>
				</a>
				<a class="mui-tab-item" href="#tabbar-with-contact">
					<span class="mui-icon mui-icon-eye"></span>
					<span class="mui-tab-label">发现</span>
				</a>
				<a class="mui-tab-item" href="#tabbar-with-my">
					<span class="mui-icon mui-icon-contact"></span>
					<span class="mui-tab-label">账号</span>
				</a>
			</nav>
		</footer>
	</div>
</template>
<script>
import mySearch from "@/components/search.vue";
import mySwiper from './swiper';
export default {
	data(){
		return{
			bannerList:[],
			playList:[],
			readList:[],
			popupVisible:false,
			// 歌单标题
			title:"",
			mid:"",
			// 创建歌单列表
			musicList:[],
			show:"",
			// 收藏歌单列表
			likeList:[],
			cur:0,
			// 歌单分类
			list1:[],
			list2:[],
			list3:[],
			list4:[],
			list5:[],
			list6:[],
			// 随机推荐
			list7:[],
			// 新歌列表
			newList:[],
			// 判断是否登录
			isLogin:false,
			img:"",
			uname:"",
			uid:""
		}
	},
	created() {
		this.login();
		this.banner();
		this.playlist();
		this.readlist();
		this.navlist();
		this.navlist1();
		this.navlist2();
		this.navlist3();
		this.navlist4();
		this.navlist5();
		this.navlist6();
		this.new();
	},	
	methods: {
		login(){
			if(sessionStorage.getItem("uname")){
				this.uname=sessionStorage.getItem("uname");
				this.img=sessionStorage.getItem("img_url");
				this.uid=sessionStorage.getItem("uid");
				this.isLogin=true;
				this.musiclist();
				this.likelist();
			}
		},
		exit(){
			sessionStorage.removeItem("uname");
			sessionStorage.removeItem("img_url");
			sessionStorage.removeItem("uid");
			this.isLogin=false;
			this.$toast("已退出");
		},
		banner(){
			this.axios.get("http://127.0.0.1:3001/banner").then(res=>{
				this.bannerList=res.data.data;
			})
		},
		playlist(){
			this.axios.get("http://127.0.0.1:3001/playlist").then(res=>{
				this.playList=res.data.data;
			})
		},
		readlist(){
			this.axios.get("http://127.0.0.1:3001/readlist").then(res=>{
				this.readList=res.data.data;
			})
		},
		prev(){
			this.$router.go(-1);
		},
		closeOnClickModal(){
			this.popupVisible=!this.popupVisible;
		},
		musiclistContentShow(){
			this.musiclistContent=!this.musiclistContent;
		},
		toggle(index){
			if(this.show==index){
				this.show=0;
			}else{
				this.show=index;
			}
		},
		//创建歌单
		createmusiclist(){
			var title=this.title;
			var uid=this.uid;
			this.axios.get("http://127.0.0.1:3001/createmuscilist",{
				params:{title,uid}
			}).then(result=>{
				if(result.data.code==1){
					this.$toast("创建成功!");
					this.closeOnClickModal();
					this.musiclist();
				}else{
					this.$toast(result.data.msg);
				}
			})
		},
		musiclist(){
			this.axios.get("http://127.0.0.1:3001/musiclist").then(res=>{
				this.musicList=res.data.data;
				console.log(this.musicList);
			})
		},
		likelist(){
			this.axios.get("http://127.0.0.1:3001/likelist").then(res=>{
				this.likeList=res.data.data;
			})
		},
		// 歌单分类
		navlist(){
			this.axios.get("http://127.0.0.1:3001/list1").then(res=>{
				this.list1=res.data.data;
			})
		},
		navlist1(){
			this.axios.get("http://127.0.0.1:3001/list2").then(res=>{
				this.list2=res.data.data;
			})
		},
		navlist2(){
			this.axios.get("http://127.0.0.1:3001/list3").then(res=>{
				this.list3=res.data.data;
			})
		},
		navlist3(){
			this.axios.get("http://127.0.0.1:3001/list4").then(res=>{
				this.list4=res.data.data;
			})
		},
		navlist4(){
			this.axios.get("http://127.0.0.1:3001/list5").then(res=>{
				this.list5=res.data.data;
			})
		},
		navlist5(){
			this.axios.get("http://127.0.0.1:3001/list6").then(res=>{
				this.list6=res.data.data;
			})
		},
		navlist6(){
			this.axios.get("http://127.0.0.1:3001/rand").then(res=>{
				this.list7=res.data.data;
			})
		},
		new(){
			this.axios.get("http://127.0.0.1:3001/newlist").then(res=>{
				this.newList=res.data.data;
			})
		},
		// 更改头像
		uploadHeadImg(){
			this.$el.querySelector('.hiddenInput').click()
		},
	
	},
	components:{
		mySearch,
		mySwiper
	}
}
</script>
<style>
	.app-index{
		width:100%;
	}
	.app-index .font-style{font-size:14px;}
	.app-index footer .mui-bar-tab .mui-tab-item.mui-active{
		color:#C20C0C;
	}
	.app-index a{
		color:#fff;
		text-decoration:none;
	}
	.app-index .banner .mint-swipe{
		height:200px;
		width:100%;
	}
	.app-index .banner .mint-swipe img{
		width:100%;
		height:200px;
	}
	.app-index #tabbar .nav{
		height:100px;
		width:100%;
		box-shadow:2px 2px 2px 2px #ddd;
	}
	.app-index #tabbar .nav ul>li>a{
		display:inline-block;
		width:50px;
		height:50px;
		background-color:#C20C0C;
		border-radius:50%;
		line-height:46px;
	}

	.app-index #tabbar .nav ul{
		width:100%;
	}
	.app-index #tabbar .f1-list{
		display:flex;
		flex-wrap:wrap;
		justify-content:space-between;
	}
	.app-index #tabbar .f1-list>li{
		margin:3px 3px;
	}
	.app-index #tabbar .f1-list img{
		border-radius:5px;
		width:130px;
	}
	.app-index #tabbar .f1-list .top{
		position: relative;
	}
	.app-index #tabbar .f1-list>li .msg{
		position:absolute;
		bottom:0px;
		left:0px;
		color:#fff;
		width:130px;
		height:25px;
		line-height:25px;	
		border-radius:0 0 5px 5px;
		font-size:12px;
		background-color:rgba(0,0,0,0.6);
	}
	.app-index #tabbar .f1-list>li p{
		flex-wrap:wrap;
		width:130px;
	}
	.app-index #tabbar-with-music header{
		background-color:#C20C0C;
		color:#fff;
		padding:10px;
		width:100%;
	}
	.app-index #tabbar-with-music ul>li.mui-table-view-cell .iconfont{
		font-size:25px;
		color:#000;
	}
	.app-index #tabbar-with-music .right{
		position: relative;
		width:100px;
	}
	.app-index #tabbar-with-music .right>span:first-child{
		position:absolute;
		left:100%;
	}
	.app-index #tabbar-with-music .right .create{
		width:100%;
		height:120px;
		border-radius:5px 5px 0 0;
	}
	.app-index #tabbar-with-music .list .mui-media-object{
		width:60px;
		height:60px;
		border-radius:5px;
		margin-right:20px;
	}
	.app-index #tabbar-with-contact header{
		background-color:#C20C0C;
		color:#fff;
		padding:10px;
	}
	.app-index #tabbar-with-contact .menuList ul>li{
		margin:8px 0;
	}
	.app-index #tabbar-with-contact .f1 nav{
		height:50px;
		line-height:50px;
		border-bottom:2px solid #C20C0C;
	}
	.app-index #tabbar-with-contact .menuContent .top{
		position: relative;
	}
	.app-index #tabbar-with-contact .menuContent .top>img{
		width:130px;
		height:130px;
		border-radius:5px;
	}
	.app-index #tabbar-with-contact .menuContent .top .msg{
		position:absolute;
		bottom:0px;
		left:0px;
		color:#fff;
		width:130px;
		height:25px;
		line-height:25px;	
		border-radius:0 0 5px 5px;
		font-size:12px;
		background-color:rgba(0,0,0,0.6);
	}
	.app-index #tabbar-with-contact .menuContent ul{
		flex-wrap:wrap;
	}
	.app-index #tabbar-with-contact .menuContent ul p{
		width:130px;
		flex-wrap:wrap;
		text-align: left;
	}
	.app-index #tabbar-with-contact .iconfont.icon-gengduo1{
		margin-left:50px;
	}
	.app-index #tabbar-with-contact .f2 nav{
		height:50px;
		line-height:50px;
		border-bottom:2px solid #C20C0C;
	}
	.app-index #tabbar-with-contact .f2 .f2-content{
		height:100%;
		margin-top:5px;
	}
	.app-index #tabbar-with-contact .f2 .top{
		position: relative;
	}
	.app-index #tabbar-with-contact .f2 .f2-content ul{
		flex-wrap:wrap;
	}
	.app-index #tabbar-with-contact .f2 .top img{
		width:130px;
		height:130px;
		border-radius:5px;
	}
	.app-index #tabbar-with-contact .f2 .msg{
		position:absolute;
		bottom:0px;
		left:0px;
		color:#fff;
		width:130px;
		height:25px;
		line-height:25px;	
		border-radius:0 0 5px 5px;
		font-size:12px;
		background-color:rgba(0,0,0,0.6);
	}
	.app-index #tabbar-with-contact .f2 ul>li p{
		width:130px;
		flex-wrap:wrap;
	}
	.app-index #tabbar-with-contact .iconfont.icon-tuijian{
		color:#C20C0C;
	}
	.app-index #tabbar-with-my header{
		background-color:#C20C0C;
		color:#fff;
		padding:10px 0;
	}
	.app-index #tabbar-with-my section .mui-btn.mui-btn-danger{
		width:200px;
		padding:10px 0;
		margin:10px;
		border-radius:15px;
	}
	.app-index #tabbar-with-my .set ul>li{
		padding:10px;
		border-bottom:1px solid #ddd;
		display:flex;
		justify-content:space-between;
	}
	.app-index #tabbar-with-my .set .mui-table-view-cell::after{
    height:0px;
	}
	.app-index #tabbar-with-my .set .mui-btn-block{
		font-size:16px;
		color:red;
		font-weight:bold;
		border:0;
	}
	.app-index #tabbar-with-my  section .true{
		position: relative;
		padding:8px;
	}
	.app-index #tabbar-with-my  section .true img{
		width:100px;
		height:100px;
		border-radius:50%;
	}
	.app-index #tabbar-with-my  section .true span{
		position:absolute;
		top:80px;
		right:150px;
		font-size:30px;
		color:#000;
	}
	.app-index #tabbar-with-my  section .true .hiddenInput{
		display:none;
	}
</style>