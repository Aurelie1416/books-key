<template>
    <div>
        <customer-admin></customer-admin>
        <customer-order-list-admin></customer-order-list-admin>
    </div>
</template>
<script>

import CustomerAdmin from '../components/CustomerAdmin.vue'
import CustomerOrderListAdmin from '../components/CustomerOrderListAdmin.vue'
export default{
    name: 'page-customer-admin',
    components: {
      CustomerAdmin,
      CustomerOrderListAdmin
    },
    computeds: {
      customerId() {
        return this.$route.params.customerId
      }
    },
    // methods: {
    //   goBack() {
    //     window.history.length > 1 ? this.$router.go(-1) : this.$router.push('/')
    //   }
    // }
  }

</script>