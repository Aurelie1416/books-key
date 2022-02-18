<template>
    <section>
        <div id="list_article">
            <article  v-for="book in books" :key="book.id">
                <router-link :to="{ name: 'book', params:{bookId: book.id}}">
                <a href="#" class="book">
                    <img :src="book.image" alt="book cover">
                    <h3>{{book.title}}</h3>
                    <p>{{book.writer}}</p>
                    <p>{{book.price}}&euro;</p>
                </a>
                <button class="button_hover">
                    <div class="add_cart">
                        <i class="fas fa-cart-plus"></i>
                        <p>Ajouter Au panier</p>  
                    </div> 
                </button>
                </router-link>
            </article>
        </div>
    </section>
</template>

<script>

  export default{
        name: 'my-section',
        data: function(){
            return{
                books: []
            }
        },
        beforeCreate: function(){
        fetch("json/cart.json")
            .then(response => response.json())
            .then(result => {
                for(let i = 0; i < result.books.length; i++){
                    let book = { id:result.books[i].id, image:result.books[i].image, title:result.books[i].title, writer:result.books[i].writer, price:result.books[i].price }
                    this.books.push(book);  
                }
            });
        },
        method: {
            changeUrl(idBook){
                this.$router.push({path:'/book', params:{bookId: idBook}})
            }
        }
    }
</script>