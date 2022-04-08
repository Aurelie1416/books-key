<template>
  <div id="creationBook">
    <section>
      <h2>Ajouter un livre</h2>
      <form
        v-on:submit.prevent="handleSubmit"
        method="post"
        enctype="multipart/form-data"
      >
        <div class="totalInput">
          <div class="input">
            <label for="title">
              <i class="fas fa-book"></i>
            </label>
            <input
              ref="title"
              placeholder="Titre"
              v-model="title"
              type="text"
              id="title"
              name="title"
              v-bind:class="[
                { inputValid: title.length > 2 },
                { inputError: title.length > 0 && title.length < 3 },
              ]"
            />
            <i v-if="title.length > 2" class="far fa-check-circle check"></i>
            <i
              v-if="title.length > 0 && title.length < 3"
              class="far fa-times-circle nocheck"
            ></i>
          </div>
          <p
            class="inputPlaceHolder"
            v-bind:class="[{ active: title.length > 0 }]"
          >
            Titre
          </p>
        </div>
        <small
          v-bind:class="[
            { inputMessageError: title.length > 0 && title.length < 3 },
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
                ref="writer"
                placeholder="Auteur"
                v-model="writer"
                type="writer"
                id="writer"
                name="writer"
                v-bind:class="[
                  { inputValid: writer.length > 2 },
                  { inputError: writer.length > 0 && writer.length < 3 },
                ]"
              />
              <i v-if="writer.length > 2" class="far fa-check-circle check"></i>
              <i
                v-if="writer.length > 0 && writer.length < 3"
                class="far fa-times-circle nocheck"
              ></i>
            </div>
            <p
              class="inputPlaceHolder"
              v-bind:class="[{ active: writer.length > 0 }]"
            >
              Auteur
            </p>
            <small
              v-bind:class="[
                { inputMessageError: writer.length > 0 && writer.length < 3 },
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
              ref="edition"
              placeholder="Maison d'édition"
              v-model="edition"
              type="text"
              id="edition"
              name="edition"
              v-bind:class="[
                { inputValid: edition.length > 2 },
                { inputError: edition.length > 0 && edition.length < 3 },
              ]"
            />
            <i v-if="edition.length > 2" class="far fa-check-circle check"></i>
            <i
              v-if="edition.length > 0 && edition.length < 3"
              class="far fa-times-circle nocheck"
            ></i>
          </div>
          <p
            class="inputPlaceHolder"
            v-bind:class="[{ active: edition.length > 0 }]"
          >
            Maison d'édition
          </p>
        </div>
        <small
          v-bind:class="[
            { inputMessageError: edition.length > 0 && edition.length < 3 },
          ]"
          >Ce champ est obligatoire</small
        >
        <div class="twoInput">
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
        <div class="totalInput">
          <div class="input">
            <label for="numberPage">
              <i class="fas fa-copy"></i>
            </label>
            <input
              ref="numberPage"
              placeholder="Nombre de page"
              v-model="number_page"
              v-on:change="NumberPageIsNumeric(number_page)"
              type="number"
              id="numberPage"
              name="numberPage"
              v-bind:class="[
                {
                  inputValid:
                    number_page > 4 &&
                    number_page_is_numeric &&
                    number_page_is_numeric != null,
                },
                {
                  inputError:
                    (number_page > 0 && number_page < 5) ||
                    (!number_page_is_numeric && number_page_is_numeric != null),
                },
              ]"
            />
            <i v-if="number_page > 4 &&
                    number_page_is_numeric &&
                    number_page_is_numeric != null" class="far fa-check-circle check"></i>
            <i
              v-if="(number_page > 0 && number_page < 5) ||
                    (!number_page_is_numeric && number_page_is_numeric != null)"
              class="far fa-times-circle nocheck"
            ></i>
            <div class="button_more_less">
                <div
                  class="more"
                  v-on:click="changeNumber('page_number', page_number, 1)"
                >
                  <p>+</p>
                </div>
                <div
                  class="less"
                  v-on:click="changeNumber('page_number', page_number, -1)"
                >
                  <p>-</p>
                </div>
              </div>
          </div>
          <p
            class="inputPlaceHolder"
            v-bind:class="[{ active: number_page > 0 }]"
          >
            Nombre de page
          </p>
        </div>
        <div>
          <small
            v-bind:class="[
              { inputMessageError: number_page > 0 && number_page < 5 },
            ]"
            >Veuillez rentrer au moins 5 pages</small
          >
        </div>
        <div>
          <small v-bind:class="[{ inputMessageError: !number_page_is_numeric && number_page_is_numeric != null}]"
            >Veuillez rentrer un chiffre valide</small
          >
        </div>

        <div class="option">
          <div class="info_supp">
            <div class="more_less">
              <div class="button_more_less">
                <div
                  class="more"
                  v-on:click="changeNumber('page_number', page_number, 1)"
                >
                  <p>+</p>
                </div>
                <div
                  class="less"
                  v-on:click="changeNumber('page_number', page_number, -1)"
                >
                  <p>-</p>
                </div>
              </div>
            </div>
            <div class="more_less">
              <label
                v-bind:class="[{ inputNeutral: !quantituNeutral }]"
                for="quantity"
                >Quantité en stock</label
              >
              <input
                pattern="[0-9]"
                v-bind:class="[
                  { isValid: quantityValid },
                  { isInvalid: !quantityValid && !quantituNeutral },
                ]"
                type="number"
                name="quantity"
                v-model="quantity"
                placeholder="quantité en stock"
                id="quantity"
              />
              <div class="button_more_less">
                <div
                  class="more"
                  v-on:click="changeNumber('quantity', quantity, 1)"
                >
                  <p>+</p>
                </div>
                <div
                  class="less"
                  v-on:click="changeNumber('quantity', quantity, -1)"
                >
                  <p>-</p>
                </div>
              </div>
            </div>

            <div class="more_less">
              <label
                v-bind:class="[{ inputNeutral: !priceNeutral }]"
                for="price"
                >Prix (en euro)</label
              >
              <input
                v-bind:class="[
                  { isValid: priceValid },
                  { isInvalid: !priceValid && !priceNeutral },
                ]"
                type="number"
                v-model="price"
                name="price"
                placeholder="Prix (en euro)"
                id="price"
              />
              <div class="button_more_less">
                <div class="more" v-on:click="changeNumber('price', price, 1)">
                  <p>+</p>
                </div>
                <div class="less" v-on:click="changeNumber('price', price, -1)">
                  <p>-</p>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="img">
          <input
            v-on:change="addImage"
            ref="upload"
            accept="image/jpeg, image/png, image/jpg"
            type="file"
            name="img"
            placeholder="Image (facultatif)"
            id="img_logo"
          />
          <div>
            <div class="img_label">
              <i class="fas fa-image"></i>
            </div>
            <div
              class="img_input"
              v-bind:class="[
                { isValid: imageValid },
                { isInvalid: !imageValid && !imageNeutral },
                { isNeutral: imageNeutral },
              ]"
            >
              <p>{{ imageName }}</p>
            </div>
            <i
              v-if="imageValid && !imageNeutral"
              v-bind:style="{ display: 'initial' }"
              class="far fa-check-circle check"
              id="check_card"
            ></i>
            <i
              v-if="!imageValid && !imageNeutral"
              v-bind:style="{ display: 'initial' }"
              class="far fa-times-circle nocheck"
              id="nocheck_card"
            ></i>
          </div>
          <div>
            <small
              v-bind:class="[
                { inputWrong: imageNeutral },
                { inputNeutral: !imageNeutral },
              ]"
              >Ce champs est obligatoire</small
            >
            <small
              v-bind:class="[
                { inputWrong: !imageValid && !imageNeutral },
                { inputNeutral: imageNeutral },
              ]"
              >Seule les images de type PNG, JPEG ou JPG sont acceptées</small
            >
          </div>
        </div>
        <textarea
          v-bind:class="[
            { isValid: summaryValid },
            { isInvalid: !summaryValid && !summaryNeutral },
            { isNeutral: summaryNeutral },
          ]"
          type="text"
          v-model="summary"
          name="summary"
          placeholder="Synopsis"
          rows="10"
        ></textarea>
        <div>
          <small
            v-bind:class="[{ inputWrong: !summaryValid && !summaryNeutral }]"
            >Ce champ est obligatoire</small
          >
        </div>
        <button
          :disabled="!formValid"
          v-bind:class="[{ button_hover: formValid }]"
        >
          Valider
        </button>
      </form>
    </section>
  </div>
</template>

<script>
export default {
  name: "creation-book",
  data: function () {
    return {
      title: "",
      writer: "",
      publication_date: null,
      edition: "",
      format: [],
      number_page: "",
      number_page_is_numeric: null,
      quantity: null,
      price: null,
      summary: null,
      image: {},
      imageName: null,
    };
  },
  methods: {
    handleSubmit(event) {
      event.preventDefault();
      const form = event.target;
      const formData = new FormData(form);

      formData.append("img", document.querySelector("#img_logo").files[0]);
      console.log("image", document.querySelector("#img_logo").files[0]);
      console.log("handlesubmit", event, event.target.action);
      console.log("image object", formData["img"]);
      console.log(
        "json",
        JSON.stringify(Object.fromEntries(formData.entries()))
      );

      fetch("/api/order", {
        method: "POST",
        headers: {
          Accept: "application/json",
          "Content-Type": "multipart/form-data",
        },
        body: JSON.stringify(Object.fromEntries(formData.entries())),
      });
    },
    NumberPageIsNumeric(value) {
      console.log("page", this.number_page_is_numeric);
      if (!isNaN(parseFloat(value)) && isFinite(parseFloat(value))) {
        this.number_page_is_numeric = true;
      } else {
        this.number_page_is_numeric = false;
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
      if (number == null) {
        number = 1;
      } else if (modificator > 0 || (modificator < 0 && parseInt(number) > 1)) {
        number = parseInt(number) + modificator;
      }
      this[attribute] = number;
    },
  },
  computed: {
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

    imageValid: function () {
      if (this.imageName != null) {
        console.log("true", this.imageName.match(/[/.](gif|jpg|jpeg|png)$/i));
        return this.imageName.match(/[/.](gif|jpg|jpeg|png)$/i);
      }
      console.log("wrong", this.imageName);
      return false;
    },
    imageNeutral: function () {
      return this.image == null;
    },
    summaryValid: function () {
      if (this.summary != null) {
        return this.summary.trim().split(/\s+/).length >= 3;
      }
      return false;
    },
    summaryNeutral: function () {
      return this.summary == null;
    },
    formValid: function () {
      return this.imageValid;
    },
    priceNeutral: function () {
      return this.price == null;
    },
    priceValid: function () {
      return this.price > 0;
    },
    pageNeutral: function () {
      return this.page_number == null;
    },
    pageValid: function () {
      return (
        this.page_number >= 5 && this.page_number.toString().match(/^[0-9]*$/)
      );
    },
    quantituNeutral: function () {
      return this.quantity == null;
    },
    quantityValid: function () {
      return this.quantity > 0 && this.quantity.toString().match(/^[0-9]*$/);
    },
  },
  watch: {},
};
</script>