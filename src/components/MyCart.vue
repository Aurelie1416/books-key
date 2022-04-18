<template>
<div id="cart">
  <table v-if="books.length > 0" cellspacing="0">
    <caption>Mon panier</caption>
    <thead>
      <tr>
        <th></th>
        <th>Titre</th>
        <th>Prix (unitaire)</th>
        <th>Quantité</th>
        <th>Prix (total)</th>
        <th>Supprimer</th>
      </tr>
    </thead>
    <tbody>
      <tr v-for="book in books" :key="book.id" >
        <td>
          <router-link :to="{ name: 'book', params:{bookId: book.id}}">
          <div class="link">
            <a href="#"><img :src="book.image" alt="cover"></a>
          </div>
          </router-link>
        </td>
        <td data-label="Titre">
          <router-link :to="{ name: 'book', params:{bookId: book.id}}">
          <div>{{book.title}}</div>
          <div>({{book.format}})</div>
          </router-link>
        </td>
        <td data-label="Prix (unitaire)">
          <div>{{book.price}}&euro;</div>
        </td>
        <td data-label="Quantité">
          <div class="more_less">
            <input type="number" class="quantity" name="quantity" min="0" v-model="book.quantity" value="book.quantity">
            <div class="button_more_less">
              <div class="more" v-on:click="changeQuantity(book, 1)">
                <p>+</p>
              </div>
              <div class="less" v-on:click="changeQuantity(book, -1)">
                <p>-</p>
              </div>
            </div>
          </div>
        </td>
        <td data-label="Prix (total)">{{book.quantity * book.price}}&euro;</td>
        <td data-label="Supprimer"><div class="delete" v-on:click="deleteBook(book)"><i class="fas fa-times"></i></div></td>
      </tr>
    </tbody>                
  </table>
  <h3 v-else>Votre panier est vide</h3>

  <!-- TOTAL CART-->
  <total-cart :books="books"></total-cart>
</div>
</template>
<script>
  import TotalCart from './TotalCart.vue'

  export default {
      name: 'my-cart',
      components: {
        TotalCart
      },
      created: function(){
        this.$store.dispatch('ajaxCart');
      },
      methods: { 
          deleteBook(book) {
              this.$store.commit('deleteCartBook', book);
          },
          changeQuantity(book, modificator){
            if(modificator > 0 || (modificator < 0 && book.quantity > 1)){
                book.quantity = parseInt(book.quantity) + modificator;
            }
          }
      },
      computed: {
        books(){
            return this.$store.state.cartBooks;
        },
       columns(){
           return this.$store.state.columnCart;
        }
      },
      watch: {
          shippingChoice: function(value){
              console.log(value)
          }
      }
  }
</script>