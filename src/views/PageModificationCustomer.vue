<template>
    <modification-customer></modification-customer>
</template>
<script>

import ModificationCustomer from '../components/ModificationCustomer.vue'

export default{
    name: 'page-modification-customer',
    components: {
      ModificationCustomer
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