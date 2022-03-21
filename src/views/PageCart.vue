<template>
<div id="my_cart_to_order">
    <my-cart></my-cart>
    <validation-order></validation-order>
</div>
</template>
<script>
  import MyCart from '../components/MyCart.vue'
  import ValidationOrder from '../components/ValidationOrder.vue'
  export default {
    name: 'my-cart-to-order',
    components: {
      MyCart,
      ValidationOrder    
    }
  }
</script>