<template>
    <div>
        <customer-information></customer-information>
        <list-orders-by-customer></list-orders-by-customer>
    </div>
</template>
<script>
import CustomerInformation from  '../../../components/customer/CustomerInformation.vue'
import ListOrdersByCustomer from '../../../components/order/ListOrdersByCustomer.vue'
export default{
    name: 'page-customer-admin',
    components: {
      CustomerInformation,
      ListOrdersByCustomer
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