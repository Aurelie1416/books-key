<template>
    <div>
        <customer-information></customer-information>
        <router-link :to="{ name: 'modification-Customer', params:{customerId: this.$route.params.customerId}}">
            Modifier mes informations
        </router-link>
    </div>
</template>
<script>

import CustomerInformation from '../../../components/customer/CustomerInformation.vue'
export default{
    name: 'page-customer',
    components: {
      CustomerInformation,
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