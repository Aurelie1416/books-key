<template>
    <div>
        <customer-information></customer-information>
        <!-- <archives-admin></archives-admin> -->
    </div>
</template>
<script>
// import ArchivesAdmin from '../../../components/ArchivesAdmin.vue'

import CustomerInformation from '../../../components/customer/CustomerInformation.vue'
export default{
    name: 'page-customer-admin',
    components: {
      CustomerInformation,
        // ArchivesAdmin
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