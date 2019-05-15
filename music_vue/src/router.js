import Vue from 'vue'
import Router from 'vue-router'
import Index from './views/index'
import ad from './views/ad'
import swiper from './views/swiper'
import more from './views/more'
import daylist from './views/daylist'
import toplist from './views/toplist'
import singer from './views/singer'
import singerMore from './views/singerMore'
import radio from './views/radio'
import test from './views/test'
import login from './views/login'
import phonelogin from './views/phonelogin'
import reg from './views/reg'
import searchlist from './views/searchlist'
import forget from './views/forget'


Vue.use(Router)

export default new Router({
  routes: [
    {path:"/",component:ad},
    {path:"/index", component:Index},
    {path:"/swiper", component:swiper},
    {path:"/more", component:more},
    {path:"/daylist", component:daylist},
    {path:"/toplist", component:toplist},
    {path:"/singer", component:singer},
    {path:"/singermore", component:singerMore},
    {path:"/radio", component:radio},
    {path:"/test", component:test},
    {path:"/login", component:login},
    {path:"/phonelogin", component:phonelogin},
    {path:"/reg", component:reg},
    {path:"/searchlist/:key", component:searchlist,props:true},
    {path:"/forget", component:forget},
  ] 
})
