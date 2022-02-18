<template>
    <div id="my_main">
        <main class="body">
          <router-view/>
        </main>
    </div> 
</template>

<script>

  export default {
    name: 'my-main',
    data: function(){
      return{
        book: null
      }
    },
    beforeCreate: function(){
      fetch("/json/cart.json")
      .then(response => response.json())
      .then(result => {
          this.book = { bookId:result.books[0].id }
      });
    }
  }
</script>