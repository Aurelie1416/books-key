<template>
<div id="complete_dashboard">
    <h2>{{ dateOfTheDay() }}</h2>
    <dashboard-review-sales></dashboard-review-sales>
    <dashboard-chart></dashboard-chart>
    <dashboard-sales-by-customer></dashboard-sales-by-customer>
</div>
</template>
<script>
import DashboardChart from '../../components/DashboardReviewSales.vue';
import DashboardReviewSales from '../../components/DashboardReviewSales.vue';
import DashboardSalesByCustomer from '../../components/DashboardSalesByCustomer.vue';



export default {
  name: 'page-dashboard',
  components: {
    DashboardReviewSales,
    DashboardSalesByCustomer,
    DashboardChart

  }, 
  methods: {
      dateOfTheDay() {
        const date = new Date();
        const day = date.getDate()
        const month = date.getMonth() + 1
        const year = date.getFullYear()
        return day + '/' + month + '/' + year;
      }
    }
}

</script>