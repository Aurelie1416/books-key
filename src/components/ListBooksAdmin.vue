<template>
    <section>
        <table cellspacing="0">
                <caption>Liste des livres</caption>
                <thead>
                    <tr>
                        <th v-for="column in columns" :key="column">
                        {{ column }}
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="book in books" :key="book.id" >
                        <td>
                            <router-link :to="{ name: 'book', params:{bookId: book.id}}">
                                <div class="link">
                                    <a href="#"><img :src="book.image" alt="cover"></a>
                                </div>
                            </router-link>
                        </td>
                        <td data-label="Titre">
                            <router-link :to="{ name: 'book', params:{bookId: book.id}}">
                                <div>{{book.title}}</div>
                            </router-link>
                        </td>
                        <td data-label="Auteur">
                            <div>{{book.writer}}</div>
                        </td>
                        <td data-label="Prix">
                            <div>{{book.price}}&euro;</div>
                        </td>
                        <td data-label="Modifier">
                            <router-link :to="{ name: 'modification-Article', params:{bookId: book.id}}">
                                <i class="fas fa-edit"></i>
                            </router-link>
                        </td>
                        <td data-label="Supprimer"><div class="delete" v-on:click="deleteBook(book)"><i class="fas fa-times"></i></div></td>
                    </tr>
                </tbody>
            </table>
    </section>
</template>

<script>
  import store from '../store/index'

  export default{
        name: 'list-books-admin',
        store: store,
        data: function(){
            return{
                books: this.$store.state.books,
                numberBook: 0,
                columns: this.$store.state.columnBook
            }
        },
        created: function(){
        this.$store.dispatch('ajaxBooks');
        },
        methods: {
          deleteBook(book) {
              this.books.splice(this.books.indexOf(book), 1);
          },
        }
    }
</script>