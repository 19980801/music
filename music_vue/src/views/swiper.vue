<template>
  <div id="slider" class="slider d-flex">
    <div v-for="(item,index) in newList" :key="index">
      <img :src="item.img_url" @touchstart="touchstart" @touchmove="touchmove"/>
      <h5 class="text-dark font-weight-bold">{{item.title}}</h5>
      <i class="font-style">{{item.author}}</i>
    </div>
  </div>
</template>
<script>
export default {
  data () {
    return {
      newList:[],
      startPointX: 0,
      changePointX: 0,
      showIndex: 0,
    }
  },
  created() {
    this.new();
  },
  methods:{
    new(){
      this.axios.get("http://127.0.0.1:3001/newlist").then(res=>{
        this.newList=res.data.data;
      })
    },
    show(index){
      this.changePointX=this.startPointX;
      let slider = document.getElementById('slider');
      slider.style.marginLeft=`-${260*index}px`;
    },
    touchstart(e){
      this.startPointX = e.changedTouches[0].pageX;
    },
    touchmove(e){
      if(this.startPointX==this.changePointX){
        return;
      }
      let currPointX = e.changedTouches[0].pageX;
      let leftSlide = this.startPointX-currPointX;
      if(leftSlide>30&&this.showIndex<this.newList.length-1){
        this.show(++this.showIndex)
      }else if(leftSlide<-30&&this.showIndex>0){
        this.show(--this.showIndex)
      }
    },
  }
}
</script>
<style scoped>
  #slider{overflow: hidden;}
  #slider div{
    margin:5px 2px;
  }
  #slider img{
    width:130px;
    height: 130px;
    border-radius:5px;
  }
  #slider h5{
    margin:0;
    width:130px;
    overflow: hidden;  /*溢出隐藏*/
    text-overflow:ellipsis; /*以省略号...显示*/
    white-space:nowrap;  /*强制不换行*/
  }
  #slider i{
    font-size:12px;
  }
</style>