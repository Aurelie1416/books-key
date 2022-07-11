<template>
  <div>
    <customer-information></customer-information>
    <router-link
      :to="{
        name: 'creation-order',
        params: { customerId: this.$route.params.customerId },
      }"
      >Créer une commande</router-link
    >
    <list-orders-by-customer></list-orders-by-customer>
  </div>
</template>
<script>
import CustomerInformation from "../../../components/customer/CustomerInformation.vue";
import ListOrdersByCustomer from "../../../components/ListOrdersByCustomer.vue";
export default {
  name: "page-customer-admin",
  components: {
    CustomerInformation,
    ListOrdersByCustomer,
  },
  computeds: {
    customerId() {
      return this.$route.params.customerId;
    },
  },
  // methods: {
  //   goBack() {
  //     window.history.length > 1 ? this.$router.go(-1) : this.$router.push('/')
  //   }
  // }
};
</script>