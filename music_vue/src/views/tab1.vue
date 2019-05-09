<template>
  <div>
    <div class="swiper-container">
        <div class="swiper-wrapper">
            <div class="swiper-slide" v-for="item of list1" :key="item.i">
              <div class="dd">
                <img :src="item.img_url">
              </div>
            </div>
        </div>
    </div>
  </div>
</template>
<script>
export default {
  data(){
    return{
      list1:[
        {img_url:"http://127.0.0.1:3001/imgs/banner1.jpg"},
        {img_url:"http://127.0.0.1:3001/imgs/banner2.jpg"},
        {img_url:"http://127.0.0.1:3001/imgs/banner3.jpg"},
      ],
    }
  },
  created() {
    // this.navlist1();
  },
  mounted() {
    var mySwiper = new Swiper('.swiper-container', {
            loop : true,
            centeredSlides: true,
            slidesPerView: "auto",
            initialSlide:1,
        })
  },
  methods: {
    //     navlist1(){
    //   this.axios.get("http://127.0.0.1:3001/banner").then(res=>{
    //     this.list1=res.data.data;
    //   })
    // }
  },
}
</script>
<style scoped>
 
 .dd img{
   width:100%;
   height:200px;
 }
    .swiper-container {
        width:100%;
    }
    .swiper-slide {
        width:80%;
        transform: scale(0.9);
 
    }
 
    .swiper-slide-active {
      -webkit-transform: scale(1);
      -moz-transform: scale(1);
      -ms-transform: scale(1);
      -o-transform: scale(1);
      transform: scale(1);
    }
  
</style>