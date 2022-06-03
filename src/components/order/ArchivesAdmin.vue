<template>
  <section>
    <div class="menu_select">
      <label v-bind:style="{ width: 125 + 'px' }">Modifier le status</label>
      <div class="boxOption">
        <input v-model="optionSelected" type="text" />
        <div class="boxArrow">
          <i class="fas fa-sort-down arrow" v-on:click="showMenuOption"></i>
        </div>
        <div>
          <p
            v-for="status in statusOrder"
            :key="status.id"
            class="option_menu"
            v-on:click="optionSelect($event)"
          >
            {{ status.status }}
          </p>
        </div>
      </div>

      <button 
        :disabled="!searchValid"
          v-bind:class="[{ buttonActive: searchValid }]"
      v-on:click="modificationStatus">Valider le changement</button>
    </div>

    <table cellspacing="0" class="table">
      <caption>
        Listes des commandes
      </caption>
      <thead>
        <tr>
          <th>Numéro de commande</th>
          <th>Date de commande</th>
          <th>Recette</th>
          <th>Client</th>
          <th>Statut</th>
          <th></th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td data-label="Numéro de commande">
            <div><input type="text" /></div>
          </td>
          <td data-label="Date de commande">
            <div>
              de
              <date-picker
                v-model="from_date"
                type="date"
                valueType="format"
                :language="lang"
                typeable="true"
                format="DD/MM/YYYY"
              ></date-picker>
              <br />
              à
              <date-picker
                v-model="to_date"
                type="date"
                valueType="format"
                :language="lang"
                typeable="true"
                format="DD/MM/YYYY"
              ></date-picker>
            </div>
          </td>
          <td data-label="Recette">
            <div>
              de <input type="number" />
              <br />
              à <input type="number" />
            </div>
          </td>
          <td data-label="Client">
            <div><input type="text" /></div>
          </td>
          <td data-label="Status">
            <div><input type="text" /></div>
          </td>
          <td class="search">
            <button class="buttonActive"><i class="fas fa-search"></i></button>
          </td>
        </tr>
        <tr v-for="order in orders" :key="order.id">
          <td data-label="Numéro de commande">
            <router-link
              :to="{ name: 'order-admin', params: { orderId: order.id } }"
            >
              {{ order.number_order }}
            </router-link>
          </td>
          <td data-label="Date de commande">{{ order.creation_date }}</td>
          <td data-label="Recette">{{ order.bill }}&euro;</td>
          <td data-label="Client">
            <div v-for="customer in customers" :key="customer.id">
              <router-link
                v-if="customer.id == order.customer"
                :to="{
                  name: 'customer-admin',
                  params: { customerId: order.customer },
                }"
              >
                {{ customer.first_name }}
                {{ customer.last_name }}
              </router-link>
            </div>
          </td>
          <td
            colspan="2"
            data-label="Statut"
            v-bind:class="[
              { ongoing: ongoing(order.status) },
              { cancelled: cancelled(order.status) },
              { delivered: delivered(order.status) },
            ]"
          >
            <div
              v-bind:style="[displayStyle, justifyContentStyle]"
              v-for="status in statusOrder"
              :key="status.id"
            >
              <p
                v-bind:style="{ margin: '5px 5px' }"
                v-if="status.id == order.status"
              >
                {{ status.status }}
              </p>
              <input
                v-bind:value="order.id"
                v-if="!cancelled(order.status) && status.id == order.status"
                v-model="checkedStatus"
                type="checkbox"
                name="status"
                id="status"
              />
            </div>
          </td>
        </tr>
      </tbody>
    </table>
  </section>
</template>

<script>
import DatePicker from "vue2-datepicker";
import "vue2-datepicker/index.css";
import "vue2-datepicker/locale/fr";
export default {
  name: "archives-admin",
  components: { DatePicker },
  beforeCreate: function () {
    this.$store.dispatch("ajaxOrders");
    this.$store.dispatch("ajaxCustomers");
    this.$store.dispatch("ajaxStatusOrder");
  },
  data: function () {
    return {
      optionSelected: "",
      checkedStatus: [],
      from_date: "",
      to_date: "",
      lang: {
        formatLocale: {
          firstDayOfWeek: 1,
        },
      },
      displayStyle: {
        display: "flex",
      },
      justifyContentStyle: {
        justifyContent: "right",
      },
    };
  },
  computed: {
    orders() {
      return this.$store.state.orders;
    },
    customers() {
      return this.$store.state.customers;
    },
    statusOrder() {
      return this.$store.state.statusOrder;
    },
    searchValid(){
      var arrayStatus = []
      for(const status of this.statusOrder){
        arrayStatus.push(status.status)
      }
      if(this.checkedStatus.length > 0 && arrayStatus.includes(this.optionSelected)){
return true
      }
      return false
    },
  },
  methods: {
    delivered(value) {
      if (value == 4) {
        return true;
      }
    },
    cancelled(value) {
      if (value == 3 || value == 5) {
        return true;
      }
    },
    ongoing(value) {
      if (value == 1 || value == 2) {
        return true;
      }
    },
    optionSelect(event) {
      this.optionSelected = event.target.innerText;
    },
    modificationStatus() {
      console.log(this.optionSelected);
      if (this.checkedStatus.length > 0) {
        for (const order of this.orders) {
          for (const checked of this.checkedStatus) {
            if (order.id == checked) {
              for (const status of this.statusOrder) {
                if (this.optionSelected == status.status) {
                  order.status = status.id;
                }
              }
            }
          }
        }
        this.checkedStatus.length = 0;
      }
    },
    showMenuOption() {
      let arrow = document.querySelector(".arrow");
      let options = document.querySelectorAll(".option_menu");
      let number = 1;
      let zIndex = options.length;

      if (arrow.style.transform == "rotateZ(-180deg) translateX(-5px)") {
        arrow.style.transform = "rotateZ(0deg) translateX(5px)";
        // options.style.borderBottom = ""
        for (const option of options) {
          option.style.height = "0px";
          option.style.transition =
            "height 200ms linear 450ms, top 500ms linear, border-bottom 0ms linear 700ms";
          option.style.top = "20px";
          number = 1;
          option.style.borderBottom = "solid 1px transparent";
        }
      } else {
        arrow.style.transform = "rotateZ(-180deg) translateX(-5px)";
        // options.style.borderBottom = "solid 3px #645E4E"
        for (const option of options) {
          option.style.display = "flex";
          option.style.height = "30px";
          option.style.top = number * (20 + 1) + "px";
          option.style.transition =
            "all 500ms ease-in-out, background-color 0s";
          option.style.zIndex = 100 + zIndex;
          option.style.borderBottom = "solid 1px #645E4E";
          zIndex--;
          number++;
        }
      }
    },
  },
};
</script>