<template>
    <div id="dashboard_chart">
        <section>

            <div id="chart_legend">
                <ul class="charts-css legend legend-inline legend-square">
                    <li> Vente </li> 
                    <li> Client </li>
                </ul> 
                <table class="charts-css column multiple show-labels data-spacing-5 datasets-spacing-1" id="chart">
                    <caption> Evolution des ventes et des clients </caption> 
                    <tbody>
                        <tr>
                            <th scope="row"> 2017 </th> 
                            <td style="--size:calc( 20 / 100 );">
                                <span class="data"> 20 </span>
                            </td> 
                            <td style="--size:calc( 40 / 100 );">
                                <span class="data"> 40 </span>
                            </td>
                        </tr> 
                        <tr>
                            <th scope="row"> 2018 </th> 
                            <td style="--size:calc( 30 / 100 );">
                                <span class="data"> 30 </span>
                            </td> 
                            <td style="--size:calc( 40 / 100 );">
                                <span class="data"> 40 </span>
                            </td>
                        </tr> 
                        <tr>
                            <th scope="row"> 2019 </th> 
                            <td style="--size:calc( 50 / 100 );">
                                <span class="data"> 50 </span>
                            </td> <td style="--size:calc( 60 / 100 );">
                                <span class="data"> 60 </span>
                            </td>
                        </tr> 
                        <tr>
                            <th scope="row"> 2020 </th> 
                            <td style="--size:calc( 75 / 100 );">
                                <span class="data"> 75 </span>
                            </td> 
                            <td style="--size:calc( 75 / 100 );">
                                <span class="data"> 75 </span>
                            </td>
                        </tr> 
                        <tr>
                            <th scope="row"> 2021 </th> 
                            <td style="--size:calc( 100 / 100 );">
                                <span class="data"> 100 </span>
                            </td> 
                            <td style="--size:calc( 90 / 100 );">
                                <span class="data"> 90 </span>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>
    </div>
</template>

<script>
  export default {
    name: 'dashboard-chart',
  }
</script>