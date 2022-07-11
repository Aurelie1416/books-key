import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    cartBooks: [],
    books: [], 
    customers: [],
    orders: [],
    statusOrder: [],
    writers: []
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
    ajax_status_order(state, statusOrder){
      state.statusOrder = statusOrder
    },
    ajax_writers(state, writers){
      state.writers = writers;
    },
    deleteCartBook(state, cartBook) {
      state.cartBooks.splice(state.cartBooks.indexOf(cartBook), 1);
  },
  deleteBook(state, book) {
    state.books.splice(state.books.indexOf(book), 1);
  },
  deleteCustomer(state, customer) {
    state.customers.splice(state.customers.indexOf(customer), 1);
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
  },
  showMenuOption() {
    let arrow = document.querySelector(".arrow");
    let options = document.querySelectorAll(".option_menu");
    let list = document.querySelector(".list");
    let number = 0;
    let zIndex = options.length;

    if (arrow.style.transform == "rotateZ(-180deg) translateX(-5px)") {
      arrow.style.transform = "rotateZ(0deg) translateX(5px)";
      list.style.visibility = "hidden";
      list.height = "0px";
      for (const option of options) {
        option.style.height = "0px";
        option.style.transition =
          "height 200ms linear 450ms, top 500ms linear, border-bottom 0ms linear 700ms";
        option.style.top = "0px";
        number = 0;
        option.style.borderBottom = "solid 1px transparent";
      }
    } else {
      arrow.style.transform = "rotateZ(-180deg) translateX(-5px)";
      list.style.visibility = "visible";
      list.style.height = "100px";
      for (const option of options) {
        option.style.display = "flex";
        option.style.height = "30px";
        option.style.top = number * (20 + 1) + "px";
        option.style.transition =
          "all 500ms ease-in-out, background-color 0s";
        option.style.zIndex = 100 + zIndex;
        option.style.borderBottom = "solid 1px #645E4E";
        zIndex--;
        number++;
      }
    }
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
                let book = { id:result.cart[i].id, image:result.cart[i].image, univers:result.cart[i].univers, serial:result.cart[i].serial, volume:result.cart[i].volume, title:result.cart[i].title, writer:result.cart[i].writer, price:result.cart[i].price, quantity:result.cart[i].quantity, publication_date:result.cart[i].publication_date, edition:result.cart[i].edition, format:result.cart[i].format, page_number:result.cart[i].page_number, summary:result.cart[i].summary }
                cartBooks.push(book);
            }
  
            store.commit('ajax_cart', cartBooks);
        })
      }
    },
    ajaxStatusOrder(store) {       
      if(store.state.statusOrder.length === 0){
        let statusOrder = [];

        fetch("/json/statusOrder.json")
        .then(response => response.json())
        .then(result => {
            for(let i = 0; i < result.status_order.length; i++){
                let status = { id:result.status_order[i].id, status:result.status_order[i].status }
                statusOrder.push(status);
            }
  
            store.commit('ajax_status_order', statusOrder);
        })
      }
    },
    ajaxBooks(store) {    
            
      let listBooks = [];

      fetch("/json/books.json")
      .then(response => response.json())
      .then(result => {
          for(let i = 0; i < result.books.length; i++){
              let book = { id:result.books[i].id, image:result.books[i].image, univers:result.books[i].univers, serial:result.books[i].serial, volume:result.books[i].volume, title:result.books[i].title, writer:result.books[i].writer, price:result.books[i].price, quantity:result.books[i].quantity, publication_date:result.books[i].publication_date, edition:result.books[i].edition, format:result.books[i].format, page_number:result.books[i].page_number, summary:result.books[i].summary }
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
    ajaxWriters(store) {    
            
      let listWriters = [];

      fetch("/json/writers.json")
      .then(response => response.json())
      .then(result => {
          for(let i = 0; i < result.writers.length; i++){
              let writer = { id:result.writers[i].id, image:result.writers[i].image, name:result.writers[i].name, born_at:result.writers[i].born_at, dead_at:result.writers[i].dead_at, biogrphy:result.writers[i].biography }
              listWriters.push(writer);
          }
          store.commit('ajax_writers', listWriters);
      })
    },
    ajaxOrders(store) {    
            
      let listOrders = [];

      fetch("/json/orders.json")
      .then(response => response.json())
      .then(result => {
          for(let i = 0; i < result.orders.length; i++){
              let order = { id:result.orders[i].id, creation_date:result.orders[i].creation_date, sending_date:result.orders[i].sending_date, delivery_date:result.orders[i].delivery_date, status:result.orders[i].status, number_order:result.orders[i].number_order, customer:result.orders[i].id_customer, books:result.orders[i].id_books, bill:result.orders[i].bill }
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
