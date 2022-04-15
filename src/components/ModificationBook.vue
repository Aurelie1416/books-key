<template>
  <div id="creationBook">
    <section>
      <h2>Ajouter un livre</h2>
      <form
        v-on:submit.prevent="formSubmit"
        method="post"
        enctype="multipart/form-data"
      >
        <div class="totalInput">
          <div class="input">
            <label for="title">
              <i class="fas fa-book"></i>
            </label>
            <input
            :value="book.title"
              ref="title"
              placeholder="Titre"
              type="text"
              id="title"
              name="title"
              v-bind:class="[
                { inputValid: book.title.length > 2 },
                { inputError: book.title.length > 0 && book.title.length < 3 },
              ]"
            />
            <i v-if="book.title.length > 2" class="far fa-check-circle check"></i>
            <i
              v-if="book.title.length > 0 && book.title.length < 3"
              class="far fa-times-circle nocheck"
            ></i>
          </div>
          <p
            class="inputPlaceHolder"
            v-bind:class="[{ active: book.title.length > 0 }]"
          >
            Titre
          </p>
        </div>
        <small
          v-bind:class="[
            { inputMessageError: book.title.length > 0 && book.title.length < 3 },
          ]"
          >Ce champ est obligatoire</small
        >
        <div class="twoInput">
          <div class="totalInput">
            <div class="input">
              <label for="writer">
                <i class="fas fa-pen-fancy"></i>
              </label>
              <input
              :value="book.writer"
                ref="writer"
                placeholder="Auteur"
                type="text"
                id="writer"
                name="writer"
                v-bind:class="[
                  { inputValid: book.writer.length > 2 },
                  { inputError: book.writer.length > 0 && book.writer.length < 3 },
                ]"
              />
              <i v-if="book.writer.length > 2" class="far fa-check-circle check"></i>
              <i
                v-if="book.writer.length > 0 && book.writer.length < 3"
                class="far fa-times-circle nocheck"
              ></i>
            </div>
            <p
              class="inputPlaceHolder"
              v-bind:class="[{ active: book.writer.length > 0 }]"
            >
              Auteur
            </p>
            <small
              v-bind:class="[
                { inputMessageError: book.writer.length > 0 && book.writer.length < 3 },
              ]"
              >Ce champ est obligatoire</small
            >
          </div>

          <div class="totalInput">
            <div class="input">
              <label class="labelPublish" for="publicationDate"
                >Publié le</label
              >
              <input
                type="date"
                v-bind:class="[
                  { inputValid: dateIsValid && publication_date !== null },
                  { inputInvalid: !dateIsValid && publication_date !== null },
                ]"
                v-model="publication_date"
                name="publicationDate"
                placeholder="Date de publication"
                id="publicationDate"
              />
              <i class="far fa-calendar-alt publication"></i>
              <i
                v-if="dateIsValid && publication_date !== null"
                class="far fa-check-circle check"
              ></i>
              <i
                v-if="!dateIsValid && publication_date !== null"
                class="far fa-times-circle nocheck"
              ></i>
            </div>
            <small
              v-bind:class="[
                {
                  inputMessageError: !dateIsValid && publication_date !== null,
                },
              ]"
              >Veuillez rentrer une date valide</small
            >
          </div>
        </div>
        <div class="totalInput">
          <div class="input">
            <label for="edition">
              <i class="fas fa-home"></i>
            </label>
            <input
            :value="book.edition"
              ref="edition"
              placeholder="Maison d'édition"
              type="text"
              id="edition"
              name="edition"
              v-bind:class="[
                { inputValid: book.edition.length > 2 },
                { inputError: book.edition.length > 0 && book.edition.length < 3 },
              ]"
            />
            <i v-if="book.edition.length > 2" class="far fa-check-circle check"></i>
            <i
              v-if="book.edition.length > 0 && book.edition.length < 3"
              class="far fa-times-circle nocheck"
            ></i>
          </div>
          <p
            class="inputPlaceHolder"
            v-bind:class="[{ active: book.edition.length > 0 }]"
          >
            Maison d'édition
          </p>
        </div>
        <small
          v-bind:class="[
            { inputMessageError: book.edition.length > 0 && book.edition.length < 3 },
          ]"
          >Ce champ est obligatoire</small
        >
        <div class="twoInput" id="radio">
          <div class="input">
            <label class="inputNeutral" for="big">Grand format</label>
            <input
              value="Grand format"
              v-model="format"
              type="radio"
              name="format"
              id="big"
              required
            />
          </div>
          <div class="input">
            <label class="inputNeutral" for="pocket">Format de poche</label>
            <input
              value="Format de poche"
              v-model="format"
              type="radio"
              name="format"
              id="pocket"
              required
            />
          </div>
        </div>
        <div class="threeInput">
          <div class="totalInput">
            <div class="input">
              <label for="numberPage">
                <i class="fas fa-copy iconLabel"></i>
              </label>
              <input
              :value="book.number_page"
                ref="numberPage"
                placeholder="Nombre de page"
                v-on:input="NumberPageIsNumeric(book.number_page)"
                type="number"
                id="numberPage"
                name="numberPage"
                v-bind:class="[
                  {
                    inputValid:
                      book.number_page > 4 &&
                      number_page_is_numeric &&
                      number_page_is_numeric != null,
                  },
                  {
                    inputError:
                      (number_page > 0 && number_page < 5) ||
                      (!number_page_is_numeric &&
                        number_page_is_numeric != null),
                  },
                ]"
              />
              <i
                v-if="
                  book.number_page > 4 &&
                  number_page_is_numeric &&
                  number_page_is_numeric != null
                "
                class="far fa-check-circle check"
              ></i>
              <i
                v-if="
                  (book.number_page > 0 && book.number_page < 5) ||
                  (!number_page_is_numeric && number_page_is_numeric != null)
                "
                class="far fa-times-circle nocheck"
              ></i>
              <div class="buttonMoreLess">
                <div
                  class="more"
                  v-on:click="changeNumber('number_page', book.number_page, 1)"
                >
                  <p>+</p>
                </div>
                <div
                  class="less"
                  v-on:click="changeNumber('number_page', book.number_page, -1)"
                >
                  <p>-</p>
                </div>
              </div>
            </div>
            <p
              class="inputPlaceHolder"
              v-bind:class="[{ active: book.number_page > 0 }]"
            >
              Nombre de page
            </p>
          </div>
          <div class="totalInput">
            <div class="input">
              <label for="price">
                <i class="fas fa-money-bill-wave iconLabel"></i>
              </label>
              <input
              :value="book.price"
                placeholder="Prix unitaire"
                v-on:input="PriceIsNumeric(book.price)"
                type="number"
                id="price"
                name="price"
                v-bind:class="[
                  {
                    inputValid:
                      book.price > 0 && price_is_numeric && price_is_numeric != null,
                  },
                  {
                    inputError:
                      (book.price <= 0 && book.price != null) ||
                      (!price_is_numeric && price_is_numeric != null),
                  },
                ]"
              />
              <i
                v-if="book.price > 0 && price_is_numeric && price_is_numeric != null"
                class="far fa-check-circle check"
              ></i>
              <i
                v-if="
                  (book.price <= 0 && book.price != null) ||
                  (!price_is_numeric && price_is_numeric != null)
                "
                class="far fa-times-circle nocheck"
              ></i>
              <div class="buttonMoreLess">
                <div class="more" v-on:click="changeNumber('price', book.price, 1)">
                  <p>+</p>
                </div>
                <div class="less" v-on:click="changeNumber('price', book.price, -1)">
                  <p>-</p>
                </div>
              </div>
            </div>
            <p class="inputPlaceHolder" v-bind:class="[{ active: book.price }]">
              Prix unitaire (en euros)
            </p>
          </div>
          <div class="totalInput">
            <div class="input">
              <label for="quantity">
                <i class="fas fa-copy iconLabel"></i>
              </label>
              <input
              :value="book.quantity"
                placeholder="Quantité"
                v-on:input="QuantityIsNumeric(book.quantity)"
                type="number"
                id="quantity"
                name="quantity"
                v-bind:class="[
                  {
                    inputValid:
                      book.quantity > 0 &&
                      quantity_is_numeric &&
                      quantity_is_numeric != null,
                  },
                  {
                    inputError:
                      (book.quantity <= 0 && book.quantity != null) ||
                      (!quantity_is_numeric && quantity_is_numeric != null),
                  },
                ]"
              />
              <i
                v-if="
                  book.quantity > 0 &&
                  quantity_is_numeric &&
                  quantity_is_numeric != null
                "
                class="far fa-check-circle check"
              ></i>
              <i
                v-if="
                  (book.quantity <= 0 && book.quantity != null) ||
                  (!quantity_is_numeric && quantity_is_numeric != null)
                "
                class="far fa-times-circle nocheck"
              ></i>
              <div class="buttonMoreLess">
                <div
                  class="more"
                  v-on:click="changeNumber('quantity', book.quantity, 1)"
                >
                  <p>+</p>
                </div>
                <div
                  class="less"
                  v-on:click="changeNumber('quantity', book.quantity, -1)"
                >
                  <p>-</p>
                </div>
              </div>
            </div>
            <p class="inputPlaceHolder" v-bind:class="[{ active: book.quantity }]">
              Quantité
            </p>
          </div>
        </div>
        <div class="threeInput" v-bind:style="[{ marginTop: '0' }]">
          <div>
            <div>
              <small
                v-bind:class="[
                  { inputMessageError: book.number_page > 0 && book.number_page < 5 },
                ]"
                >Veuillez rentrer au moins 5 pages</small
              >
            </div>
            <div>
              <small
                v-bind:class="[
                  {
                    inputMessageError:
                      !number_page_is_numeric && number_page_is_numeric != null,
                  },
                ]"
                >Veuillez rentrer un chiffre valide</small
              >
            </div>
          </div>
          <div>
            <div>
              <small v-bind:class="[{ inputMessageError: book.price <= 0 && book.price }]"
                >Le prix de ce livre doit être supérieur à 0</small
              >
            </div>
            <div>
              <small
                v-bind:class="[
                  {
                    inputMessageError:
                      !price_is_numeric && price_is_numeric != null,
                  },
                ]"
                >Veuillez rentrer un chiffre valide</small
              >
            </div>
          </div>
          <div>
            <div>
              <small
                v-bind:class="[
                  { inputMessageError: book.quantity <= 0 && book.quantity },
                ]"
                >La quantité de ce livre que vous voulez rentrer en stock doit
                être supérieur à 0</small
              >
            </div>
            <div>
              <small
                v-bind:class="[
                  {
                    inputMessageError:
                      !quantity_is_numeric && quantity_is_numeric != null,
                  },
                ]"
                >Veuillez rentrer un chiffre valide</small
              >
            </div>
          </div>
        </div>
        <div class="totalInput" v-bind:style="[{ marginTop: '10px' }]">
          <div class="input">
            <label for="img"><i class="fas fa-image"></i></label>
            <input
              v-on:change="addImage"
              id="img"
              ref="upload"
              accept="image/jpeg, image/png, image/jpg"
              type="file"
              name="img"
              placeholder="Première de couverture"
            />
          </div>
          <div
            class="imageInput"
            v-bind:class="[
              {
                inputValid: imageIsValid,
              },
              {
                inputError: !imageIsValid && imageName !== null,
              },
            ]"
          >
            <p>{{ imageName }}</p>
          </div>
          <p
            class="inputImagePlaceHolder"
            v-bind:class="[{ active: imageName }]"
          >
            Première de couverture
          </p>
          <i
            v-if="imageIsValid"
            class="far fa-check-circle check"
            id="check_card"
          ></i>
          <i
            v-if="!imageIsValid && imageName"
            class="far fa-times-circle nocheck"
            id="nocheck_card"
          ></i>
        </div>
        <small class="smallVisible"
          v-bind:class="[{ inputWrong: !imageIsValid && imageName }]"
          >Seule les images de type PNG, JPEG ou JPG sont acceptées</small
        >

        <textarea
          v-bind:class="[
            { inputValid: summaryIsValid },
            { inputError: !summaryIsValid && summary },
          ]"
          type="text"
          v-model="summary"
          name="summary"
          placeholder="Synopsis"
          rows="10"
        ></textarea>
        <div>
          <small
            v-bind:class="[{ inputMessageError: !summaryIsValid && summary }]"
            >Ce champ est obligatoire</small
          >
        </div>
        <button
          :disabled="!formIsValid"
          v-bind:class="[{ buttonActive: formIsValid }]"
        >
          Valider
        </button>
      </form>
    </section>
  </div>
</template>

<script>
export default {
  name: "modification-book",
  data: function () {
    return {
      // title: "",
      // writer: "",
      publication_date: null,
      // edition: "",
      format: [],
      // number_page: null,
      number_page_is_numeric: null,
      // quantity: null,
      quantity_is_numeric: null,
      // price: null,
      price_is_numeric: null,
      summary: null,
      image: {},
      imageName: null,
    };
  },
  beforeCreate: function () {
    this.$store.dispatch("ajaxBooks");
  },
  methods: {
    formSubmit(event) {
      event.preventDefault();
      const form = event.target;
      const formData = new FormData(form);

      formData.append("image", document.querySelector("#img").files[0]);
      console.log("image", document.querySelector("#img").files[0]);
      console.log("handlesubmit", event, event.target.action);
      console.log("image object", formData["image"]);
      console.log(
        "json",
        JSON.stringify(Object.fromEntries(formData.entries()))
      );

      fetch("/api/order", {
        method: "POST",
        enctype: "multipart/form-data",
        headers: {
          Accept: "application/json",
          enctype: "multipart/form-data",
        },
        body: JSON.stringify(Object.fromEntries(formData.entries())),
      });
    },
    NumberPageIsNumeric(value) {
      if (!isNaN(parseFloat(value)) && isFinite(parseFloat(value))) {
        this.number_page_is_numeric = true;
      } else {
        this.number_page_is_numeric = false;
      }
    },
    PriceIsNumeric(value) {
      if (!isNaN(parseFloat(value))) {
        this.price_is_numeric = true;
      } else {
        this.price_is_numeric = false;
      }
    },
    QuantityIsNumeric(value) {
      if (!isNaN(parseFloat(value)) && isFinite(parseFloat(value))) {
        this.quantity_is_numeric = true;
      } else {
        this.quantity_is_numeric = false;
      }
    },
    addImage(event) {
      console.log(event.target.files, event.target.files[0].name);
      try {
        this.imageName = event.target.files[0].name;
      } catch (error) {
        console.error(error);
      }
    },
    changeNumber(attribute, number, modificator) {
      if (number == null || number == "") {
        number = 1;
      } else if (modificator > 0 || (modificator < 0 && parseInt(number) > 1)) {
        number = parseInt(number) + modificator;
      }
      this[attribute] = number;
    },
  },
  computed: {
    book: function(){
      let book = {}
      for(const book_individual of this.$store.state.books){
        if(book_individual.id == this.$route.params.bookId){
          book = book_individual
        }
      }
      return book;
    },
    dateIsValid: function () {
      if (this.publication_date != null) {
        return (
          new Date(this.publication_date) !== "Invalid Date" &&
          !isNaN(new Date(this.publication_date))
        );
      } else {
        return false;
      }
    },

    imageIsValid: function () {
      if (this.imageName != null) {
        return this.imageName.match(/[/.](gif|jpg|jpeg|png)$/i);
      }
      return false;
    },
    summaryIsValid: function () {
      if (this.summary != null) {
        return this.summary.trim().split(/\s+/).length >= 3;
      }
      return false;
    },
    formIsValid: function () {
      return (
        // this.book.title.length > 2 &&
        // this.book.writer.length > 2 &&
        // this.dateIsValid &&
        // this.publication_date !== null &&
        // this.book.edition.length > 2 &&
        // this.format &&
        // this.book.number_page > 4 &&
        // this.number_page_is_numeric &&
        // this.number_page_is_numeric != null &&
        // this.book.price > 0 &&
        // this.price_is_numeric &&
        // this.price_is_numeric != null &&
        // this.book.quantity > 0 &&
        // this.quantity_is_numeric &&
        // this.quantity_is_numeric != null &&
        // this.imageIsValid &&
        this.summaryIsValid
      )
    }
  },
};
</script>