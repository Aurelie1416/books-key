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
    columnOrdersAdmin: [
      'Date',
      'Numéro de commande',
      'Recette',
      'Client',
      'Status'
    ],
    columnOrderFollowing: [
      'status',
      'Date de commande',
      "Date d'envoi",
      'Date de livraison'
    ],
    columnOrderCustomer: [
      'Client',
      'Adresse de livraison',
      'Email',
      'Téléphone'
    ],
    cartBooks: [],
    books: [], 
    customers: [],
    orders: []
  },
  mutations: {
    ajax_books(state, books){
      state.books = books;
    },
    ajax_cart(state, cartBooks){
      state.cartBooks = cartBooks;
    },
    ajax_customers(state, customers){
      state.customers = customers
    },
    ajax_orders(state, orders){
      state.orders = orders
    },
    
    deleteCartBook(state, cartBook) {
      state.cartBooks.splice(state.cartBooks.indexOf(cartBook), 1);
  },
  numberBooksInCart(state){
    let numberBooks = 0;
    for(const cartBook of state.cartBooks){
      numberBooks += cartBook.quantity
    } 
    return numberBooks
  },
  addBookInCart(state, newBook){
    for(const cartBook of state.cartBooks){
      if(newBook.id === cartBook.id){
        cartBook.quantity++
        return
      }
    }
    state.cartBooks.push(newBook)
  }
  },
  actions: {
    ajaxCart(store) {       
      if(store.state.cartBooks.length === 0){
        let cartBooks = [];

        fetch("/json/cart.json")
        .then(response => response.json())
        .then(result => {
            for(let i = 0; i < result.cart.length; i++){
                let book = { id:result.cart[i].id, image:result.cart[i].image, title:result.cart[i].title, writer:result.cart[i].writer, price:result.cart[i].price, quantity:result.cart[i].quantity, publication_date:result.cart[i].publication_date, edition:result.cart[i].edition, format:result.cart[i].format, page_number:result.cart[i].page_number, summary:result.cart[i].summary }
                cartBooks.push(book);
            }
  
            store.commit('ajax_cart', cartBooks);
        })
      }
      
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

          store.commit('ajax_books', listBooks);
      })
    },
    ajaxCustomers(store) {    
            
      let listCustomers = [];

      fetch("/json/customers.json")
      .then(response => response.json())
      .then(result => {
          for(let i = 0; i < result.customer.length; i++){
              let customer = { id:result.customer[i].id, image:result.customer[i].image, last_name:result.customer[i].last_name, first_name:result.customer[i].first_name, email:result.customer[i].email, phone:result.customer[i].phone, address:result.customer[i].address, inscription_date:result.customer[i].inscription_date, last_order_date:result.customer[i].last_order_date }
              listCustomers.push(customer);
          }
          store.commit('ajax_customers', listCustomers);
      })
    },
    ajaxOrders(store) {    
            
      let listOrders = [];

      fetch("/json/orders.json")
      .then(response => response.json())
      .then(result => {
          for(let i = 0; i < result.orders.length; i++){
              let order = { id:result.orders[i].id, creation_date:result.orders[i].creation_date, sending_date:result.orders[i].sending_date, delivery_date:result.orders[i].delivery_date, status:result.orders[i].status, number_order:result.orders[i].number_order, customer:result.orders[i].id_customer, articles:result.orders[i].id_articles, bill:result.orders[i].bill }
              listOrders.push(order);
          }
          store.commit('ajax_orders', listOrders);
      })
    },
    numberBooksInCart(store){
      store.commit('numberBooksInCart');
    }
  }
})
