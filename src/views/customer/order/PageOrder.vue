<template>
<div>
    <order-information :order="order"></order-information>
    <list-books-by-order :order="order"></list-books-by-order>
</div>
    
</template>
<script>

import ListBooksByOrder from '../../../components/order/ListBooksByOrder.vue'
import OrderInformation from '../../../components/order/OrderInformation.vue';


export default {
  name: 'page-order',
  components: {
    ListBooksByOrder,
    OrderInformation
  },
  beforeCreate: function () {
    this.$store.dispatch("ajaxOrders");
  },
  computed: {
    order() {
      let order = {};
      for (const order_indiviual of this.$store.state.orders) {
        if (order_indiviual.id == this.$route.params.orderId) {
          order = order_indiviual;
        }
      }
      return order;
    },
  }
}

</script>