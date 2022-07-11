<template>
  <div id="inscription">
    <form
      v-on:submit.prevent="formSubmit"
      method="post"
      enctype="multipart/form-data"
    >
      <div class="totalInput">
        <div class="input">
          <label for="groupName">
            <i class="far fa-users"></i>
          </label>
          <input
            ref="groupName"
            placeholder="Nom du groupe"
            v-model="group_name"
            type="text"
            id="groupName"
            name="groupName"
            v-bind:class="[
              { inputValid: group_name.length > 2 },
              { inputError: group_name.length < 2 && group_name.length > 0 },
            ]"
          />
          <i v-if="group_name.length > 2" class="far fa-check-circle check"></i>
          <i
            v-if="group_name.length < 2 && group_name.length > 0"
            class="far fa-times-circle nocheck"
          ></i>
        </div>
        <p
          class="inputPlaceHolder"
          v-bind:class="[{ active: group_name.length > 0 }]"
        >
          Nom du groupe
        </p>
        <small
          v-bind:class="[
            {
              inputMessageError: group_name.length < 2 && group_name.length > 0,
            },
          ]"
          >Veuillez rentrer un nom de groupe valide</small
        >
      </div>
      <div class="totalInput">
        <div class="input">
          <label class="creationDate" for="groupCreationDate">Fondée le</label>
          <date-picker
            type="date"
            v-model="creation_date"
            valueType="format"
            v-bind:class="[
              { inputDateValid: dateIsValid && creation_date !== null },
              {
                inputDateInvalid: !dateIsValid && creation_date !== null,
              },
            ]"
            name="groupCreationDate"
            placeholder="Date de création"
            id="groupCreationDate"
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
      <div class="twoInput" id="radio">
        <div class="input">
          <label class="inputNeutral" for="writerCreated"
            >Sélectionnez un auteur déjà existant</label
          >
          <input
            value="writerCreated"
            v-model="listWriterGroup"
            type="radio"
            name="listWriterGroup"
            id="writerCreated"
            required
          />
        </div>
        <div class="input">
          <label class="inputNeutral" for="newWriter"
            >Ajouter un nouvel auteur</label
          >
          <input
            value="newWriter"
            v-model="listWriter"
            type="radio"
            name="listWriterGroup"
            id="newWriter"
            required
          />
        </div>
      </div>
      <div v-if="(listWriterGroup = 'writerCreated')">
        <div class="menu_select">
          <label>Sélectionez un écrivain</label>
          <div class="boxOption">
            <input type="text" />
            <div class="boxArrow">
              <i class="fas fa-sort-down arrow" v-on:click="showMenuOption"></i>
            </div>
            <div class="list">
              <div v-bind:style="{ position: 'relative' }">
                <div
                  v-for="writer in writers"
                  :key="writer.id"
                  class="option_menu"
                  v-bind:style="{ display: 'flex' }"
                >
                  <input
                    v-bind:value="writer.id"
                    v-model="checkedwriters"
                    type="checkbox"
                    name="writer"
                    id="writer"
                  />
                  <p v-bind:style="{ margin: '7px' }">
                    {{ writer.name }}
                  </p>
                </div>
              </div>
            </div>
          </div>
        </div>
        <button v-on:click="addWriterInGroup(checkedWriters)">
        Ajouter au groupe
      </button>
      </div>

      <div v-if="(listWriterGroup = 'newWriter')">Test</div>

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
      group_name: "",
      creation_date: null,
      lang: {
        formatLocale: {
          firstDayOfWeek: 1,
        },
      },
      listWriterGroup: [],
      summary: null,
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
  },
  computed: {
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
    summaryIsValid: function () {
      if (this.summary != null) {
        return this.summary.trim().split(/\s+/).length >= 3;
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
        group_name.length > 2
        && this.dateIsValid
        && this.summaryIsValid
        && 
        (this.imageIsValid || this.imageName == null)
      );
    },
  },
};
</script>