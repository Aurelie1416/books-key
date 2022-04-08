<template>
    <section>
        <i class="fas fa-user-circle avatar_img"></i>
        <h2>{{customer.first_name}} {{customer.last_name}}</h2>
        <table cellspacing="0">
            <thead>
                <tr>
                    <th scope="col">Email</th>
                    <th scope="col">Adresse</th>
                    <th scope="col">Téléphone</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td data-label="email :">
                        <div>{{customer.email}}</div>
                    </td>
                    <td data-label="Adresse :">
                        <div>
                            <p>{{customer.address.street_1}}</p>
                            <p>{{customer.address.street_2}}</p>
                            <p>{{customer.address.postal_code}} {{customer.address.city}} ({{customer.address.country}})</p>
                        </div>
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
  export default {
        name: 'information-customer',
        created: function(){
            this.$store.dispatch('ajaxCustomers');
        },
        computed: {
            customer(){
                let customer = {};
                for(const customer_indiviual of this.$store.state.customers){
                    if(customer_indiviual.id == this.$route.params.customerId){
                        customer =  customer_indiviual;
                    }
                }
                return customer;
            }
        }
    }
</script>