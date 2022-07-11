<template>
  <div id="inscription">
    <h2>Ajout d'une maison d'édition</h2>
    <form
      v-on:submit.prevent="formSubmit"
      method="post"
      enctype="multipart/form-data"
    >
      <div class="totalInput">
        <div class="input">
          <label for="name">
            <i class="fas fa-home"></i>
          </label>
          <input
            ref="name"
            placeholder="Nom"
            v-model="name"
            type="text"
            id="name"
            name="name"
            v-bind:class="[
              { inputValid: nameIsValid },
              { inputError: name.length > 0 && !nameIsValid },
            ]"
          />
          <i v-if="nameIsValid" class="far fa-check-circle check"></i>
          <i
            v-if="name.length > 0 && !nameIsValid"
            class="far fa-times-circle nocheck"
          ></i>
        </div>
        <p
          class="inputPlaceHolder"
          v-bind:class="[{ active: name.length > 0 }]"
        >
          Nom
        </p>
        <small
          v-bind:class="[
            { inputMessageError: name.length > 0 && !nameIsValid },
          ]"
          >Veuillez rentrer un nom valide</small
        >
      </div>
      <div class="totalInput">
        <div class="input">
          <label for="email">
            <i class="fas fa-at"></i>
          </label>
          <input
            ref="email"
            placeholder="Email"
            v-model="email"
            type="email"
            id="email"
            name="email"
            v-bind:class="[
              { inputValid: emailIsValid && email.length > 0 },
              { inputError: !emailIsValid && email.length > 0 },
            ]"
          />
          <i
            v-if="emailIsValid && email.length > 0"
            class="far fa-check-circle check"
          ></i>
          <i
            v-if="!emailIsValid && email.length > 0"
            class="far fa-times-circle nocheck"
          ></i>
        </div>
        <p
          class="inputPlaceHolder"
          v-bind:class="[{ active: email.length > 0 }]"
        >
          Email
        </p>
      </div>
      <small
        v-bind:class="[
          { inputMessageError: !emailIsValid && email.length > 0 },
        ]"
        >Veuillez rentrer une adresse mail valide</small
      >
      <div class="totalInput">
        <div class="input">
          <label for="phone">
            <i class="fas fa-phone-alt"></i>
          </label>
          <input
            ref="phone"
            placeholder="Téléphone"
            v-model="phone"
            type="text"
            id="phone"
            name="phone"
            v-bind:class="[
              { inputValid: phoneIsValid },
              { inputError: phone.length > 0 && !phoneIsValid },
            ]"
          />
          <i v-if="phoneIsValid" class="far fa-check-circle check"></i>
          <i
            v-if="phone.length > 0 && !phoneIsValid"
            class="far fa-times-circle nocheck"
          ></i>
        </div>
        <p
          class="inputPlaceHolder"
          v-bind:class="[{ active: phone.length > 0 }]"
        >
          Téléphone
        </p>
      </div>
      <small
        v-bind:class="[
          { inputMessageError: phone.length > 0 && !phoneIsValid },
        ]"
        >Veuillez rentrer un numéro de téléphone valide</small
      >
      <div class="totalInput">
        <div class="input">
          <label class="creationDate" for="publicationDate">Fondée le</label>
          <date-picker
            type="date"
            v-model="creation_date"
            valueType="format"
            v-bind:class="[
              { inputDateValid: dateIsValid && creation_date !== null },
              {
                inputDateInvalid: !dateIsValid && creation_date !== null
              },
            ]"
            name="creationDate"
            placeholder="Date de création"
            id="creationDate"
            :language="lang"
            typeable="true"
            format="DD/MM/YYYY"
          ></date-picker>
          <i
            v-if="dateIsValid && creation_date !== null"
            class="far fa-check-circle checkDate"
          ></i>
          <i
            v-if="!dateIsValid && creation_date !== null"
            class="far fa-times-circle nocheckDate"
          ></i>
        </div>
        <small
          v-bind:class="[
            {
              inputMessageError: !dateIsValid && creation_date !== null,
            },
          ]"
          >Veuillez rentrer une date valide</small
        >
      </div>
      <div class="totalInput" id="inputFile" v-bind:style="[{ margin: '10px auto 0 auto' }]">
        <div class="input">
          <label for="image"><i class="fas fa-image"></i></label>
          <input
            v-on:change="addImage"
            id="image"
            ref="upload"
            accept="image/jpeg, image/png, image/jpg"
            type="file"
            name="image"
            placeholder="Logo"
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
        <p class="inputImagePlaceHolder" v-bind:class="[{ active: imageName }]">
          Logo
        </p>
        <i
          v-if="imageIsValid"
          class="far fa-check-circle check"
          id="check_card"
        ></i>
        <i v-if="imageIsValid" class="fas fa-times-circle deleteImage" v-on:click="deleteImage"></i>
        <i
          v-if="!imageIsValid && imageName"
          class="far fa-times-circle nocheck"
          id="nocheck_card"
        ></i>
      </div>
      <div>
        <small
          class="smallVisible"
          v-bind:class="[{ inputWrong: !imageIsValid && imageName }]"
          >Seule les images de type PNG, JPEG ou JPG sont acceptées (taille max : 1Mo)</small
        >
      </div>
      <textarea
          v-bind:class="[
            { inputValid: presentationIsValid },
            { inputError: !presentationIsValid && presentation },
          ]"
          type="text"
          v-model="presentation"
          name="presentation"
          placeholder="Présentation"
          rows="10"
        ></textarea>
        <div>
          <small
            v-bind:class="[{ inputMessageError: !presentationIsValid && presentation }]"
            >Ce champ est obligatoire</small
          >
        </div>
      <button
        :disabled="!formIsValid"
        v-bind:class="[{ buttonActive: formIsValid }]"
      >
        Je valide
      </button>
    </form>
  </div>
</template>

<script>
import DatePicker from "vue2-datepicker";
import "vue2-datepicker/index.css";
import "vue2-datepicker/locale/fr";
export default {
  name: "creation-customer",
  components: { DatePicker },
  data: function () {
    return {
      email: "",
      name: "",
      emailIsValid: null,
      phone: "",
      image: {},
      imageName: null,
      presentation: null,
      creation_date: null,
      lang: {
        formatLocale: {
          firstDayOfWeek: 1,
        },
      },
    };
  },
  methods: {
    formSubmit(event) {
      event.preventDefault();
      const form = event.target;
      const formData = new FormData(form);

      formData.append(
        "img",
        document.querySelector("#image").files[0],
        document.querySelector("#image").files[0].name
      );
      console.log("image", document.querySelector("#image").files[0]);
      console.log("handlesubmit", event, event.target.action);
      console.log("image object", document.querySelector("#image").files[0].name);
      console.log(
        "json",
        JSON.stringify(Object.fromEntries(formData.entries()))
      );

      fetch("/api/order", {
        method: "POST",
        enctype: "multipart/form-data",
        body: JSON.stringify(Object.fromEntries(formData.entries())),
      });
    },
    addImage(event) {
      console.log(event.target.files, event.target.files[0].name);
      try {
        this.imageName = event.target.files[0].name;
      } catch (error) {
        console.error(error);
      }
    },
    deleteImage(){
      this.imageName = null;
    }
  },
  computed: {
    presentationIsValid: function () {
      if (this.presentation != null) {
        return this.presentation.trim().split(/\s+/).length >= 3;
      }
      return false;
    },
    dateIsValid: function () {
      if (this.creation_date != null) {
        var date_components = this.creation_date.split("/");
        var day = date_components[0];
        var month = date_components[1];
        var year = date_components[2];
        console.log(new Date(year, month - 1, day) && new Date(year, month - 1, day) <= new Date())
        return (
          new Date(year, month - 1, day) !== "Invalid Date" && new Date(year, month - 1, day) && new Date(year, month - 1, day) <= new Date()
        );
      } else {
        return false;
      }
    },
    phoneIsValid() {
      if (
        this.phone.match(/^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s./0-9]*$/) &&
        this.phone.length <= 15
      ) {
        return true;
      }
      return false;
    },
    nameIsValid() {
      if (
        this.name.length > 1 &&
        this.name.match(
          /^[A-Za-záàâäãåçéèêëíìîïñóòôöõúùûüýÿæœÁÀÂÄÃÅÇÉÈÊËÍÌÎÏÑÓÒÔÖÕÚÙÛÜÝŸÆŒ][-,a-záàâäãåçéèêëíìîïñóòôöõúùûüýÿæœÁÀÂÄÃÅÇÉÈÊËÍÌÎÏÑÓÒÔÖÕÚÙÛÜÝŸÆŒ. ']+[ ]*$/
        )
      ) {
        return true;
      } else {
        return false;
      }
    },
    imageIsValid() {
      if (this.imageName != null) {
        return this.imageName.match(/[/.](gif|jpg|jpeg|png)$/i);
      }
      return false;
    },
    formIsValid: function () {
      return (
        this.nameIsValid &&
        this.emailIsValid &&
        this.email.length > 0 &&
        this.phoneIsValid &&
        (this.imageIsValid || this.imageName == null),
        this.presentationIsValid
      );
    },
  },
  watch: {
    email: function () {
      if (!this.$refs.email.validity.typeMismatch) {
        this.emailIsValid = true;
      } else {
        this.emailIsValid = false;
      }
    },
  },
};
</script>