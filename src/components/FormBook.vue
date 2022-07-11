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
                type="text"
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
              <date-picker
                :disabledDates="disabledDates" 
                type="date"
                v-model="publication_date"
                valueType="format"
                v-bind:class="[
                  { inputDateValid: dateIsValid && publication_date !== null },
                  {
                    inputDateInvalid: !dateIsValid && publication_date !== null,
                  },
                ]"
                name="publicationDate"
                placeholder="Date de publication"
                id="publicationDate"
                :language="lang"
                typeable="true"
                format="DD/MM/YYYY"
              ></date-picker>
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
                ref="numberPage"
                placeholder="Nombre de page"
                v-model="number_page"
                v-on:input="NumberPageIsNumeric(number_page)"
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
                      (!number_page_is_numeric &&
                        number_page_is_numeric != null),
                  },
                ]"
              />
              <i
                v-if="
                  number_page > 4 &&
                  number_page_is_numeric &&
                  number_page_is_numeric != null
                "
                class="far fa-check-circle check"
              ></i>
              <i
                v-if="
                  (number_page > 0 && number_page < 5) ||
                  (!number_page_is_numeric && number_page_is_numeric != null)
                "
                class="far fa-times-circle nocheck"
              ></i>
              <div class="buttonMoreLess">
                <div
                  class="more"
                  v-on:click="changeNumber('number_page', number_page, 1)"
                >
                  <p>+</p>
                </div>
                <div
                  class="less"
                  v-on:click="changeNumber('number_page', number_page, -1)"
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
          <div class="totalInput">
            <div class="input">
              <label for="price">
                <i class="fas fa-money-bill-wave iconLabel"></i>
              </label>
              <input
                placeholder="Prix unitaire"
                v-model="price"
                v-on:input="PriceIsNumeric(price)"
                type="number"
                id="price"
                name="price"
                v-bind:class="[
                  {
                    inputValid:
                      price > 0 && price_is_numeric && price_is_numeric != null,
                  },
                  {
                    inputError:
                      (price <= 0 && price != null) ||
                      (!price_is_numeric && price_is_numeric != null),
                  },
                ]"
              />
              <i
                v-if="price > 0 && price_is_numeric && price_is_numeric != null"
                class="far fa-check-circle check"
              ></i>
              <i
                v-if="
                  (price <= 0 && price != null) ||
                  (!price_is_numeric && price_is_numeric != null)
                "
                class="far fa-times-circle nocheck"
              ></i>
              <div class="buttonMoreLess">
                <div class="more" v-on:click="changeNumber('price', price, 1)">
                  <p>+</p>
                </div>
                <div class="less" v-on:click="changeNumber('price', price, -1)">
                  <p>-</p>
                </div>
              </div>
            </div>
            <p class="inputPlaceHolder" v-bind:class="[{ active: price }]">
              Prix unitaire (en euros)
            </p>
          </div>
          <div class="totalInput">
            <div class="input">
              <label for="quantity">
                <i class="fas fa-copy iconLabel"></i>
              </label>
              <input
                placeholder="Quantité"
                v-model="quantity"
                v-on:input="QuantityIsNumeric(quantity)"
                type="number"
                id="quantity"
                name="quantity"
                v-bind:class="[
                  {
                    inputValid:
                      quantity > 0 &&
                      quantity_is_numeric &&
                      quantity_is_numeric != null,
                  },
                  {
                    inputError:
                      (quantity <= 0 && quantity != null) ||
                      (!quantity_is_numeric && quantity_is_numeric != null),
                  },
                ]"
              />
              <i
                v-if="
                  quantity > 0 &&
                  quantity_is_numeric &&
                  quantity_is_numeric != null
                "
                class="far fa-check-circle check"
              ></i>
              <i
                v-if="
                  (quantity <= 0 && quantity != null) ||
                  (!quantity_is_numeric && quantity_is_numeric != null)
                "
                class="far fa-times-circle nocheck"
              ></i>
              <div class="buttonMoreLess">
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
            <p class="inputPlaceHolder" v-bind:class="[{ active: quantity }]">
              Quantité
            </p>
          </div>
        </div>
        <div class="threeInput" v-bind:style="[{ marginTop: '0' }]">
          <div>
            <div>
              <small
                v-bind:class="[
                  { inputMessageError: number_page > 0 && number_page < 5 },
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
              <small v-bind:class="[{ inputMessageError: price <= 0 && price }]"
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
                  { inputMessageError: quantity <= 0 && quantity },
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
        <small
          class="smallVisible"
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
import DatePicker from "vue2-datepicker";
import "vue2-datepicker/index.css";
import "vue2-datepicker/locale/fr";
export default {
  name: "form-book",
  components: { DatePicker },
  data: function () {
    return {
      title: "",
      writer: "",
      publication_date: null,
      edition: "",
      format: [],
      number_page: null,
      number_page_is_numeric: null,
      quantity: null,
      quantity_is_numeric: null,
      price: null,
      price_is_numeric: null,
      summary: null,
      image: {},
      imageName: null,
      lang: {
        formatLocale: {
          firstDayOfWeek: 1,
        },
      },
      disabledDates: ['2022-02-03', '2022-02-04']
    };
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
    //  disablePastDates(val) {
    //    return val >= new Date()
    // },
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
    dateIsValid: function () {
      if (this.publication_date != null) {
        var date_components = this.publication_date.split("/");
        var day = date_components[0];
        var month = date_components[1];
        var year = date_components[2];
        return (
          new Date(year, month - 1, day) !== "Invalid Date" &&
          !isNaN(new Date(year, month - 1, day))
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
        this.title.length > 2 &&
        this.writer.length > 2 &&
        this.dateIsValid &&
        this.publication_date !== null &&
        this.edition.length > 2 &&
        this.format &&
        this.number_page > 4 &&
        this.number_page_is_numeric &&
        this.number_page_is_numeric != null &&
        this.price > 0 &&
        this.price_is_numeric &&
        this.price_is_numeric != null &&
        this.quantity > 0 &&
        this.quantity_is_numeric &&
        this.quantity_is_numeric != null &&
        this.imageIsValid &&
        this.summaryIsValid
      );
    },
  },
};
</script>