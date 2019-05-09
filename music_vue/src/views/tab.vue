<template>
  <div>
    <header id=header>
    <div id="nav" class="swiper-container">
        <ul class="swiper-wrapper">
            <li class="swiper-slide active-nav"><a href="javascript:;">手机</a></li>
            <li class="swiper-slide"><a href="javascript:;">厨具</a></li>
            <li class="swiper-slide"><a href="javascript:;">数码</a></li>
            <li class="swiper-slide"><a href="javascript:;">家纺</a></li>
            <li class="swiper-slide"><a href="javascript:;">生鲜</a></li>
            <li class="swiper-slide"><a href="javascript:;">家用电器</a></li>
            <li class="swiper-slide"><a href="javascript:;">食品饮料</a></li>
            <li class="swiper-slide"><a href="javascript:;">电脑/办公</a></li>
            <li class="swiper-slide"><a href="javascript:;">家用日用</a></li>
        </ul>
    </div>
  </header>
  <div id="page" class="swiper-container">
    <div class="swiper-wrapper">
        <div class="swiper-slide slidepage">手机</div>
        <div class="swiper-slide slidepage">厨具</div>
        <div class="swiper-slide slidepage">数码</div>
        <div class="swiper-slide slidepage">家纺</div>
        <div class="swiper-slide slidepage">生鲜</div>
        <div class="swiper-slide slidepage">家用电器</div>
        <div class="swiper-slide slidepage">食品饮料</div>
        <div class="swiper-slide slidepage">电脑/办公</div>
        <div class="swiper-slide slidepage">家用日用</div>
    </div>
  </div>
  </div>
</template>
<script>
export default {
  data(){
    return{

    }
  },
  mounted() {
    var myNav = new Swiper('#nav', {
            spaceBetween: 10,
            slidesPerView : 3,
            watchSlidesProgress : true,
            watchSlidesVisibility : true,
            on:{
                tap: function(){
                    myPage.slideTo( myNav.clickedIndex)
                }
            }
        })
        var myPage = new Swiper('#page',{
            on:{
            slideChangeTransitionStart: function(){
                updateNavPosition()
            }}
        })
        function updateNavPosition(){
            $('#nav .active-nav').removeClass('active-nav');
            var activeNav = $('#nav .swiper-slide').eq(myPage.activeIndex).addClass('active-nav');
            if (!activeNav.hasClass('swiper-slide-visible')) {
                console.log(1);
                if (activeNav.index()>myNav.activeIndex) {
                    console.log(2);
                    var thumbsPerNav = Math.floor(myNav.width/activeNav.width())-1
                    myNav.slideTo(activeNav.index()-thumbsPerNav)
                }
                else {
                    console.log(3);
                    myNav.slideTo(activeNav.index())
                }   
            }
        }
  },
}
</script>
<style scoped>
  
</style>