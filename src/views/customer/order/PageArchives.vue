<template>
    <my-archives></my-archives>
</template>
<script>

import MyArchives from '../../../components/order/MyArchives.vue'

export default {
  name: 'page-archives',
  components: {
    MyArchives
  },
  computeds: {
      customerId() {
        return this.$route.params.customerId
      }
    },
}

</script>