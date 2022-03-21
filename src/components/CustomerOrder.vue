<template>
    <section>
            <table cellspacing="0">
                <thead>
                    <tr>
                        <th v-for="column in columns" :key="column">
                        {{ column }}
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td data-label="Client">
                            <div>
                                <router-link :to="{ name: 'customer-admin', params:{customerId: customer.id - 1}}">
                                {{customer.first_name}} {{customer.last_name}}
                                </router-link>
                            </div> 
                        </td>
                        <td class="mail" data-label="Adresse de livraison">
                            <div>
                                <p>{{customer.address.street_1}}</p>
                                <p>{{customer.address.street_2}}</p>
                                <p>{{customer.address.postalCode}} {{customer.address.city}} ({{customer.address.country}})</p>
                            </div>
                        </td>
                        <td data-label="Email :">
                            <div>{{customer.email}}</div>
                        </td>
                        <td data-label="Téléphone :">
                            <div>{{customer.phone}}</div>
                        </td>
                    </tr>
                </tbody>
            </table>
    </section>
</template>

<script>
  import store from '../store/index'

  export default{
        name: 'order-customer-admin',
        store: store,
        props: {
            customer: Object
        },
        data: function(){
            return{
                columns: this.$store.state.columnOrderCustomer,
            }
        }
    }
</script>