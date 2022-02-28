<template>
    <div id="connexion">
        <section>

            <h2>Connectez-vous !</h2>
            <form id="connexion">
                <div>
                    <label for="email">
                        <i class="fas fa-at"></i>
                    </label>
                    <input type="email" id="email" name="email" placeholder="Email">
                </div>
                <div> 
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
    </div>
</template>

<script>
  export default {
    name: 'connexion-customer',
  }
</script>