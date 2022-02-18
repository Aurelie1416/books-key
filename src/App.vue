<template>
  <div id="app">

    <my-header></my-header>
    <my-main></my-main>    
    <my-footer></my-footer>
  </div>
</template>

<script>

  import MyHeader from './components/MyHeader.vue'
  import MyMain from './components/MyMain.vue'
  import MyFooter from './components/MyFooter.vue'

  export default {
    name: 'App',
    components: {
        MyFooter,
        MyMain,
        MyHeader
    }
  }
</script>

<style>

#nav {
  padding: 30px;
}

#nav a {
  font-weight: bold;
  color: #2c3e50;
}

#nav a.router-link-exact-active {
  color: #42b983;
}
</style>
