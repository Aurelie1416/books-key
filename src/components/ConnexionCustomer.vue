<template>
    <section id="connexion">

        <h2>Connectez-vous !</h2>
        <form>
            <div class="totalinput">
                <div class="input">
                    <label for="email">
                        <i class="fas fa-at"></i>
                    </label>
                    <input ref="email" v-model="email" type="email" id="email" name="email" v-bind:class="[{inputValid : emailValid}, {inputError : !emailValid && email.length > 0}]">
                </div>
                <p class="inputPlaceHolder" v-bind:class="[{active : email.length > 0}]">Email</p>
            </div>
            <p v-bind:class="[{inputMessageValid : emailValid}, {inputMessageError : !emailValid && email.length > 0}]">Veuillez rentrer une adresse mail valide</p>
            <div class="totalinput"> 
                <label for="password">
                    <i class="fas fa-lock"></i>
                </label>
                <input type="password" id="password" name="password" placeholder="Mot de passe">
                <i class="fas fa-eye eye"></i>
            </div>
            <button>Je me connecte !</button>
        </form>
        <router-link :to="{ name: 'inscription'}">Pas encore inscrit ?</router-link>
    </section>
</template>

<script>
  export default {
    name: 'connexion-customer',
    data: function(){
      return{
          email: '',
      }
    },
    methods: {
        emailValidation(){
            this.$refs.email.validity.typeMismatch
        }
    },
    computed: {
        emailValid(){
            console.log("ref", this.$refs);
            console.log('email', this.$refs.email)           
            if(!this.emailValidation){
                return true
            }
            return false;
        }
    }
  }
</script>