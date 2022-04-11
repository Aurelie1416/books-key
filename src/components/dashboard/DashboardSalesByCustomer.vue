<template>
  <div id="dashboard_sales_by_customer">
    <section>
      <table cellspacing="0">
        <caption>
          Ventes par client
        </caption>
        <thead>
          <tr>
            <th scope="col">Nom</th>
            <th scope="col">Prénom</th>
            <th scope="col">Nombre de commande</th>
            <th scope="col">Revenu des commandes</th>
            <th scope="col">Pannier moyen</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="customer in customers" :key="customer.id">
            <td data-label="Nom">
              <router-link
                :to="{ name: 'customer', params: { customerId: customer.id } }"
              >
                {{ customer.last_name }}
              </router-link>
            </td>
            <td data-label="Prénom">
              <router-link
                :to="{ name: 'customer', params: { customerId: customer.id } }"
              >
                {{ customer.first_name }}
              </router-link>
            </td>
            <td data-label="Nombre de commande">
              {{ numberOrders(customer.id) }}
            </td>
            <td data-label="Revenu des commandes">
              {{ reviewOrders(customer.id) }}&euro;
            </td>
            <td v-if="numberOrders(customer.id) > 0" data-label="Panier moyen">
              {{
                (reviewOrders(customer.id) / numberOrders(customer.id)).toFixed(
                  2
                )
              }}&euro;
            </td>
            <td v-else data-label="Panier moyen">0&euro;</td>
          </tr>
        </tbody>
      </table>
    </section>
  </div>
</template>

<script>
export default {
  name: "dashboard-sales-by-customer",
  beforeCreate: function () {
    this.$store.dispatch("ajaxOrders");
    this.$store.dispatch("ajaxCustomers");
  },
  computed: {
    customers() {
      return this.$store.state.customers;
    },
    orders() {
      return this.$store.state.orders;
    },
  },
  methods: {
    numberOrders(customerId) {
      let numberOrders = [];
      for (const order of this.orders) {
        if (order.customer == customerId && order.status == "livrée") {
          numberOrders.push(order);
        }
      }
      return numberOrders.length > 0 ? numberOrders.length : 0;
    },
    reviewOrders(customerId) {
      let reviewOrders = 0;
      for (const order of this.orders) {
        if (order.customer == customerId && order.status == "livrée") {
          reviewOrders += order.bill;
        }
      }
      return reviewOrders;
    },
  },
};
</script>