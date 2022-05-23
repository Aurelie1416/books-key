<template>
    <section>
        <router-link :to="{ name: 'books-Admin'}">Passer en mode admin</router-link>
        <p>Quantité de livres dans mon panier : {{numberBooksInCart}}</p>
        <div id="list_article">
            <article  v-for="book in books" :key="book.id">
                <router-link :to="{ name: 'book', params:{bookId: book.id}}">
                <a href="#" class="book">
                    <img :src="book.image" alt="book cover">
                    <h3>{{book.title}}</h3>
                    <p>{{book.writer}}</p>
                    <p>{{book.price}}&euro;</p>
                </a>
                </router-link>
                <button v-on:click="addBookInCart(book)" class="buttonActive">
                    <div class="add_cart">
                        <i class="fas fa-cart-plus"></i>
                        <p>Ajouter Au panier</p>  
                    </div> 
                </button>
                
            </article>
        </div>
    </section>
</template>

<script>

  export default{
        name: 'list-books',
        created: function(){ 
            this.$store.dispatch('ajaxBooks');
            this.$store.dispatch('ajaxCart');
        },
        computed: {
            books(){
                let books = []
                for(const book of this.$store.state.books){
                    if (parseFloat(book.quantity) > 0){
                        books.push(book)
                    }
                }
                return books; 
            },
            cartBooks(){
                return this.$store.state.cartBooks;
            },
            numberBooksInCart(){
                let numberBooks = 0;
                for(const book of this.cartBooks){
                    numberBooks += parseFloat(book.quantity ) 
                }
                return numberBooks
            }
        },
        methods: {
            addBookInCart(book){
                this.$store.commit('addBookInCart', book)
            }
        }
    }
</script>