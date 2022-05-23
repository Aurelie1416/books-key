<template>
  <section>
    <table cellspacing="0" v-if="orders.length > 0">
      <caption>
        Archive de mes commandes
      </caption>
      <thead>
        <tr>
          <th>Numéro de commande</th>
          <th>Date de création</th>
          <th>Prix</th>
          <th>Statut</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="order in orders" :key="order.id">
          <td data-label="Numéro de commande">
            <router-link
              :to="{ name: 'order', params: { orderId: order.id } }"
            >
              {{ order.number_order }}
            </router-link>
          </td>
          <td data-label="Date">{{ order.creation_date }}</td>
          <td data-label="Recette">{{ order.bill }}&euro;</td>
          <td
            v-bind:class="[
              { ongoing: ongoing(order.status) },
              { cancelled: cancelled(order.status) },
              { delivered: delivered(order.status) }
            ]"
            data-label="Statut"
          >
            {{ order.status }}
          </td>
        </tr>
      </tbody>
    </table>
    <h2 v-else>Vous n'avez encore rien commandé</h2>
  </section>
</template>

<script>
export default {
  name: "my-archives",
  beforeCreate: function () {
    this.$store.dispatch("ajaxOrders");
    this.$store.dispatch("ajaxCustomers");
  }, 
  computed: {
    orders() {
      let orders = [];
      for (const order_indiviual of this.$store.state.orders) {
        if (order_indiviual.customer == this.$route.params.customerId) {
          orders.push(order_indiviual);
        }
      }
      return orders;
    }
  },
  methods: { 
      delivered(value){
        if(value == "livrée"){
            return true
        }
      },
      cancelled(value){ 
          if(value == "annulée"){
            return true
        }
      },
      ongoing(value){
          if(value == "en cours"){
            return true
        }
      }
  }
};
</script>