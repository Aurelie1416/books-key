<template>
  <div id="addToCart">
    <div class="menu_select">
      <label>Sélectionez un livre</label>
      <div class="boxOption">
        <input type="text" />
        <div class="boxArrow">
          <i class="fas fa-sort-down arrow" v-on:click="showMenuOption"></i>
        </div>
        <div class="list">
          <div v-bind:style="{position: 'relative'}">
            <div
              v-for="book in books"
              :key="book.id"
              class="option_menu"
              v-bind:style="{ display: 'flex' }"
            >
              <input
                v-bind:value="book.id"
                v-model="checkedBooks"
                type="checkbox"
                name="status"
                id="status"
              />
              <p v-if="book.serial" v-bind:style="{ margin: '7px' }">
                {{ book.serial }}
              </p>
              <p v-if="book.volume" v-bind:style="{ margin: '7px' }">
                tome {{ book.volume }}
              </p>
              <p v-bind:style="{ margin: '7px' }">
                {{ book.title }}
              </p>
              <p v-bind:style="{ margin: '7px' }">({{ book.format }})</p>
              <strong v-bind:style="{ margin: '7px' }">
                {{ book.price }}&euro;
              </strong>
            </div>
          </div>
        </div>
      </div>
    </div>
    <button v-on:click="addBookInCart(checkedBooks)">Ajouter aux panier</button>
  </div>
</template>
<script>
export default {
  name: "add-book",
  data: function () {
    return {
      checkedBooks: [],
    };
  },
  created: function () {
    this.$store.dispatch("ajaxBooks");
    this.$store.dispatch("ajaxCart");
  },
  computed: {
    books() {
      let books = [];
      for (const book of this.$store.state.books) {
        if (parseFloat(book.quantity) > 0) {
          books.push(book);
        }
      }
      return books;
    },
    cartBooks() {
      return this.$store.state.cartBooks;
    },
  },
  methods: {
    addBookInCart(checkedBooks) {
      for (const checkedBook of checkedBooks) {
        for (const book of this.books) {
          if (book.id == checkedBook) {
            this.$store.commit("addBookInCart", book);
          }
        }
      }
    },
    showMenuOption() {
      this.$store.commit("showMenuOption");
    },
  },
};
</script>