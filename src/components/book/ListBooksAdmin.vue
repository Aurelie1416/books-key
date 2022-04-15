<template>
  <section>
    <table cellspacing="0">
      <caption>
        Liste des livres
      </caption>
      <thead>
        <tr>
          <th></th>
          <th>Titre</th>
          <th>Auteur</th>
          <th>Prix (unitaire)</th>
          <th>Quantité en stock</th>
          <th>Modifier</th>
          <th>Supprimer</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="book in books" :key="book.id">
          <td>
            <router-link
              :to="{ name: 'book-Admin', params: { bookId: book.id } }"
            >
              <div class="link">
                <a href="#"><img :src="book.image" alt="cover" /></a>
              </div>
            </router-link>
          </td>
          <td data-label="Titre">
            <router-link
              :to="{ name: 'book-Admin', params: { bookId: book.id } }"
            >
              <div>{{ book.title }}</div>
            </router-link>
          </td>
          <td data-label="Auteur">
            <div>{{ book.writer }}</div>
          </td>
          <td data-label="Prix (unitaire)">
            <div>{{ book.price }}&euro;</div>
          </td>
          <td data-label="Quantité (en stock)">
            <div>{{ book.quantity }}</div>
          </td>
          <td data-label="Modifier">
            <router-link
              :to="{
                name: 'modification-Article',
                params: { bookId: book.id },
              }"
            >
              <i class="fas fa-edit"></i>
            </router-link>
          </td>
          <td data-label="Supprimer">
            <div class="delete" v-on:click="deleteBook(book)">
              <i class="fas fa-times"></i>
            </div>
          </td>
        </tr>
      </tbody>
    </table>
  </section>
</template>

<script>

export default {
  name: "list-books-admin",
  beforeCreate: function () {
    this.$store.dispatch("ajaxBooks");
  },
  computed: {
    books() {
      return this.$store.state.books;
    },
  },
  methods: {
    deleteBook(book) {
      this.$store.commit("deleteBook", book);
    },
  },
};
</script>