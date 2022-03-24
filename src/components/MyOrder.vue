<template>
    <section>
        <h2>Numéro de commande : {{order.number_order}}</h2>
            <h3>Montant de la commande : {{order.bill}}&euro;</h3>
            <table cellspacing="0">
                <caption>Suivi de commande</caption>
                <thead>
                    <tr>
                        <th v-for="column in columns" :key="column">
                        {{ column }}
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td data-label="Status" class="ongoing">
                            <div>{{order.status}}</div>  
                        </td>
                        <td data-label="Date de commmande">
                            <div>{{order.creation_date}}</div> 
                        </td>
                        <td data-label="Date d'envoi">
                            <div>{{order.sending_date}}</div> 
                        </td>
                        <td data-label="Date de livraison">
                            <div>{{order.delivery_date}}</div> 
                        </td>
                    </tr>
                </tbody>
            </table>
    </section>
</template>

<script>
  import store from '../store/index'

  export default{
        name: 'my-order',
        store: store,
        props: {
            order: Object
        },
        data: function(){
            return{
                columns: this.$store.state.columnOrderFollowing
            }
        },
    }
</script>