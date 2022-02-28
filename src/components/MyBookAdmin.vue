<template>
    <section>
        <h2 v-on:click="changeSynopsis">Bilbo le Hobbit</h2>
            <div class="book_info">
                <div class="cover">
                    <img :src="image" alt="book cover">
                    <div class="menu">
                        <h3 v-on:click="changeSynopsis" class="menu_synopsis">synopsis</h3>
                        <h3 v-on:click="changeInfo" class="menu_info">Information</h3>
                        <hr>
                    </div>
                </div>
                <div class="info" v-if="!versionMobil || info">
                    <p class="price">Prix : {{price}}&euro;</p>
                    <p>Auteur : {{writer}}</p>
                    <p>Publié le {{publication}}</p>
                    <p>Edition : {{edition}}</p>
                    <p>{{format}}</p>
                    <p>Nombre de page : {{page}}</p>
                </div>
                <p class="synopsis" v-if="!versionMobil || synopsis">{{summary}}</p>
            </div>
            
            <button class="button_hover">
                <router-link :to="{ name: 'modification-Article', params:{bookId: this.$route.params.bookId}}">
                    Modifier le livre
                </router-link>
            </button>
    </section>
</template>

<script>
import store from '../store/index'
  export default {
        name: 'my-book-admin',
        store: store,
        data: function(){
            return{
                title: this.$store.state.books[this.$route.params.bookId].title,
                writer: this.$store.state.books[this.$route.params.bookId].writer,
                publication: this.$store.state.books[this.$route.params.bookId].publication_date,
                edition: this.$store.state.books[this.$route.params.bookId].edition,
                format: [this.$store.state.books[this.$route.params.bookId].format],
                page: this.$store.state.books[this.$route.params.bookId].page_number,
                quantity: this.$store.state.books[this.$route.params.bookId].quantity,
                price: this.$store.state.books[this.$route.params.bookId].price,
                summary: this.$store.state.books[this.$route.params.bookId].summary,
                image: this.$store.state.books[this.$route.params.bookId].image,
                synopsys: true,
                info: false
            }
        },
        created: function(){
            this.$store.dispatch('ajaxBooks');
        },
        computed: {
            versionMobil: function(){
                return ""
            }
        },
        methods: {
            changeSynopsis(){
                console.log("menu", document.querySelector(".menu"))
                if (this.versionMobil){
                    this.synopsys = true
                    this.info = false
                }
            },
            changeInfo(){
                if (this.versionMobil){
                    this.synopsys = false
                    this.info = true
                }
            }
        }
    }
</script>