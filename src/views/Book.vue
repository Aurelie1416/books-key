<template>
    <my-book></my-book>
</template>
<script>

import MyBook from '../components/MyBook.vue'

export default{
    name: 'my-section',
    components: {
      MyBook
    },
    computeds: {
      bookId() {
        return this.$route.params.bookId
      }
    },
    methods: {
      goBack() {
        window.history.length > 1 ? this.$router.go(-1) : this.$router.push('/')
      }
    }
  }

</script>