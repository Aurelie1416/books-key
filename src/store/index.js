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
      'Quantité', 
      'Prix (total)', 
      'Supprimer'
    ],
    columnBook: [
      '', 
      'Titre', 
      'Auteur', 
      'Prix (unitaire)', 
      'Modifier', 
      'Supprimer'
    ],
    cart: [],
    books: []
  },
  mutations: {
    ajax_book(state, books){
      state.books = books;
    },
    ajax_Cart(state, cart){
      state.cart = cart;
    }
  },
  actions: {
    ajaxCart(store) {    
            
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
    },
    ajaxBooks(store) {    
            
      let listBooks = [];

      fetch("/json/cart.json")
      .then(response => response.json())
      .then(result => {
          for(let i = 0; i < result.books.length; i++){
              let book = { id:result.books[i].id, image:result.books[i].image, title:result.books[i].title, writer:result.books[i].writer, price:result.books[i].price, quantity:result.books[i].quantity }
              listBooks.push(book);
          }

          console.log('fetch action',listBooks)
          store.commit('ajax_book', listBooks);
      })
    }
  }
})
