<template>
<div>
    <order-admin :order="order"></order-admin>
    <order-customer-admin :order="order"></order-customer-admin>
    <order-list-articles :order="order"></order-list-articles>
</div>
    
</template>
<script>

import OrderAdmin from '../../../components/order/OrderAdmin.vue'
import OrderCustomerAdmin from '../../../components/order/CustomerOrder.vue'
import OrderListArticles from '../../../components/order/ListArticlesOrder.vue'


export default {
  name: 'page-order-admin',
  components: {
    OrderAdmin,
    OrderCustomerAdmin,
    OrderListArticles
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