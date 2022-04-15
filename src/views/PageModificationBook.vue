<template>
    <modification-book></modification-book>
</template>
<script>

import ModificationBook from '../components/ModificationBook.vue'

export default{
    name: 'page-modification-article',
    components: {
      ModificationBook
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