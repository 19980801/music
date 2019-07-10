<template>
  <header>
    <!-- 插槽 -->
    <slot name="title"></slot>
  </header>
</template>

<script>
export default {
  data(){
    return{

    }
  },
}
</script>

<style scoped>
  header{
    background-color:brown;
    height:50px;
    line-height:50px;
    color:#fff;
  }
</style>


