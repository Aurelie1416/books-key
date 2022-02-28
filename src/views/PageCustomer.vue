<template>
    <my-account></my-account>
</template>
<script>

import MyAccount from '../components/MyAccount.vue'

export default{
    name: 'page-customer',
    components: {
      MyAccount
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