<template>
    <div id="inscription">
        <section>

            <h2>Inscrivez-vous !</h2>
            <form>
                <div class="name">
                    <div class="name_form">
                        <label for="last_name">
                            <i class="fas fa-pen-fancy"></i>
                        </label>
                        <input type="text" name="last_name" placeholder="Nom" id="last_name">
                    </div>
                    <div class="name_form">
                        <label for="first_name">
                            <i class="fas fa-pen-fancy"></i>
                        </label>
                        <input type="text" name="firstname" placeholder="Prénom" id="first_name">
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
                    <input type="email" name="email" placeholder="Email" id="email">
                </div>
                <div class="phone_form">
                    <label for="phone">
                        <i class="fas fa-phone-alt"></i>
                    </label>
                    <input type="tel" name="phone" placeholder="Téléphone" id="phone" maxlength="15">
                </div>
                <div id="adress_form">
                    <label for="adress">
                        <i class="fas fa-map-marker-alt"></i>
                    </label>
                    <input type="text" name="adress" placeholder="Numéro et libellé de la voie" id="adress">
                </div>
                <div id="adress_bis_form">
                    <label for="adress_bis">
                        <i class="fas fa-map-marker-alt"></i>
                    </label>
                    <input type="text" name="adress_bis" placeholder="Complément d'adresse" id="adress_bis">
                </div>
                <div class="locate">
                    <div class="locate_form">
                        <label for="postcode">
                            <i class="far fa-envelope"></i>
                        </label>
                        <input type="text" name="postcode" placeholder="Code postale" id="postcode" maxlength="5">
                    </div>
                    <div class="locate_form">
                        <label for="city">
                            <i class="fas fa-city"></i>
                        </label>
                        <input type="text" name="city" placeholder="Ville" id="city">
                    </div>
                    <div class="locate_form">
                        <label for="country">
                            <i class="fas fa-globe-europe"></i>
                        </label>
                        <input type="text" name="country" placeholder="Pays" id="country">
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
                <button>Je m'inscrit !</button>
            </form>
            <router-link :to="{ name: 'connexion'}">Déjà inscrit ?</router-link>
        </section>
    </div>
</template>

<script>
  export default {
    name: 'inscription-customer',
  }
</script>