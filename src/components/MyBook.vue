<template>
    <section v-if="book != null">
        <h2>Bilbo le Hobbit</h2>
            <div class="book_info">
                <div class="cover">
                    <img :src="book.image" alt="book cover">
                    <div class="menu">
                        <h3 class="menu_synopsis">synopsis</h3>
                        <h3 class="menu_info">Information</h3>
                        <hr>
                    </div>
                </div>
                <div class="info">
                    <p class="price">Prix : {{book.price}}&euro;</p>
                    <p>Auteur : {{book.writer}}</p>
                    <p>Publié le {{book.publication}}</p>
                    <p>Edition : {{book.edidion}}</p>
                    <p>{{book.format}}</p>
                    <p>Nombre de page : {{book.page}}</p>
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
  
  export default {
        name: 'my-book',
        data: function(){
            return{
                book: null,
            }
        },
        beforeCreate: function(){
        fetch("/json/cart.json")
        .then(response => response.json())
        .then(result => {
            this.book = {image:result.books[0].image, title:result.books[0].title, writer:result.books[0].writer, price:result.books[0].price, publication:result.books[0].publication_date, edidion:result.books[0].edition, page:result.books[0].page_number, format:result.books[0].format, summary:result.books[0].summary };
        });
        }
    }
</script>