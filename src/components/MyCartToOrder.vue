<template>
<div id="my_cart_to_order">
    <my-cart></my-cart>
</div>
</template>
<script>
  import MyCart from './MyCart.vue'
  export default {
    name: 'my-cart-to-order',
    components: {
      MyCart    
      }
  }
</script>