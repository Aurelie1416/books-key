<template>
    <div id="dashboard_review_sales">
        <section>
            <table cellspacing="0">
                <caption>Bilan des ventes</caption>
                <thead>
                    <tr>
                        <th scope="col">Nombres d'inscrits</th>
                        <th scope="col">Nombre de livres</th>
                        <th scope="col">Vente du  jour</th>
                        <th scope="col">Vente de la semaine</th>
                        <th scope="col">Vente du mois</th>
                        <th scope="col">Vente de l'année</th>
                        <th scope="col">Nombre de vente totale</th>
                        <th scope="col">Panier moyen</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td data-label="Nombre d'inscrit">10</td>
                        <td data-label="Nombre de livres">10</td>
                        <td data-label="Vente du jour">10</td>
                        <td data-label="Vente de la semaine ">10</td>
                        <td data-label="Vente du mois">10</td>
                        <td data-label="Vente de l'année">10</td>
                        <td data-label="Nombre de vente total">10</td>
                        <td data-label="Panier moyen">10</td>
                    </tr>
                </tbody>
            </table>
        </section>
    </div>
</template>

<script>
  export default {
    name: 'dashboard-review-sales',
  }
</script>