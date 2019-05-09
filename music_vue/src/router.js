import Vue from 'vue'
import Router from 'vue-router'
import Index from './views/index'
import tab from './views/tab'
import tab1 from './views/tab1'
import swiper from './views/swiper'
import more from './views/more'


Vue.use(Router)

export default new Router({
  routes: [
    {path:"/",component:Index},
    {path:"/index", component:Index},
    {path:"/tab", component:tab},
    {path:"/tab1", component:tab1},
    {path:"/swiper", component:swiper},
    {path:"/more", component:more},
  ]
})
