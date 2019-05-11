<template>
  <div class="Menu">
    <div @click="btns">更多</div>
    <div class="MenuBox" >
        <div class="slidSec" ref="menuWrapper" v-show="btn">
          <ul class="slider">
            <li v-for="(item,index) in product" :class="{'active':currentIndex===index}" @click="selectMenu(index,$event)">{{index}}{{item}}</li>
          </ul>
        </div>
        <div class="productSec" ref="rightContent" @mousewheel="scrool">
          <ul>
            <li v-for="(item,index) in product" class="food-list-hook">
              <ul class="storebox">
                <li v-for="i in [1,2,3,4,5] ">
                  <div class="storelist">
                    <div class="storeInfo">
                      <h3 class="Name">意大利肉酱面</h3>
                      <p class="Desc">意大利肉酱面,物美价廉,回味无穷</p>
                      <div class="priceCalu">
                        <span class="price">¥20</span>
                        <!-- <div class="opeator">
                          <span class="dot" v-if="false">-</span>
                          <span v-if="false">1</span>
                          <span class="dot">+</span>
                        </div> -->
                      </div>
                    </div>
                  </div>
                </li>
              </ul>
            </li>
          </ul>
        </div>
    </div>
  </div>
</template>

<script>
// import BScroll from 'better-scroll'
export default {
  name: 'Menu',
  data () {
    return {
      msg: 'Welcome to Your Vue.js App',
      scrollY:0,
      product:[
        '面饭',
        '热销',
        '特惠',
        '小食',
        '凑单',
      ],
      listHeight:[],
      currentIndex:0,
      distance:0,
      total:0,
      step:0,
      btn:false
      // scrolled:0
    }
  },
   computed: {

  },
  created(){
    this.$nextTick(() => {
    this._initScroll();
     setTimeout(() => {
        this._calculateHeight();
        document.body.scrollTop = 0;
      document.documentElement.scrollTop = 0;
        }, 300);
    })
  },
  methods:{
    btns(){
      this.btn=!this.btn
    },
    selectMenu(index,event) {
      this.distance=document.documentElement.scrollTop || document.body.scrollTop;
      let jump = this.$refs.rightContent.getElementsByClassName('food-list-hook');
      let total = jump[index].offsetTop;      // 获取需要滚动的距离
      this.total=total
      // Chrome
      document.body.scrollTop = this.total
      // Firefox
      document.documentElement.scrollTop = this.total
      // Safari
      window.pageYOffset = this.total;
      this.currentIndex=index;
      this.step = this.total / 50;
      if (this.total > this.distance) {
        this.smoothDown()
      } else {
        let newTotal = this.distance - this.total
        this.step = newTotal / 50
        this.smoothUp()
      }
    },
    _initScroll() {

    },
    scrool(pos){
       let scrolled = document.documentElement.scrollTop || document.body.scrollTop;
       for(var i=0;i<this.listHeight.length;i++){
         console.log(this.listHeight[i])
         if(this.listHeight[i]<scrolled+180 && scrolled+180<this.listHeight[i+1]){
             this.currentIndex=i;
             return false;
         }
       }
    },
    smoothDown () {
          if (this.distance < this.total) {
            this.distance += this.step
　　　　　　　document.body.scrollTop = this.distance
            document.documentElement.scrollTop = this.distance
            setTimeout(this.smoothDown, 10)
          } else {
            document.body.scrollTop = this.total-80
            document.documentElement.scrollTop = this.total-80
          }
        },
        smoothUp () {
          if (this.distance > this.total) {
            this.distance -= this.step
　　　　　　　document.body.scrollTop = this.distance
            document.documentElement.scrollTop = this.distance
            setTimeout(this.smoothUp, 10)
          } else {
            document.body.scrollTop = this.total-80
            document.documentElement.scrollTop = this.total-80
          }
       } ,
     _calculateHeight() {
          let foodList = this.$refs.rightContent.getElementsByClassName('food-list-hook');
          let height = 0;
          this.listHeight.push(height);
          for(let i=0;i<foodList.length;i++){
            let item = foodList[i];
            height += item.clientHeight;
            this.listHeight.push(height);
          }
    },
  }

}
</script>
<style scoped>
ul{
  list-style:none;
  
}
.Menu div:first-child{
  /* position:fixed; */
}
.Menu{
  padding-top:68px;
  /* position: relative; */
  height: 100%;
  width:100%;
  margin:0 auto;
  /* top:68px; */
   /*bottom:0px; */
  overflow: hidden;
  /* overflow:hidden; */
}
.MenuBox{
  display: flex;
  margin-top:16px;
  max-height: 100%;
  height:100%;
}
.slidSec{
  flex:0 0 178px;
  width: 178px;
}
.slider{
  position: fixed;
  width:144px;
  left:0;
  top:auto;
}
.slider li{
  width: 144px;
  height: 50px;
  line-height: 50px;
  margin-left:10px;
  margin-bottom:20px;
  background: #fff;
  border:1px solid #ea5a47;
  border-radius: 6px;
  color:#ea5a47;
  cursor: pointer;
}
.slider li.active{
  background: #ea5a47;
  color:#fff;
}
.slider li:hover{
  background: #ea5a47;
  color:#fff;
}
.productSec{
  flex:0 0 1022px;
}
.storebox{
  display: flex;
  flex-wrap: wrap;
}
.storebox li{
    width: 460px;
    height: 200px;
    border-radius: 10px;
    border: 1px solid #ddd;
    margin-left: 33px;
    margin-bottom: 20px;
}
.storelist{
  display: flex;
}
.storelist img{
  border-radius: 10px 0px 0px 10px;
}
.storeInfo{
    padding: 0px 10px;
}
.Name{
  font-size: 24px;
  color:#bb5442;
   color:#333;
  margin:20px 0;
  text-align: left;
}
.Desc{
  font-size: 14px;
  line-height: 18px;
  text-align: left;
  height: 70px;
  text-overflow: ellipsis;
  overflow: hidden;
}
.priceCalu{
  display: flex;
}
.price{
  font-size: 24px;
  color:#bb5442;
}
.opeator{
  flex: 1;
  text-align: right;
  height: 24px;
  line-height: 24px;
}
.dot{
  width: 20px;
  height: 20px;
  background: red;
  border-radius: 24px;
  display: inline-block;
  text-align: center;
  line-height: 20px;
  color: #fff;
  font-size: 18px;
  cursor: pointer;
}
.AddShopcart{
  position: fixed;
  bottom: 20px;
  right: 20px;
}
.shopcartbox{
  position: relative;
  cursor: pointer;
}
.shopcartbox .count{
    position: absolute;
    top: 10px;
    left: 4px;
    width: 60px;
    text-align: center;

}
.shopcartbox .count span{
  font-size: 14px;
  background: #ea5a47;
  display:inline-block;
  padding: 2px 10px;
  left: 12px;
  border-radius: 12px;
  border: 2px solid #fff;
  color: #fff;
  cursor: pointer;
}
</style>