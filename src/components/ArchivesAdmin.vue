<template>
  <section>
    <table cellspacing="0">
      <caption>
        Listes des commandes 
      </caption> 
      <thead>
        <tr>
          <th>Numéro de commande</th>
          <th>Date de commande</th>
          <th>Recette</th>
          <th>Client</th>
          <th>Statut</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="order in orders" :key="order.id">
          
          <td data-label="Numéro de commande">
            <router-link
              :to="{ name: 'order-admin', params: { orderId: order.id } }"
            >
              {{ order.number_order }}
            </router-link>
          </td>
          <td data-label="Date de commande">{{ order.creation_date }}</td>
          <td data-label="Recette">{{ order.bill }}&euro;</td>
          <td data-label="Client">
            <div v-for="customer in customers" :key="customer.id">
              <router-link
              v-if="customer.id == order.customer"
                :to="{
                  name: 'customer-admin',
                  params: { customerId: order.customer },
                }"
              >
                {{ customer.first_name }}
                {{ customer.last_name }}
              </router-link>
            </div>
          </td>
          <td data-label="Statut" v-bind:class="[
              { ongoing: ongoing(order.status) },
              { cancelled: cancelled(order.status) },
              { delivered: delivered(order.status) }
            ]">{{ order.status }}</td>
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
      return this.$store.state.orders
    },
    customers() {
      return this.$store.state.customers
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