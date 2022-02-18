import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    columnCart: [
      '', 
      'Titre', 
      'Auteur', 
      'Prix (unitaire)', 
      'Quantité', 'Prix (total)', 
      'Supprimer'
    ],
    cart: [],
    books: []
  },
  mutations: {
    ajax_book(state, cart){
        state.cart = cart;
    }
  },
  actions: {
    ajaxBooks(store) {    
            
      let books = [];

      fetch("/json/cart.json")
      .then(response => response.json())
      .then(result => {
          for(let i = 0; i < result.cart.length; i++){
              let book = { id:result.cart[i].id, image:result.cart[i].image, title:result.cart[i].title, writer:result.cart[i].writer, price:result.cart[i].price, quantity:result.cart[i].quantity }
              books.push(book);
          }

          console.log('fetch action',books)
          store.commit('ajax_book', books);
      })
    }
  }
})
