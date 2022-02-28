<template>
    <my-book-admin></my-book-admin>
</template>
<script>

import MyBookAdmin from '../components/MyBookAdmin.vue'

export default{
    name: 'page-book-admin',
    components: {
      MyBookAdmin
    },
    computeds: {
      bookId() {
        return this.$route.params.bookId
      }
    },
    // methods: {
    //   goBack() {
    //     window.history.length > 1 ? this.$router.go(-1) : this.$router.push('/')
    //   }
    // }
  }

</script>