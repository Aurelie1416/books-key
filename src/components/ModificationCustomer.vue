<template>
    <div id="ModificationCustomer">
        <section>
            <h2>Je modifie mes informations</h2>
            <form>
                <div class="name">
                    <div class="name_form">
                        <label for="last_name">
                            <i class="fas fa-pen-fancy"></i>
                        </label>
                        <input type="text" name="last_name" placeholder="Nom" id="last_name" v-model="last_name">
                    </div>
                    <div class="name_form">
                        <label for="first_name">
                            <i class="fas fa-pen-fancy"></i>
                        </label>
                        <input type="text" name="firstname" placeholder="Prénom" id="first_name" v-model="first_name">
                    </div>
                </div>
                <div class="password_double_check">
                    <div class="password_form"> 
                        <label for="password">
                            <i class="fas fa-lock"></i>
                        </label>
                        <input type="password" id="password" name="password" placeholder="Mot de passe">
                        <i class="fas fa-eye eye"></i>
                    </div>
                    <div class="password_form">
                        <label for="password_bis">
                            <i class="fas fa-check-double"></i>
                        </label>
                        <input type="text" name="password_bis" placeholder="Confirmer votre mot de passe" id="password_bis">
                        <i class="fas fa-eye eye"></i>
                    </div>  
                </div>
                <div class="mail_form">
                    <label for="email">
                        <i class="fas fa-at"></i>
                    </label>
                    <input type="email" name="email" placeholder="Email" id="email" v-model="email">
                </div>
                <div class="phone_form">
                    <label for="phone">
                        <i class="fas fa-phone-alt"></i>
                    </label>
                    <input type="tel" name="phone" placeholder="Téléphone" id="phone" maxlength="15" v-model="phone">
                </div>
                <div id="adress_form">
                    <label for="adress">
                        <i class="fas fa-map-marker-alt"></i>
                    </label>
                    <input type="text" name="adress" placeholder="Numéro et libellé de la voie" id="adress" v-model="street_1">
                </div>
                <div id="adress_bis_form">
                    <label for="adress_bis">
                        <i class="fas fa-map-marker-alt"></i>
                    </label>
                    <input type="text" name="adress_bis" placeholder="Complément d'adresse" id="adress_bis" v-model="street_2">
                </div>
                <div class="locate">
                    <div class="locate_form">
                        <label for="postcode">
                            <i class="far fa-envelope"></i>
                        </label>
                        <input type="text" name="postcode" placeholder="Code postale" id="postcode" maxlength="5" v-model="postal_code">
                    </div>
                    <div class="locate_form">
                        <label for="city">
                            <i class="fas fa-city"></i>
                        </label>
                        <input type="text" name="city" placeholder="Ville" id="city" v-model="city">
                    </div>
                    <div class="locate_form">
                        <label for="country">
                            <i class="fas fa-globe-europe"></i>
                        </label>
                        <input type="text" name="country" placeholder="Pays" id="country" v-model="country">
                    </div>
                </div>
                <div class="img">
                    <input type="file" name="img" placeholder="Image (facultatif)" id="img_logo">
                    <div>
                        <div class="img_label">
                            <i class="fas fa-image"></i>                        
                        </div>
                        <div class="img_input">
                            <p>Image (Facultatif)</p> 
                        </div>
                    </div>
                </div>                
                <button>Valider</button>
            </form>
        </section>
    </div>
</template>

<script>
  import store from '../store/index'
  export default {
    name: 'modification-customer',
    store: store,
    data: function(){
      return{
            last_name: this.$store.state.customers[this.$route.params.customerId].last_name,
            first_name: this.$store.state.customers[this.$route.params.customerId].first_name,
            email: this.$store.state.customers[this.$route.params.customerId].last_name,
            phone: this.$store.state.customers[this.$route.params.customerId].phone,
            street_1: this.$store.state.customers[this.$route.params.customerId].address.street_1,
            street_2: this.$store.state.customers[this.$route.params.customerId].address.street_2,
            city: this.$store.state.customers[this.$route.params.customerId].address.city,
            postal_code: this.$store.state.customers[this.$route.params.customerId].address.postal_code,
            country: this.$store.state.customers[this.$route.params.customerId].address.country,
        }
    },
    created: function(){
        this.$store.dispatch('ajaxCustomers');
    }
  }
</script>