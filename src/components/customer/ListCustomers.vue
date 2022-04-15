<template>
  <section>
    <table cellspacing="0">
      <caption>
        Liste des clients
      </caption>
      <thead>
        <tr>
          <th></th>
          <th>Nom</th>
          <th>Prénom</th>
          <th>Email</th>
          <th>Inscrit depuis le</th>
          <th>Dernière commande</th>
          <th>Modifier</th>
          <th>Désinscrire</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="customer in customers" :key="customer.id">
          <td>
            <router-link
              :to="{ name: 'customer', params: { customerId: customer.id } }"
            >
              <img
                v-if="customer.image"
                :src="customer.image"
                alt="customer avatar"
                class="avatarLogo"
              />
              <i v-else class="fas fa-user-circle avatarLogo"></i>
            </router-link>
          </td>
          <td data-label="Nom">
            <div>
              <router-link
                :to="{ name: 'customer', params: { customerId: customer.id } }"
              >
                {{ customer.last_name }}
              </router-link>
            </div>
          </td>
          <td data-label="Prénom">
            <div>
              <router-link
                :to="{
                  name: 'customer-admin',
                  params: { customerId: customer.id },
                }"
              >
                {{ customer.first_name }}
              </router-link>
            </div>
          </td>
          <td data-label="Email">
            <div>{{ customer.email }}</div>
          </td>
          <td data-label="Inscrit depuis le">
            <div>{{ customer.inscription_date }}</div>
          </td>
          <td data-label="Dernière livraison">
            <div>
              <router-link
                :to="{
                  name: 'order-admin',
                  params: {
                    orderId: lastOrderCustomer(customer.id)
                  },
                }"
              >
                {{ customer.last_order_date }}
              </router-link>
            </div>
          </td>
          <td>
            <router-link
              :to="{
                name: 'modification-customer-admin',
                params: { customerId: customer.id },
              }"
            >
              <i class="fas fa-edit"></i>
            </router-link>
          </td>
          <td data-label="Supprimer">
            <div class="delete" v-on:click="deleteCustomer(customer)">
              <i class="fas fa-times"></i>
            </div>
          </td>
        </tr>
      </tbody>
    </table>
  </section>
</template>

<script>
export default {
  name: "list-customers",
  beforeCreate: function () {
    this.$store.dispatch("ajaxCustomers");
    this.$store.dispatch("ajaxOrders");
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
    deleteCustomer(customer) {
      this.$store.commit("deleteCustomer", customer);
    },
    lastOrderCustomer(customerId){
        let lastOrderCustomer = [];
        for(const order of this.orders){
            if(order.customer == customerId){ 
                lastOrderCustomer.push(order)
            }
        }
        return lastOrderCustomer.length > 0 ? lastOrderCustomer[lastOrderCustomer.length - 1].id : null
    }
  },
};
</script>