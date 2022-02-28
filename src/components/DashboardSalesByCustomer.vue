<template>
    <div id="dashboard_sales_by_customer">
        <section>

            <table cellspacing="0">
                <caption>Ventes par client</caption>
                <thead>
                    <tr>
                        <th scope="col">Nom</th>
                        <th scope="col">Prénom</th>
                        <th scope="col">Nombre de commande</th>
                        <th scope="col">Revenu des commandes</th>
                        <th scope="col">Pannier moyen</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td data-label="Nom">BROUETTE</td>
                        <td data-label="Prénom">Jasper</td>
                        <td data-label="Nombre de commande">3</td>
                        <td data-label="Revenu des commandes">80&euro;</td>
                        <td data-label="Panier moyen">20&euro;</td>
                    </tr>
                    <tr>
                        <td data-label="Nom">BROUETTE</td>
                        <td data-label="Prénom">Toto</td>
                        <td data-label="Nombre de commande">3</td>
                        <td data-label="Revenu des commandes">80&euro;</td>
                        <td data-label="Panier moyen">20&euro;</td>
                    </tr>
                    <tr>
                        <td data-label="Nom">BROUETTE</td>
                        <td data-label="Prénom">Prosper</td>
                        <td data-label="Nombre de commande">3</td>
                        <td data-label="Revenu des commandes">80&euro;</td>
                        <td data-label="Panier moyen">20&euro;</td>
                    </tr>
                    <tr>
                        <td data-label="Nom">BROUETTE</td>
                        <td data-label="Prénom">Gertrude</td>
                        <td data-label="Nombre de commande">3</td>
                        <td data-label="Revenu des commandes">80&euro;</td>
                        <td data-label="Panier moyen">20&euro;</td>
                    </tr>
                    <tr>
                        <td data-label="Nom">BROUETTE</td>
                        <td data-label="Prénom">Pépito</td>
                        <td data-label="Nombre de commande">3</td>
                        <td data-label="Revenu des commandes">80&euro;</td>
                        <td data-label="Panier moyen">20&euro;</td>
                    </tr>
                </tbody>
            </table>
        </section>
    </div>
</template>

<script>
  export default {
    name: 'dashboard-sales-by-customer',
  }
</script>