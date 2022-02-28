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
    columnCustomers: [
      '',
      'Nom',
      'Prénom',
      "Date d'inscription",
      'Date de la dernière commande',
      'Désinscrire'
    ],
    columnCustomer: [
      'Nom',
      'Prénom',
      'Email',
      'Adresse',
      'Téléphone'
    ],
    cart: [],
    books: [], 
    customers: []
  },
  mutations: {
    ajax_book(state, books){
      state.books = books;
    },
    ajax_cart(state, cart){
      state.cart = cart;
    },
    ajax_customer(state, customers){
      state.customers = customers
    }
  },
  actions: {
    ajaxCart(store) {    
            
      let books = [];

      fetch("/json/cart.json")
      .then(response => response.json())
      .then(result => {
          for(let i = 0; i < result.cart.length; i++){
              let book = { id:result.cart[i].id, image:result.cart[i].image, title:result.cart[i].title, writer:result.cart[i].writer, price:result.cart[i].price, quantity:result.cart[i].quantity, publication_date:result.cart[i].publication_date, edition:result.cart[i].edition, format:result.cart[i].format, page_number:result.cart[i].page_number, summary:result.cart[i].summary }
              books.push(book);
          }

          store.commit('ajax_cart', books);
      })
    },
    ajaxBooks(store) {    
            
      let listBooks = [];

      fetch("/json/books.json")
      .then(response => response.json())
      .then(result => {
          for(let i = 0; i < result.books.length; i++){
              let book = { id:result.books[i].id, image:result.books[i].image, title:result.books[i].title, writer:result.books[i].writer, price:result.books[i].price, quantity:result.books[i].quantity, publication_date:result.books[i].publication_date, edition:result.books[i].edition, format:result.books[i].format, page_number:result.books[i].page_number, summary:result.books[i].summary }
              listBooks.push(book);
          }

          store.commit('ajax_book', listBooks);
      })
    },
    ajaxCustomers(store) {    
            
      let listCustomers = [];

      fetch("/json/customers.json")
      .then(response => response.json())
      .then(result => {
          for(let i = 0; i < result.customer.length; i++){
              let customer = { id:result.customer[i].id, last_name:result.customer[i].last_name, first_name:result.customer[i].first_name, email:result.customer[i].email, phone:result.customer[i].phone, address:result.customer[i].address, inscription_date:result.customer[i].inscription_date, last_order_date:result.customer[i].last_order_date }
              listCustomers.push(customer);
          }
          store.commit('ajax_customer', listCustomers);
      })
    }
  }
})
