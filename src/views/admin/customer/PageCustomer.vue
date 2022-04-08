<template>
    <div>
        <customer-information></customer-information>
        <customer-order-list-admin></customer-order-list-admin>
    </div>
</template>
<script>

import CustomerInformation from '../../../components/customer/CustomerInformation.vue'
import CustomerOrderListAdmin from '../../../components/CustomerOrderListAdmin.vue'
export default{
    name: 'page-customer-admin',
    components: {
      CustomerInformation,
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