<template>
  <section>
    <table cellspacing="0">
      <caption>
        Liste des commandes
      </caption>
      <thead>
        <tr>
          <th scope="col" v-for="column in columns" :key="column">
            {{ column }}
          </th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="order in orders" :key="order.id">
          <td v-if="order.customer == customer_id" data-label="Date">
            {{ order.creation_date }}
          </td>
          <td
            v-if="order.customer == customer_id"
            data-label="Numéro de Commande"
          >
            <a href="order_admin.html">{{ order.number_order }}</a>
          </td>
          <td
            data-label="Statut"
            v-bind:class="[
              { ongoing: ongoing(order.status) },
              { cancelled: cancelled(order.status) },
              { delivered: delivered(order.status) }
            ]"
          >
            {{ order.status }}
          </td>
        </tr>
      </tbody>
    </table>
  </section>
</template>

<script>
export default {
  name: "archives-admin",
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
    },
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