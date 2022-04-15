<template>
  <section>
    <table cellspacing="0" v-if="customer">
      <thead>
        <tr>
          <th>Client</th>
          <th>Email</th>
          <th>Téléphone</th>
          <th>Adresse</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td data-label="Client">
            <div>
              <router-link
                :to="{
                  name: 'customer-admin',
                  params: { customerId: customer.id },
                }"
              >
                {{ customer.first_name }} {{ customer.last_name }}
              </router-link>
            </div>
          </td>
          <td data-label="Email :">
            <div>{{ customer.email }}</div>
          </td>
          <td data-label="Téléphone :">
            <div>{{ customer.phone }}</div>
          </td>
          <td data-label="Adresse">
            <div>
              <p>{{ customer.address.street_1 }}</p>
              <p>{{ customer.address.street_2 }}</p>
              <p>
                {{ customer.address.postalCode }}
                {{ customer.address.city }} ({{ customer.address.country }})
              </p>
            </div>
          </td>
        </tr>
      </tbody>
    </table>
  </section>
</template>

<script>
export default {
  name: "order-customer-admin",
  props: {
    order: Object,
  },
  beforeCreate: function () {
    this.$store.dispatch("ajaxCustomers");
  },
  computed: {
    customer() {
      if (this.$store.state.customers.length > 0){
      let customer = {};
      for (const customer_indiviual of this.$store.state.customers) {
        if (customer_indiviual.id == this.order.customer) {
          customer = customer_indiviual;
        }
      }
      return customer;
      } else {
        return null
      }
     
    },
  }
};
</script>