<template>
<div id="complete_cart">
    <my-cart-to-order></my-cart-to-order>
    <shipping-form-cart></shipping-form-cart>
</div>
</template>
<script>

import MyCartToOrder from '../components/MyCartToOrder.vue'
import ShippingFormCart from '../components/ShippingFormCart.vue'

export default {
  name: 'page-cart',
  components: {
    MyCartToOrder,
    ShippingFormCart
  }
}

</script>