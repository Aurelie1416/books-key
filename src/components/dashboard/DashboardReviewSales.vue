<template>
  <div id="dashboard_review_sales">
    <section>
      <table cellspacing="0">
        <caption>
          Bilan des ventes
        </caption>
        <thead>
          <tr>
            <th scope="col">Nombres d'inscrits</th>
            <th scope="col">Nombre de livres</th>
            <th scope="col">Vente du jour</th>
            <th scope="col">Vente de la semaine</th>
            <th scope="col">Vente du mois</th>
            <th scope="col">Vente de l'année</th>
            <th scope="col">Nombre de vente totale</th>
            <th scope="col">Panier moyen</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td data-label="Nombre d'inscrit">{{ customers.length }}</td>
            <td data-label="Nombre de livres">{{ books.length }}</td>
            <td data-label="Vente du jour">1</td>
            <td data-label="Vente de la semaine ">2</td>
            <td data-label="Vente du mois">5</td>
            <td data-label="Vente de l'année">10</td>
            <td data-label="Nombre de vente total">{{ orders.length }}</td>
            <td data-label="Panier moyen">{{ averageCart }}</td>
          </tr>
        </tbody>
      </table>
    </section>
  </div>
</template>

<script>
export default {
  name: "dashboard-review-sales",
  created: function () {
    this.$store.dispatch("ajaxOrders");
    this.$store.dispatch("ajaxCustomers");
    this.$store.dispatch("ajaxBooks");
  },
  computed: {
    books() {
      return this.$store.state.books;
    },
    orders() {
      return this.$store.state.orders; 
    },
    customers() {
      return this.$store.state.customers;
    },
    averageCart() {
      var averageCart = 0;

      if (this.orders.length > 0) {
        for (const order of this.orders) {

          averageCart += parseFloat(order.bill);
        }
        averageCart = averageCart / parseFloat(this.orders.length);
      }
      return averageCart.toFixed(2)+" €";
    },
  },
};
</script>