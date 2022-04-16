<template>
  <section>
    <h3>Livres commandés</h3>
    <div id="list_article">
      <div id="list_article">
        <article v-for="book in books" :key="book.id">
          <router-link :to="{ name: 'book', params: { bookId: book.id } }">
            <a href="#" class="book">
              <img :src="book.image" alt="book cover" />
              <h3>{{ book.title }}</h3>
              <p>{{ book.writer }}</p>
              <p>{{ book.price }}&euro;</p>
            </a>
          </router-link>
        </article>
      </div>
    </div>
  </section>
</template>

<script>

export default {
  name: "list-books-by-order",
  props: {
    order: Object,
  },
  beforeCreate: function () {
    this.$store.dispatch("ajaxBooks");
  },
  computed: {
    books() {
      let books = [];
      for (const book of this.$store.state.books) {
        if (this.order.books.includes(book.id)) {
          books.push(book);
        }
      }
      return books;
    },
  },
};
</script>