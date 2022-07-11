<template>
  <div id="inscription">
    <form
      v-on:submit.prevent="formSubmit"
      method="post"
      enctype="multipart/form-data"
    >
      <div class="totalInput">
        <div class="input">
          <label for="name">
            <i class="fas fa-pen-fancy"></i>
          </label>
          <input
            ref="name"
            placeholder="Nom"
            v-model="name"
            type="text"
            id="name"
            name="name"
            v-bind:class="[
              { inputValid: name.length >= 2 },
              { inputError: name.length < 2 && name.length > 0 },
            ]"
          />
          <i v-if="name.length > 2" class="far fa-check-circle check"></i>
          <i
            v-if="name.length < 2 && name.length > 0"
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
            {
              inputMessageError: name.length < 2 && name.length > 0,
            },
          ]"
          >Veuillez rentrer un nom valide</small
        >
      </div>
      <div class="twoInput">
        <div class="totalInput">
          <div class="input">
            <label class="creationDate" for="birthate">Né le</label>
            <date-picker
              type="date"
              v-model="birthday"
              valueType="format"
              v-bind:class="[
                { inputDateValid: dateIsValid(birthday) && birthday !== null },
                {
                  inputDateInvalid: !dateIsValid(birthday) && birthday !== null,
                },
              ]"
              v-bind:style="[{ marginRight: '2%' }]"
              name="birthday"
              placeholder="Né le"
              id="birthday"
              :language="lang"
              typeable="true"
              format="DD/MM/YYYY"
            ></date-picker>
            <i
              v-if="dateIsValid(birthday) && birthday !== null"
              class="far fa-check-circle checkDate"
            ></i>
            <i
              v-if="!dateIsValid(birthday) && birthday !== null"
              class="far fa-times-circle nocheckDate"
            ></i>
          </div>
          <small
            v-bind:class="[
              {
                inputMessageError: !dateIsValid(birthday) && birthday !== null,
              },
            ]"
            >Veuillez rentrer une date valide</small
          >
        </div>
        <div class="totalInput">
          <div class="input">
            <label class="creationDate" for="deathday">Fin le</label>
            <date-picker
              type="date"
              v-model="deathday"
              valueType="format"
              v-bind:class="[
                {
                  inputDateValid:
                    dateIsValid(deathday) && deathday !== null && logicDate,
                },
                {
                  inputDateInvalid:
                    (!dateIsValid(deathday) && deathday !== null) ||
                    (!logicDate && deathday !== null) ||
                    (deathday !== null && birthday == null),
                },
              ]"
              v-bind:style="[{ marginRight: '2%' }]"
              name="deathday"
              placeholder="Fin le"
              id="groupCreationDate"
              :language="lang"
              typeable="true"
              format="DD/MM/YYYY"
            ></date-picker>
            <i
              v-if="dateIsValid(deathday) && deathday !== null && logicDate"
              class="far fa-check-circle checkDate"
            ></i>
            <i
              v-if="
                (!dateIsValid(deathday) && deathday !== null) ||
                (!logicDate && deathday !== null) ||
                (deathday !== null && birthday == null)
              "
              class="far fa-times-circle nocheckDate"
            ></i>
          </div>
          <small
            v-bind:class="[
              {
                inputMessageError: !dateIsValid(deathday) && deathday !== null,
              },
            ]"
            >Veuillez rentrer une date valide</small
          >
          <br /><small
            v-bind:class="[
              {
                inputMessageError:
                  (!logicDate && deathday !== null) ||
                  (deathday !== null && birthday == null),
              },
            ]"
            >Il n'est pas dans la nature humaine de mourir avant de
            naitre</small
          >
        </div>
      </div>

      <div
        class="totalInput"
        id="inputFile"
        v-bind:style="[{ marginTop: '10px' }]"
      >
        <div class="input">
          <label for="img"><i class="fas fa-image"></i></label>
          <input
            v-on:change="addImage"
            id="img"
            ref="upload"
            accept="image/jpeg, image/png, image/jpg"
            type="file"
            name="img"
            placeholder="Image (facultatif)"
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
          Image (facultatif)
        </p>
        <i
          v-if="imageIsValid"
          class="far fa-check-circle check"
          id="check_card"
        ></i>
        <i
          v-if="imageIsValid"
          class="fas fa-times-circle deleteImage"
          v-on:click="deleteImage"
        ></i>
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
          >Seule les images de type PNG, JPEG ou JPG sont acceptées (taille max
          : 1Mo)</small
        >
      </div>
      <textarea
        v-bind:class="[
          { inputValid: biographyIsValid },
          { inputError: !biographyIsValid && biography },
        ]"
        type="text"
        v-model="biography"
        name="biography"
        placeholder="Synopsis"
        rows="10"
      ></textarea>
      <div>
        <small
          v-bind:class="[{ inputMessageError: !biographyIsValid && biography }]"
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
  beforeCreate: function () {
    this.$store.dispatch("ajaxWriters");
  },
  data: function () {
    return {
      name: "",
      birthday: null,
      deathday: null,
      lang: {
        formatLocale: {
          firstDayOfWeek: 1,
        },
      },
      biography: null,
      image: {},
      imageName: null,
    };
  },
  methods: {
    formSubmit(event) {
      event.preventDefault();
      const form = event.target;
      const formData = new FormData(form);

      formData.append(
        "img",
        document.querySelector("#img").files[0],
        document.querySelector("#img").files[0].name
      );
      console.log("image", document.querySelector("#img").files[0]);
      console.log("handlesubmit", event, event.target.action);
      console.log("image object", document.querySelector("#img").files[0].name);
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
    deleteImage() {
      this.imageName = null;
    },
    dateIsValid(date) {
      if (date != null) {
        var date_components = date.split("/");
        var day = date_components[0];
        var month = date_components[1];
        var year = date_components[2];
        return (
          new Date(year, month - 1, day) !== "Invalid Date" &&
          new Date(year, month - 1, day) &&
          new Date(year, month - 1, day) <= new Date()
        );
      } else {
        return false;
      }
    },
  },
  computed: {
    logicDate() {
      if (this.deathday != null) {
        if (this.birthday != null) {
          var birthday_components = this.birthday.split("/");
          var birth_day = birthday_components[0];
          var birth_month = birthday_components[1];
          var birth_year = birthday_components[2];
          var deathdate_components = this.deathday.split("/");
          var death_day = deathdate_components[0];
          var death_month = deathdate_components[1];
          var death_year = deathdate_components[2];
          return (
            new Date(birth_year, birth_month - 1, birth_day) <
            new Date(death_year, death_month - 1, death_day)
          );
        } else {
          return false;
        }
      } else {
        return true;
      }
    },
    biographyIsValid: function () {
      if (this.biography != null) {
        return this.biography.trim().split(/\s+/).length >= 3;
      }
      return false;
    },
    imageIsValid() {
      if (this.imageName != null) {
        return this.imageName.match(/[/.](gif|jpg|jpeg|png)$/i);
      }
      return false;
    },
    formIsValid: function () {
      return (
        this.name.length >= 2 &&
        this.dateIsValid(this.birthday) &&
        this.dateIsValid(this.deathday) &&
        this.logicDate &&
        this.biographyIsValid &&
        (this.imageIsValid || this.imageName == null)
      );
    },
  },
};
</script>