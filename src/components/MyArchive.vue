<template>
    <section>
        <table cellspacing="0">
                <caption>Archive des commandes</caption>
                <thead>
                    <tr>
                        <th v-for="column in columns" :key="column">
                        {{ column }}
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="order in orders" :key="order.id" >
                        <td data-label="Date">{{order.creation_date}}</td>
                        <td data-label="Numéro de commande">
                            <router-link :to="{ name: 'order-admin', params:{orderId: order.id}}">

                            {{order.number_order}}
                            </router-link>
                        </td>
                        <td data-label="Recette">{{order.bill}}&euro;</td>
                        <td data-label="Client">
                            <div>
                                <router-link :to="{ name: 'customer', params:{customerId: order.customer}}">
                                {{customers[order.customer - 1].first_name}} {{customers[order.customer - 1].last_name}}
                                </router-link>
                            </div>
                        </td>
                        <td data-label="Status" class="ongoing">{{order.status}}</td>
                    </tr>
                </tbody>
            </table>
    </section>
</template>

<script>
  import store from '../store/index'

  export default{
        name: 'my-archive',
        store: store,
        data: function(){
            return{
                orders: this.$store.state.orders,
                columns: this.$store.state.columnOrdersAdmin,
                customers: this.$store.state.customers
            }
        },
        created: function(){
        this.$store.dispatch('ajaxOrders');
        this.$store.dispatch('ajaxCustomers')
        },
    }
</script>