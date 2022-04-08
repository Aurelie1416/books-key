<template>
    <section>
        <table cellspacing="0">
                <caption>Liste des livres</caption>
                <thead>
                    <tr>
                        <th v-for="column in columns" :key="column">
                        {{ column }}
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="customer in customers" :key="customer.id" >
                        <td>
                            <router-link :to="{ name: 'customer', params:{customerId: customer.id}}">
                                <i class="fas fa-user-circle avatar_img"></i>
                            </router-link>
                        </td>
                        <td data-label="Nom">
                            <div>
                                <router-link :to="{ name: 'customer', params:{customerId: customer.id}}">
                                    {{customer.last_name}}
                                </router-link>
                            </div>
                        </td>
                        <td data-label="Prénom">
                            <div>
                                <router-link :to="{ name: 'customer-admin', params:{customerId: customer.id}}">
                                {{customer.first_name}}
                                </router-link>
                            </div> 
                        </td>
                        <td data-label="Date d'inscription">
                            <div>{{customer.inscription_date}}</div> 
                        </td>
                        <td data-label="Dernière livraison">
                            <div>
                                <a href="order_admin.html">{{customer.last_order_date}}</a>
                            </div>
                        </td>
                        <td data-label="Supprimer">
                            <div id="delete" v-on:click="deleteCustomer(customer)">
                                <i class="fas fa-times"></i>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
    </section>
</template>

<script>
  import store from '../store/index'

  export default{
        name: 'list-customers',
        store: store,
        data: function(){
            return{
                customers: this.$store.state.customers,
                columns: this.$store.state.columnCustomers
            }
        },
        created: function(){
        this.$store.dispatch('ajaxCustomers');
        },
        methods: {
          deleteCustomer(customer) {
              this.customers.splice(this.customers.indexOf(customer), 1);
          },
        }
    }
</script>