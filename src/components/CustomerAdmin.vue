<template>
    <section>
        <i class="fas fa-user-circle avatar_img"></i>
        <h2>{{first_name}} {{last_name}}</h2>
        <table cellspacing="0">
            <thead>
                <tr>
                    <th scope="col" v-for="column in columns" :key="column">{{column}}</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td data-label="email :">
                        <div>{{email}}</div>
                    </td>
                    <td data-label="Adresse :">
                        <div>
                            <p>{{street_1}}</p>
                            <p>{{street_2}}</p>
                            <p>{{postal_code}} {{city}} ({{country}})</p>
                        </div>
                    </td>
                    <td data-label="Téléphone :">
                        <div>{{phone}}</div>
                    </td>
                </tr>
            </tbody>
        </table>
    </section>
</template>

<script>
import store from '../store/index'
  export default {
        name: 'my-book',
        store: store,
        data: function(){
            return{
                columns: this.$store.state.columnCustomerAdmin,
                last_name: this.$store.state.customers[this.$route.params.customerId].last_name,
                first_name: this.$store.state.customers[this.$route.params.customerId].first_name,
                email: this.$store.state.customers[this.$route.params.customerId].email,
                phone: this.$store.state.customers[this.$route.params.customerId].phone,
                street_1: this.$store.state.customers[this.$route.params.customerId].address.street_1,
                street_2: this.$store.state.customers[this.$route.params.customerId].address.street_2,
                city: this.$store.state.customers[this.$route.params.customerId].address.city,
                postal_code: this.$store.state.customers[this.$route.params.customerId].address.postal_code,
                country: this.$store.state.customers[this.$route.params.customerId].address.country,
            }
        },
        created: function(){
            this.$store.dispatch('ajaxCustomers');
        },
        computed: {
            versionMobil: function(){
                return ""
            }
        }
    }
</script>