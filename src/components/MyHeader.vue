<template>
    <div id="header">
        <header class="body">
          <div id="nav">
            <router-link :to="{name: 'Home'}">Home</router-link> |
            <router-link :to="{name: 'About'}">About</router-link> |
            <router-link :to="{name: 'cart'}">cart</router-link> |
            <router-link :to="{name: 'creation-book'}">Création d'article</router-link> |
            <router-link :to="{name: 'creation-customer'}">Création d'un client</router-link> |
            <router-link :to="{name: 'inscription'}">Inscription</router-link> |
            <router-link :to="{name: 'connexion'}">Connexion</router-link> |
            <router-link :to="{name: 'dashboard'}">Dashboard</router-link> |
            <router-link :to="{name: 'customers'}">Liste des clients</router-link> |
            <router-link :to="{name: 'archives', params: { customerId: 6 }}">Mes archives</router-link> |
            <router-link :to="{name: 'orders-admin'}">Liste des commandes</router-link> |
            <router-link :to="{name: 'creation-edition'}">Création maison édition</router-link> |
            <router-link :to="{name: 'creation-writer'}">Création écrivain</router-link> |
            <router-link :to="{name: 'creation-order', params: { customerId: 6 }}">Création commande</router-link> |
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