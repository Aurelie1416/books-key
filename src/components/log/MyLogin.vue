<template>
    <section id="connexion">

        <h2>Connectez-vous !</h2>
        <form method="post" v-on:submit.prevent="formSubmit">
            <div class="totalinput">
                <div class="input">
                    <label for="email">
                        <i class="fas fa-at"></i>
                    </label>
                    <input ref="email" placeholder="Email" v-model="email" type="email" id="email" name="email" v-bind:class="[{inputValid : emailIsValid && email.length > 0}, {inputError : !emailIsValid && email.length > 0}]">
                    <i v-if="emailIsValid && email.length > 0" class="far fa-check-circle check"></i>
                    <i v-if="!emailIsValid && email.length > 0" class="far fa-times-circle nocheck"></i>
                </div>
                <p class="inputPlaceHolder" v-bind:class="[{active : email.length > 0}]">Email</p>
            </div>
            <small v-bind:class="[{inputMessageValid : emailIsValid && email.length > 0}, {inputMessageError : !emailIsValid && email.length > 0}]">Veuillez rentrer une adresse mail valide</small>
            <div class="totalinput"> 
                <div class="input">
                    <label for="password">
                        <i class="fas fa-lock"></i>
                    </label>
                    <input ref="password" type="password" v-model="password" id="password" name="password" placeholder="Mot de passe" v-bind:class="[{inputValid : passwordIsValid && password.length > 0}, {inputError : !passwordIsValid && password.length > 0}]">
                    <i class="fas fa-eye eye" v-if="hide" v-on:click="showPassword"></i>
                    <i class="fas fa-eye-slash eyeSlash" v-if="!hide" v-on:click="hidePassword"></i>
                    <i v-if="passwordIsValid && password.length > 0" class="far fa-check-circle check" id="checkPassword"></i>
                    <i v-if="!passwordIsValid && password.length > 0" class="far fa-times-circle nocheck" id="nocheckPassword"></i>
                </div>
                <p class="inputPlaceHolder" v-bind:class="[{active : password.length > 0}]">Mot de passe</p>
            </div>
            <small class="infoPassword">
                Votre mot de passe doit contenir au moins : 
                <span v-bind:class="[{inputMessageValid : numberCaracterIsValid && password.length > 0}, {inputMessageError : !numberCaracterIsValid && password.length > 0}]">8 caractères, </span>
                <span v-bind:class="[{inputMessageValid : lowercaseIsValid && password.length > 0}, {inputMessageError : !lowercaseIsValid && password.length > 0}]">une minuscule, </span>
                <span v-bind:class="[{inputMessageValid : uppercaseIsValid && password.length > 0}, {inputMessageError : !uppercaseIsValid && password.length > 0}]">une majuscule, </span>
                <span v-bind:class="[{inputMessageValid : numberIsValid && password.length > 0}, {inputMessageError : !numberIsValid && password.length > 0}]">un chiffre, </span>
                <span v-bind:class="[{inputMessageValid : specialCaracterIsValid && password.length > 0}, {inputMessageError : !specialCaracterIsValid && password.length > 0}]">un caractère spécial</span>
            </small>
            <button :disabled="!emailIsValid || !passwordIsValid || email.length == 0 || password.length == 0" v-bind:class="[{buttonActive : emailIsValid && passwordIsValid}]">Je me connecte !</button>
        </form>
        <router-link :to="{ name: 'inscription'}">Pas encore inscrit ?</router-link>
    </section>
</template>

<script>
  export default {
    name: 'my-login',
    data: function(){
      return{
        email: '',
        password: '',
        emailIsValid: null,
        hide: true
      }
    },  
    methods: {
        showPassword(){
            this.$refs.password.type = "text";
            this.hide = false;
            console.log(this.hide)

        },
        hidePassword(){
            this.$refs.password.type = "password";
            this.hide = true;
        },
        formSubmit(event){
    
            event.preventDefault();
            const form = event.target;
            const formData = new FormData(form);
            fetch('/api/order', {
                method: 'POST', 
                body : JSON.stringify(Object.fromEntries(formData.entries())),
            })
        } 
    },
    computed: {
        numberCaracterIsValid(){
            if(this.password.length >= 8){
                return true;
            }
            return false;
        },
        lowercaseIsValid(){
            if(this.password.match(/[a-z]/)){
                return true;
            }
            return false;
        },
        uppercaseIsValid(){
            if(this.password.match(/[A-Z]/)){
                return true;
            }
            return false;
        },
        numberIsValid(){
            if(this.password.match(/\d/)){
                return true;
            }
            return false;
        },
        specialCaracterIsValid(){
            if(this.password.match(/[_\W]/)){
                return true;
            }
            return false;
        },
        passwordIsValid(){
            if(this.numberCaracterIsValid && this.lowercaseIsValid && this.uppercaseIsValid && this.numberIsValid && this.specialCaracterIsValid){
                return true
            }
            return false
        }
    },
    watch: {
        email: function(value){
            if(!this.$refs.email.validity.typeMismatch){
                this.emailIsValid = true
            }
            else{
                this.emailIsValid = false        
            }
        }
    }
  }
</script>