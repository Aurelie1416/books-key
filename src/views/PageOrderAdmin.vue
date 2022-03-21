<template>
<div>
    <order-admin :order="order"></order-admin>
    <order-customer-admin :customer="customer"></order-customer-admin>
    <order-list-articles></order-list-articles>
</div>
    
</template>
<script>

import OrderAdmin from '../components/OrderAdmin.vue'
import OrderCustomerAdmin from '../components/CustomerOrder.vue'
import OrderListArticles from '../components/ListArticlesOrder.vue'
import store from '../store/index'


export default {
  name: 'page-order-admin',
  components: {
    OrderAdmin,
    OrderCustomerAdmin,
    OrderListArticles
  },
  store: store,
    data: function(){
        return{
            order: this.$store.state.orders[this.$route.params.orderId],
            customer:this.$store.state.customers[1] 
        }
    },
    created: function(){
        this.$store.dispatch('ajaxOrders');
        this.$store.dispatch('ajaxCustomers');
    }
}

</script>