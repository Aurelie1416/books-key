<template>
    <div id="validationOrder">
        <section id="buy">

            <h2>Je commande !</h2>
            <form method="POST" >
                <h3>
                    <i class="fas fa-money-bill-wave"></i>
                    Sélectionner votre moyen de paiement
                </h3>
                <div class="option">
                    <div class="payment_option">
                        <input type="radio" id="bluecard" name="payment" class="option_radio">
                        <label for="bluecard">
                            <img src="image/cb.png" alt="credit card">
                        </label>
                    </div>
                    <div class="payment_option">
                        <input type="radio" id="Visa" name="payment" class="option_radio">
                        <label for="visa">
                            <img src="image/visa.png" alt="visa">
                        </label>
                    </div>
                    <div class="payment_option">
                        <input type="radio" id="mastercard" name="payment" class="option_radio">
                        <label for="mastercard">
                            <img src="image/mastercard.png" alt="mastercard">
                        </label>
                    </div>
                    <div class="payment_option">
                        <input type="radio" id="paypal" name="payment" class="option_radio">
                        <label for="paypal">
                            <img src="image/paypal.png" alt="paypal">
                        </label>
                    </div>
                </div>
                <div class="number_card">
                    <input type="text" name="number" id="number" placeholder="Rentrez le numéro de votre carte" maxlength="20">
                    <i class="far fa-check-circle check" id="check_card"></i>
                    <i class="far fa-times-circle nocheck" id="nocheck_card"></i>
                </div>
                <div>
                    <small class="smallCardNumber">Veuillez rentrer un numéro de carte valide</small>
                </div>
                <div class="help">
                    <div>
                        <div class="help_input">
                            <input type="date" name="date" id="date">
                            <div class="input_tooltip">
                                <i class="far fa-calendar-alt expiration_date">
                                    <span class="tooltip">Date d'expiration</span>
                                </i>
                            </div>
                            <i class="far fa-check-circle check" id="check_date"></i>
                            <i class="far fa-times-circle nocheck" id="nocheck_date"></i>
                        </div>
                        <div>
                            <small>Date obligatoire</small>
                        </div>
                    </div>                        
                    <div>
                        <div class="help_input">
                            <input type="text" name="crypto" id="crypto" placeholder="Cryptogramme" maxlength="3">
                            <div class="input_tooltip">
                                <i class="fas fa-info-circle info_help">
                                    <span class="tooltip">Rentrez les 3 chiffres au dos de votre carte</span>
                                </i>
                            </div>
                            <i class="far fa-check-circle check" id="check_crypto"></i>
                            <i class="far fa-times-circle nocheck" id="nocheck_crypto"></i>
                        </div>
                        <div>
                            <small class="smallCrypto">Cryptogramme obligatoire</small>
                        </div>
                    </div>    
                </div> 
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
                            <input type="text" name="last_name" placeholder="Nom" id="last_name">
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
                            <input type="text" name="firstname" placeholder="Prénom" id="first_name">
                            <i class="far fa-check-circle check" id="check_first_name"></i>
                            <i class="far fa-times-circle nocheck" id="nocheck_first_name"></i>
                        </div>
                        <div>
                            <small class="smallFirstName">
                                Votre prénom doit comporter : 
                                <span class="firstNameNumberCaracters">au moins 2 caractères, </span> 
                                <span class="firstNameLetter">uniquement des lettres</span> 
                            </small>
                        </div>
                    </div>
                </div>
                <div class="adress_form">
                    <label for="adress">
                        <i class="fas fa-map-marker-alt"></i>
                    </label>
                    <input type="text" name="adress" placeholder="Numéro et libellé de la voie" id="adress">
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
                    <input type="text" name="adress_bis" placeholder="Complément d'adresse" id="adress_bis">
                </div>
                <div class="locate">
                    <div class="postcode_form">
                        <label for="postcode">
                            <i class="far fa-envelope"></i>
                        </label>
                        <input type="text" name="postcode" placeholder="Code postale" id="postcode" maxlength="5">
                        <i class="far fa-check-circle check" id="check_postcode"></i>
                        <i class="far fa-times-circle nocheck" id="nocheck_postcode"></i>
                    </div>
                    <div>
                        <small class="smallPostcode">Veuillez rentrer un code postal valide</small>
                    </div>
                    <div class="city_form">
                        <label for="city">
                            <i class="fas fa-city"></i>
                        </label>
                        <input type="text" name="city" placeholder="Ville" id="city">
                        <i class="far fa-check-circle check" id="check_city"></i>
                        <i class="far fa-times-circle nocheck" id="nocheck_city"></i>
                    </div>
                    <small class="smallCity">Ce champ est obligatoire</small>
                    <div class="country_form">
                        <label for="country">
                            <i class="fas fa-globe-europe"></i>
                        </label>
                        <input type="text" name="country" placeholder="Pays" id="country">
                        <i class="far fa-check-circle check" id="check_country"></i>
                        <i class="far fa-times-circle nocheck" id="nocheck_country"></i>
                    </div>
                    <small class="smallCountry">Ce champ est obligatoire</small>
                </div>
                <div class="mail_form">
                    <label for="email">
                        <i class="fas fa-at"></i>
                    </label>
                    <input type="email" name="email" placeholder="Email" id="email">
                    <i class="far fa-check-circle check" id="check_mail"></i>
                    <i class="far fa-times-circle nocheck" id="nocheck_mail"></i>
                </div>
                <div>
                    <small class="smallEmail">Veuillez rentrer une adresse email valide</small>
                </div>
                <div class="phone_form">
                    <label for="phone">
                        <i class="fas fa-phone-alt"></i>
                    </label>
                    <input type="tel" name="phone" placeholder="Téléphone" id="phone" maxlength="15">
                    <i class="far fa-check-circle check" id="check_phone"></i>
                    <i class="far fa-times-circle nocheck" id="nocheck_phone"></i>
                </div>
                <div>
                    <small class="smallPhone">Veuillez rentrer un numéro de téléphone valide</small>
                </div>
                <div>
                    <small class="emailPhone">*Veuillez renseigner votre adresse email OU votre numéro de téléphone</small>
                </div>
                <div>
                    <small>*En cas d'imprévus, nous vous recontacterons via l'adresse mail ou le numéro de téléphone</small>
                </div>
                <button disabled>Validez votre commande</button>
            </form>
            <div class="test"></div>
        </section>
    </div>
</template>

<script>
  export default {
    name: 'validation-order',
    methods: {
      handleSubmit(event){
    
        event.preventDefault();
        const form = event.target;
        const formData = new FormData(form);
        
        
        formData.append('img', document.querySelector('#img_logo').files[0] );
console.log('image', document.querySelector('#img_logo').files[0])
console.log('handlesubmit', event, event.target.action)
        console.log('image object', formData['img'])
        console.log('json', JSON.stringify(Object.fromEntries(formData.entries())))

      fetch('/api/order', {
            method: 'POST', 
             headers: {
              'Accept': 'application/json',
              'Content-Type': 'multipart/form-data'
          },
            body : JSON.stringify(Object.fromEntries(formData.entries())),
        })
      },
    }
  }
</script>