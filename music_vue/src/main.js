import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import axios from 'axios'

// 导入 MUI 的样式表
import './lib/mui/css/mui.css'
// 还需要加载图标字体文件
import './lib/mui/css/icons-extra.css'
// 引入iconfont图标
import './assets/iconfont/iconfont.css'

import 'mint-ui/lib/style.css'
import MintUI from "mint-ui";
// 引入 swiper
import './lib/swiper/dist/js/swiper.min.js'
import './lib/swiper/dist/css/swiper.min.css'
// 引入3d轮播
import Carousel3d from 'vue-carousel-3d';
Vue.use(Carousel3d);

Vue.use(MintUI);
Vue.config.productionTip = false
//让axios的请求携带验证信息到服务端
axios.defaults.withCredentials=true
Vue.prototype.axios=axios


Vue.directive('anchor',{
  inserted : function(el,binding){
    el.onclick = function(){
     document.documentElement.scrollTop = $('#anchor-'+binding.value).offset().top
    }
  }
});
// Vue.filter("imgFilter",function(val){
//   var  str=String(val);
//   return str;
// })
// Vue.filter("phoneFilter",function(val){
//   var  str=String(val);
//   return str;
// })

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
