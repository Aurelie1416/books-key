<template>
  <div>
    <h3>
      <i class="fas fa-money-bill-wave"></i>
      Sélectionner votre moyen de paiement
    </h3>
    <div class="option">
      <div class="payment_option">
        <input type="radio" id="bluecard" name="payment" class="option_radio" />
        <label for="bluecard">
          <img src="image/cb.png" alt="credit card" />
        </label>
      </div>
      <div class="payment_option">
        <input type="radio" id="Visa" name="payment" class="option_radio" />
        <label for="visa">
          <img src="image/visa.png" alt="visa" />
        </label>
      </div>
      <div class="payment_option">
        <input
          type="radio"
          id="mastercard"
          name="payment"
          class="option_radio"
        />
        <label for="mastercard">
          <img src="image/mastercard.png" alt="mastercard" />
        </label>
      </div>
      <div class="payment_option">
        <input type="radio" id="paypal" name="payment" class="option_radio" />
        <label for="paypal">
          <img src="image/paypal.png" alt="paypal" />
        </label>
      </div>
    </div>
    <div class="number_card">
      <input
        type="text"
        name="number"
        id="number"
        placeholder="Rentrez le numéro de votre carte"
        maxlength="20"
      />
      <i class="far fa-check-circle check" id="check_card"></i>
      <i class="far fa-times-circle nocheck" id="nocheck_card"></i>
    </div>
    <div>
      <small class="smallCardNumber"
        >Veuillez rentrer un numéro de carte valide</small
      >
    </div>
    <div class="help">
      <div>
        <div class="help_input">
          <input type="date" name="date" id="date" />
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
          <input
            type="text"
            name="crypto"
            id="crypto"
            placeholder="Cryptogramme"
            maxlength="3"
          />
          <div class="input_tooltip">
            <i class="fas fa-info-circle info_help">
              <span class="tooltip"
                >Rentrez les 3 chiffres au dos de votre carte</span
              >
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
  </div>
</template>
<script>
  export default {
      name: 'payment-method'
  }
</script>