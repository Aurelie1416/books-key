<template>
  <div>
    <h3>
      <i class="fas fa-map-marker-alt"></i>
      Votre adresse de livraison
    </h3>
    <div class="name">
      <div class="name_form">
        <div>
          <label for="last_name">
            <i class="fas fa-pen-fancy"></i>
          </label>
          <input
            type="text"
            name="last_name"
            placeholder="Nom"
            id="last_name"
          />
          <i class="far fa-check-circle check" id="check_last_name"></i>
          <i class="far fa-times-circle nocheck" id="nocheck_last_name"></i>
        </div>
        <div>
          <small class="smallLastName">
            Votre nom doit comporter :
            <span class="lastNameNumberCaracters">au moins 2 caractères, </span>
            <span class="lastNameLetter">uniquement des lettres</span>
          </small>
        </div>
      </div>
      <div class="name_form">
        <div>
          <label for="first_name">
            <i class="fas fa-pen-fancy"></i>
          </label>
          <input
            type="text"
            name="firstname"
            placeholder="Prénom"
            id="first_name"
          />
          <i class="far fa-check-circle check" id="check_first_name"></i>
          <i class="far fa-times-circle nocheck" id="nocheck_first_name"></i>
        </div>
        <div>
          <small class="smallFirstName">
            Votre prénom doit comporter :
            <span class="firstNameNumberCaracters"
              >au moins 2 caractères,
            </span>
            <span class="firstNameLetter">uniquement des lettres</span>
          </small>
        </div>
      </div>
    </div>
    <div class="adress_form">
      <label for="adress">
        <i class="fas fa-map-marker-alt"></i>
      </label>
      <input
        type="text"
        name="adress"
        placeholder="Numéro et libellé de la voie"
        id="adress"
      />
      <i class="far fa-check-circle check" id="check_adress"></i>
      <i class="far fa-times-circle nocheck" id="nocheck_adress"></i>
    </div>
    <div>
      <small class="smallAdress">Ce champ est obligatoire</small>
    </div>
    <div class="adress_form">
      <label for="adress_bis">
        <i class="fas fa-map-marker-alt"></i>
      </label>
      <input
        type="text"
        name="adress_bis"
        placeholder="Complément d'adresse"
        id="adress_bis"
      />
    </div>
    <div class="locate">
      <div class="postcode_form">
        <label for="postcode">
          <i class="far fa-envelope"></i>
        </label>
        <input
          type="text"
          name="postcode"
          placeholder="Code postale"
          id="postcode"
          maxlength="5"
        />
        <i class="far fa-check-circle check" id="check_postcode"></i>
        <i class="far fa-times-circle nocheck" id="nocheck_postcode"></i>
      </div>
      <div>
        <small class="smallPostcode"
          >Veuillez rentrer un code postal valide</small
        >
      </div>
      <div class="city_form">
        <label for="city">
          <i class="fas fa-city"></i>
        </label>
        <input type="text" name="city" placeholder="Ville" id="city" />
        <i class="far fa-check-circle check" id="check_city"></i>
        <i class="far fa-times-circle nocheck" id="nocheck_city"></i>
      </div>
      <small class="smallCity">Ce champ est obligatoire</small>
      <div class="country_form">
        <label for="country">
          <i class="fas fa-globe-europe"></i>
        </label>
        <input type="text" name="country" placeholder="Pays" id="country" />
        <i class="far fa-check-circle check" id="check_country"></i>
        <i class="far fa-times-circle nocheck" id="nocheck_country"></i>
      </div>
      <small class="smallCountry">Ce champ est obligatoire</small>
    </div>
    <div class="mail_form">
      <label for="email">
        <i class="fas fa-at"></i>
      </label>
      <input type="email" name="email" placeholder="Email" id="email" />
      <i class="far fa-check-circle check" id="check_mail"></i>
      <i class="far fa-times-circle nocheck" id="nocheck_mail"></i>
    </div>
    <div>
      <small class="smallEmail"
        >Veuillez rentrer une adresse email valide</small
      >
    </div>
    <div class="phone_form">
      <label for="phone">
        <i class="fas fa-phone-alt"></i>
      </label>
      <input
        type="tel"
        name="phone"
        placeholder="Téléphone"
        id="phone"
        maxlength="15"
      />
      <i class="far fa-check-circle check" id="check_phone"></i>
      <i class="far fa-times-circle nocheck" id="nocheck_phone"></i>
    </div>
    <div>
      <small class="smallPhone"
        >Veuillez rentrer un numéro de téléphone valide</small
      >
    </div>
    <div>
      <small class="emailPhone"
        >*Veuillez renseigner votre adresse email OU votre numéro de
        téléphone</small
      >
    </div>
    <div>
      <small
        >*En cas d'imprévus, nous vous recontacterons via l'adresse mail ou le
        numéro de téléphone</small
      >
    </div>
  </div>
</template>
<script>
  export default {
      name: 'shipping-information'
  }
</script>