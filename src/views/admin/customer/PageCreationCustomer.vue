<template>
<section>
  <h2>Inscription d'un client</h2>
  <creation-customer></creation-customer>
</section>
    
</template>
<script>
import CreationCustomer from '../../../components/customer/CreationCustomer.vue'
export default {
  name: 'page-inscription-customer',
  components: {
    CreationCustomer
  }
}
</script>