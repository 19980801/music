import Vue from 'vue'
import Router from 'vue-router'
import Index from './views/index'
import swiper from './views/swiper'
import more from './views/more'
import daylist from './views/daylist'
import toplist from './views/toplist'
import singer from './views/singer'
import singerMore from './views/singerMore'
import radio from './views/radio'
import tab1 from './views/tab1'


Vue.use(Router)

export default new Router({
  routes: [
    {path:"/",component:Index},
    {path:"/index", component:Index},
    {path:"/swiper", component:swiper},
    {path:"/more", component:more},
    {path:"/daylist", component:daylist},
    {path:"/toplist", component:toplist},
    {path:"/singer", component:singer},
    {path:"/singermore", component:singerMore},
    {path:"/radio", component:radio},
    {path:"/tab1", component:tab1},
  ]
})
