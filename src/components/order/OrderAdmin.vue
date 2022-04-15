<template>
  <section>
    <h2>Numéro de commande : {{ order.number_order }}</h2>
    <h3>Montant de la commande : {{ order.bill }}&euro;</h3>
    <table cellspacing="0">
      <caption>
        Suivi de commande
      </caption>
      <thead>
        <tr>
          <th>Statut</th>
          <th>Date de commande</th>
          <th>Date d'envoie</th>
          <th>Date de livraison</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td
            data-label="Statut"
            v-bind:class="[
              { ongoing: ongoing(order.status) },
              { cancelled: cancelled(order.status) },
              { delivered: delivered(order.status) },
            ]"
          >
            <div>{{ order.status }}</div>
          </td>
          <td data-label="Date de commmande">
            <div>{{ order.creation_date }}</div>
          </td>
          <td data-label="Date d'envoi">
            <div>{{ order.sending_date }}</div>
          </td>
          <td data-label="Date de livraison">
            <div>{{ order.delivery_date }}</div>
          </td>
        </tr>
      </tbody>
    </table>
  </section>
</template>

<script>
export default {
  name: "order-admin",
  props: {
    order: Object,
  },
  methods: {
    delivered(value) {
      if (value == "livrée") {
        return true;
      }
    },
    cancelled(value) {
      if (value == "annulée") {
        return true;
      }
    },
    ongoing(value) {
      if (value == "en cours") {
        return true;
      }
    },
  },
};
</script>