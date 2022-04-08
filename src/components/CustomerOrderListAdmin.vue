<template>
    <section>
        <!-- <table cellspacing="0">
            <caption>Liste des commandes</caption>
            <thead>
                <tr>
                    <th scope="col" v-for="column in columns" :key="column">{{column}}</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="order in orders" :key="order.id">
                    <td v-if="order.customer == customer_id" data-label="Date">{{order.creation_date}}</td>
                    <td v-if="order.customer == customer_id" data-label="Numéro de Commande">
                        <a href="order_admin.html">{{order.number_order}}</a>
                    </td>
                    <td v-if="order.customer == customer_id" data-label="Status" class="ongoing">{{order.status}}</td>
                </tr>
            </tbody>
        </table> -->
    </section>
</template>

<script>
  export default {
        name: 'customer-order-list-admin',
        // data: function(){
        //     return{
        //         columns: this.$store.state.columnOrder,
        //         orders: this.$store.state.orders,
        //         customer_id: this.$route.params.customerId + 1
        //     }
        // },
        // created: function(){
        //     this.$store.dispatch('ajaxOrders');
        // },
    }
</script>