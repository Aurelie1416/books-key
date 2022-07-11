<template>
  <div id="inscription">
       <form
        v-on:submit.prevent="formSubmit"
        method="post"
        enctype="multipart/form-data"
      >
        <div class="twoInput">
          <div class="totalInput">
            <div class="input">
              <label for="lastName">
                <i class="fas fa-pen-fancy"></i>
              </label>
              <input
                ref="lastName"
                placeholder="Nom"
                v-model="last_name"
                type="text"
                id="lastName"
                name="lastName"
                v-bind:class="[
                  { inputValid: lastNameIsValid },
                  { inputError: last_name.length > 0 && !lastNameIsValid },
                ]"
              />
              <i v-if="lastNameIsValid" class="far fa-check-circle check"></i>
              <i
                v-if="last_name.length > 0 && !lastNameIsValid"
                class="far fa-times-circle nocheck"
              ></i>
            </div>
            <p
              class="inputPlaceHolder"
              v-bind:class="[{ active: last_name.length > 0 }]"
            >
              Nom
            </p>
            <small
              v-bind:class="[
                { inputMessageError: last_name.length > 0 && !lastNameIsValid },
              ]"
              >Veuillez rentrer un nom valide</small
            >
          </div>

          <div class="totalInput">
            <div class="input">
              <label for="firstName">
                <i class="fas fa-pen-fancy"></i>
              </label>
              <input
                ref="firstName"
                placeholder="Prénom"
                v-model="first_name"
                type="text"
                id="firstName"
                name="firstName"
                v-bind:class="[
                  { inputValid: firstNameIsValid },
                  { inputError: first_name.length > 0 && !firstNameIsValid },
                ]"
              />
              <i v-if="firstNameIsValid" class="far fa-check-circle check"></i>
              <i
                v-if="first_name.length > 0 && !firstNameIsValid"
                class="far fa-times-circle nocheck"
              ></i>
            </div>
            <p
              class="inputPlaceHolder"
              v-bind:class="[{ active: first_name.length > 0 }]"
            >
              Prénom
            </p>
            <small
              v-bind:class="[
                {
                  inputMessageError: first_name.length > 0 && !firstNameIsValid,
                },
              ]"
              >Veuillez rentrer un prénom valide</small
            >
          </div>
        </div>
        <div v-if="this.$route.name == 'inscription'" class="twoInput">
          <div class="totalInput">
            <div class="input">
              <label for="password">
                <i class="fas fa-lock"></i>
              </label>
              <input
                ref="password"
                type="password"
                v-model="password"
                id="password"
                name="password"
                placeholder="Mot de passe"
                v-bind:class="[
                  { inputValid: passwordIsValid && password.length > 0 },
                  { inputError: !passwordIsValid && password.length > 0 },
                ]"
              />
              <i
                class="fas fa-eye eye"
                v-if="hide"
                v-on:click="showPassword"
              ></i>
              <i
                class="fas fa-eye-slash eyeSlash"
                v-if="!hide"
                v-on:click="hidePassword"
              ></i>
              <i
                v-if="passwordIsValid && password.length > 0"
                class="far fa-check-circle check"
                id="checkPassword"
              ></i>
              <i
                v-if="!passwordIsValid && password.length > 0"
                class="far fa-times-circle nocheck"
                id="nocheckPassword"
              ></i>
            </div>
            <p
              class="inputPlaceHolder"
              v-bind:class="[{ active: password.length > 0 }]"
            >
              Mot de passe
            </p>
          </div>
          <div class="totalInput">
            <div class="input">
              <label for="passwordVerification">
                <i class="fas fa-check-double"></i>
              </label>
              <input
                ref="passwordVerification"
                type="password"
                v-model="password_verification"
                id="passwordVerification"
                name="passwordVerification"
                placeholder="Confirmez votre mot de passe"
                v-bind:class="[
                  {
                    inputValid:
                      passwordVerificationIsValid &&
                      password_verification.length > 0,
                  },
                  {
                    inputError:
                      !passwordVerificationIsValid &&
                      password_verification.length > 0,
                  },
                ]"
              />
              <i
                class="fas fa-eye eye"
                v-if="hide"
                v-on:click="showPassword"
              ></i>
              <i
                class="fas fa-eye-slash eyeSlash"
                v-if="!hide"
                v-on:click="hidePassword"
              ></i>
              <i
                v-if="
                  passwordVerificationIsValid &&
                  password_verification.length > 0
                "
                class="far fa-check-circle check"
                id="checkPassword"
              ></i>
              <i
                v-if="
                  !passwordVerificationIsValid &&
                  password_verification.length > 0
                "
                class="far fa-times-circle nocheck"
                id="nocheckPassword"
              ></i>
            </div>
            <p
              class="inputPlaceHolder"
              v-bind:class="[{ active: password_verification.length > 0 }]"
            >
              Confirmez votre mot de passe
            </p>
          </div>
        </div>
        <div class="twoInput" v-bind:style="{ marginTop: '0' }">
          <div>
            <small class="smallVisible">
              Votre mot de passe doit contenir au moins :
              <span
                v-bind:class="[
                  {
                    inputMessageValid:
                      numberCaracterIsValid && password.length > 0,
                  },
                  {
                    inputMessageError:
                      !numberCaracterIsValid && password.length > 0,
                  },
                ]"
                >8 caractères,
              </span>
              <span
                v-bind:class="[
                  {
                    inputMessageValid: lowercaseIsValid && password.length > 0,
                  },
                  {
                    inputMessageError: !lowercaseIsValid && password.length > 0,
                  },
                ]"
                >une minuscule,
              </span>
              <span
                v-bind:class="[
                  {
                    inputMessageValid: uppercaseIsValid && password.length > 0,
                  },
                  {
                    inputMessageError: !uppercaseIsValid && password.length > 0,
                  },
                ]"
                >une majuscule,
              </span>
              <span
                v-bind:class="[
                  { inputMessageValid: numberIsValid && password.length > 0 },
                  { inputMessageError: !numberIsValid && password.length > 0 },
                ]"
                >un chiffre,
              </span>
              <span
                v-bind:class="[
                  {
                    inputMessageValid:
                      specialCaracterIsValid && password.length > 0,
                  },
                  {
                    inputMessageError:
                      !specialCaracterIsValid && password.length > 0,
                  },
                ]"
                >un caractère spécial</span
              >
            </small>
          </div>
          <div>
            <small
              v-bind:class="[
                {
                  inputMessageError:
                    !passwordVerificationIsValid &&
                    password_verification.length > 0,
                },
              ]"
              >Veuillez vérifiez que vos mots de passe concordent</small
            >
          </div>
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
            <label for="address">
              <i class="fas fa-map-marker-alt"></i>
            </label>
            <input
              ref="address"
              placeholder="Numéro et libellé de la voie"
              v-model="address"
              type="text"
              id="address"
              name="adress"
              v-bind:class="[
                { inputValid: address.length > 4 },
                { inputError: address.length > 0 && address.length <= 4 },
              ]"
            />
            <i v-if="address.length > 4" class="far fa-check-circle check"></i>
            <i
              v-if="address.length > 0 && address.length <= 4"
              class="far fa-times-circle nocheck"
            ></i>
          </div>
          <p
            class="inputPlaceHolder"
            v-bind:class="[{ active: address.length > 0 }]"
          >
            Numéro et libellé de la voie
          </p>
        </div>
        <small
          v-bind:class="[
            { inputMessageError: address.length > 0 && address.length <= 4 },
          ]"
          >Veuillez rentrer une addresse valide</small
        >
        <div class="totalInput">
          <div class="input">
            <label for="addressBis">
              <i class="fas fa-map-marker-alt"></i>
            </label>
            <input
              ref="addressBis"
              placeholder="Complément d'adresse"
              v-model="address_bis"
              type="text"
              id="addressBis"
              name="addressBis"
            />
          </div>
          <p
            class="inputPlaceHolder"
            v-bind:class="[{ active: address_bis.length > 0 }]"
          >
            Complément d'adresse
          </p>
        </div>
        <div class="threeInput">
          <div class="totalInput">
            <div class="input">
              <label for="postcode">
                <i class="far fa-envelope"></i>
              </label>
              <input
                ref="postcode"
                placeholder="Code postal"
                v-model="postcode"
                type="text"
                id="postcode"
                name="postcode"
                v-bind:class="[
                  { inputValid: postcodeIsValid },
                  { inputError: postcode.length > 0 && !postcodeIsValid },
                ]"
              />
              <i
                v-if="postcodeIsValid"
                class="far fa-check-circle check"
                v-bind:style="{ right: '10px' }"
              ></i>
              <i
                v-if="postcode.length > 0 && !postcodeIsValid"
                class="far fa-times-circle nocheck"
                v-bind:style="{ right: '10px' }"
              ></i>
            </div>
            <p
              class="inputPlaceHolder"
              v-bind:class="[{ active: postcode.length > 0 }]"
            >
              Code postal
            </p>
          </div>
          <div class="totalInput">
            <div class="input">
              <label for="city">
                <i class="fas fa-city"></i>
              </label>
              <input
                ref="city"
                placeholder="Ville"
                v-model="city"
                type="text"
                id="city"
                name="city"
                v-bind:class="[
                  { inputValid: cityIsValid },
                  { inputError: city.length > 0 && !cityIsValid },
                ]"
              />
              <i
                v-if="cityIsValid"
                class="far fa-check-circle check"
                v-bind:style="{ right: '10px' }"
              ></i>
              <i
                v-if="city.length > 0 && !cityIsValid"
                class="far fa-times-circle nocheck"
                v-bind:style="{ right: '10px' }"
              ></i>
            </div>
            <p
              class="inputPlaceHolder"
              v-bind:class="[{ active: city.length > 0 }]"
            >
              Ville
            </p>
          </div>
          <div class="totalInput">
            <div class="input">
              <label for="country">
                <i class="fas fa-globe-europe"></i>
              </label>
              <input
                ref="country"
                placeholder="Pays"
                v-model="country"
                type="text"
                id="country"
                name="country"
                v-bind:class="[
                  { inputValid: countryIsValid },
                  { inputError: country.length > 0 && !countryIsValid },
                ]"
              />
              <i
                v-if="countryIsValid"
                class="far fa-check-circle check"
                v-bind:style="{ right: '10px' }"
              ></i>
              <i
                v-if="country.length > 0 && !countryIsValid"
                class="far fa-times-circle nocheck"
                v-bind:style="{ right: '10px' }"
              ></i>
            </div>
            <p
              class="inputPlaceHolder"
              v-bind:class="[{ active: country.length > 0 }]"
            >
              Pays
            </p>
          </div>
        </div>
        <div class="threeInput" v-bind:style="{ marginTop: '0' }">
          <div>
            <small
              v-bind:class="[
                { inputMessageError: postcode.length > 0 && !postcodeIsValid },
              ]"
              >Veuillez rentrer un code postal valide</small
            >
          </div>
          <div>
            <small
              v-bind:class="[
                { inputMessageError: city.length > 0 && !cityIsValid },
              ]"
              >Veuillez rentrer nom de ville valide</small
            >
          </div>
          <div>
            <small
              v-bind:class="[
                { inputMessageError: country.length > 0 && !countryIsValid },
              ]"
              >Veuillez rentrer nom de pays valide</small
            >
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
              placeholder="Avatar (facultatif)"
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
            Avatar (facultatif)
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
        <div>
          <small
            class="smallVisible"
            v-bind:class="[{ inputWrong: !imageIsValid && imageName }]"
            >Seule les images de type PNG, JPEG ou JPG sont acceptées</small
          >
        </div>
         <button
          :disabled="!formIsValid"
          v-bind:class="[{ buttonActive: formIsValid }]"
        >
          Je m'inscrit !
        </button>
      </form>
      <p class="link"><router-link :to="{ name: 'connexion' }">Déjà inscrit ?</router-link></p>
  </div>
</template>

<script>
export default {
  name: "my-inscription",
  data: function () {
    return {
      email: "",
      first_name: "",
      last_name: "",
      password: "",
      password_verification: "",
      emailIsValid: null,
      phone: "",
      address: "",
      address_bis: "",
      postcode: "",
      city: "",
      country: "",
      image: {},
      imageName: null,
      hide: true,
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
      this.$router.push({
        name: "customer",
        params: {
          customerId: "1"
        },
      });
    },
    showPassword() {
      this.$refs.password.type = "text";
      this.$refs.passwordVerification.type = "text";
      this.hide = false;
      console.log(this.hide);
    },
    hidePassword() {
      this.$refs.password.type = "password";
      this.$refs.passwordVerification.type = "password";
      this.hide = true;
    },
    addImage(event) {
      console.log(event.target.files, event.target.files[0].name);
      try {
        this.imageName = event.target.files[0].name;
      } catch (error) {
        console.error(error);
      }
    },
  },
  computed: {
    firstNameIsValid() {
      if (
        this.first_name.length > 1 &&
        this.first_name.match(
          /^[A-Za-záàâäãåçéèêëíìîïñóòôöõúùûüýÿæœÁÀÂÄÃÅÇÉÈÊËÍÌÎÏÑÓÒÔÖÕÚÙÛÜÝŸÆŒ][-,a-záàâäãåçéèêëíìîïñóòôöõúùûüýÿæœÁÀÂÄÃÅÇÉÈÊËÍÌÎÏÑÓÒÔÖÕÚÙÛÜÝŸÆŒ. ']+[ ]*$/
        )
      ) {
        return true;
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
    lastNameIsValid() {
      if (
        this.last_name.length > 1 &&
        this.last_name.match(
          /^[A-Za-záàâäãåçéèêëíìîïñóòôöõúùûüýÿæœÁÀÂÄÃÅÇÉÈÊËÍÌÎÏÑÓÒÔÖÕÚÙÛÜÝŸÆŒ][-,a-záàâäãåçéèêëíìîïñóòôöõúùûüýÿæœÁÀÂÄÃÅÇÉÈÊËÍÌÎÏÑÓÒÔÖÕÚÙÛÜÝŸÆŒ. ']+[ ]*$/
        )
      ) {
        return true;
      } else {
        return false;
      }
    },
    numberCaracterIsValid() {
      if (this.password.length >= 8) {
        return true;
      }
      return false;
    },
    lowercaseIsValid() {
      if (this.password.match(/[a-z]/)) {
        return true;
      }
      return false;
    },
    uppercaseIsValid() {
      if (this.password.match(/[A-Z]/)) {
        return true;
      }
      return false;
    },
    numberIsValid() {
      if (this.password.match(/\d/)) {
        return true;
      }
      return false;
    },
    specialCaracterIsValid() {
      if (this.password.match(/[_\W]/)) {
        return true;
      }
      return false;
    },
    passwordIsValid() {
      if (
        this.numberCaracterIsValid &&
        this.lowercaseIsValid &&
        this.uppercaseIsValid &&
        this.numberIsValid &&
        this.specialCaracterIsValid
      ) {
        return true;
      }
      return false;
    },
    passwordVerificationIsValid() {
      if (
        this.password_verification.length > 0 &&
        this.password.length > 0 &&
        this.password === this.password_verification
      ) {
        return true;
      }
      return false;
    },
    postcodeIsValid() {
      if (
        this.postcode.length == 5 &&
        this.postcode.match(/^(([0-8][0-9])|(9[0-5])|(2[ab]))[0-9]{3}/)
      ) {
        return true;
      }
      return false;
    },
    cityIsValid() {
      if (
        this.city.length >= 2 &&
        this.city.match(
          /^[A-Za-záàâäãåçéèêëíìîïñóòôöõúùûüýÿæœÁÀÂÄÃÅÇÉÈÊËÍÌÎÏÑÓÒÔÖÕÚÙÛÜÝŸÆŒ][-,a-záàâäãåçéèêëíìîïñóòôöõúùûüýÿæœÁÀÂÄÃÅÇÉÈÊËÍÌÎÏÑÓÒÔÖÕÚÙÛÜÝŸÆŒ. ']+[ ]*$/
        )
      ) {
        return true;
      }
      return false;
    },
    countryIsValid() {
      if (
        this.country.length >= 2 &&
        this.country.match(
          /^[A-Za-záàâäãåçéèêëíìîïñóòôöõúùûüýÿæœÁÀÂÄÃÅÇÉÈÊËÍÌÎÏÑÓÒÔÖÕÚÙÛÜÝŸÆŒ][-,a-záàâäãåçéèêëíìîïñóòôöõúùûüýÿæœÁÀÂÄÃÅÇÉÈÊËÍÌÎÏÑÓÒÔÖÕÚÙÛÜÝŸÆŒ. ']+[ ]*$/
        )
      ) {
        return true;
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
        this.lastNameIsValid &&
        this.firstNameIsValid &&
        this.passwordIsValid && 
        this.passwordVerificationIsValid &&
        this.emailIsValid && 
        this.email.length > 0 &&
        this.phoneIsValid &&
        this.address.length > 4 &&
        this.postcodeIsValid &&
        this.cityIsValid &&
        this.countryIsValid &&
        (this.imageIsValid || this.imageName == null)
      )
    }
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