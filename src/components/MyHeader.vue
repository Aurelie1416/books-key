<template>
    <div id="header">
        <header class="body">
          <div id="nav">
            <router-link :to="{name: 'Home'}">Home</router-link> |
            <router-link :to="{name: 'About'}">About</router-link> |
            <router-link :to="{name: 'cart'}">cart</router-link> |
            <router-link :to="{name: 'Creation-article'}">Création d'article</router-link> |
            <router-link :to="{name: 'books'}">books</router-link>
          </div>
        </header>
    </div>   
</template>

<script>
  export default {
    name: 'my-header',
  }
</script>