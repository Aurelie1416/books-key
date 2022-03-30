<template>
    <section v-if="book">
        <h2>{{book.title}}</h2>
            <div class="book_info">
                <div class="cover">
                    <img :src="book.image" alt="book cover">
                    <div class="menu">
                        <hr>
                    </div>
                </div>
                <div class="info">
                    <p class="price">Prix : {{book.price}}&euro;</p>
                    <p>Auteur : {{book.writer}}</p>
                    <p>Publié le {{book.publication_date}}</p>
                    <p>Edition : {{book.edition}}</p>
                    <p>{{book.format}}</p>
                    <p>Nombre de page : {{book.page_number}}</p>
                </div>
                <p class="synopsis">{{book.summary}}</p>
            </div>
            
            <button class="button_hover">
                <i class="fas fa-cart-plus"></i>
                Ajouter au panier
            </button>
    </section>
</template>

<script>
import store from '../store/index'
  export default {
        name: 'my-book',
        store: store,
        data: function(){
            return{
                synopsys: true,
                info: false
            }
        },
        beforeCreate: function(){
            this.$store.dispatch('ajaxBooks');
        },
        computed: {
            book(){
                return this.$store.state.books[this.$route.params.bookId]
            }
        }
    }
</script>