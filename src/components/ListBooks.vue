<template>
    <section>
        <router-link :to="{ name: 'books-Admin'}">Passer en mode admin</router-link>
        <div id="list_article">
            <article  v-for="book in this.$store.state.books" :key="book.id">
                <router-link :to="{ name: 'book', params:{bookId: book.id}}">
                <a href="#" class="book">
                    <img :src="book.image" alt="book cover">
                    <h3>{{book.title}}</h3>
                    <p>{{book.writer}}</p>
                    <p>{{book.price}}&euro;</p>
                </a>
                </router-link>
                <button v-on:click="numberBook++" class="button_hover">
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
        },
        computed: {
            books(){
                return this.$store.state.books;
            }
        }
    }
</script>