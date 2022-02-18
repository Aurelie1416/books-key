<template>
  <div id="total_cart">
    <div v-if="books.length > 0">
      <div>
        <div>
          <input
            v-model="shippingChoice"
            type="radio"
            id="relay"
            name="delivery"
            :value="relay"
            data-deliveryrelay="relay"
            checked
          />
          <label for="relay"
            >Supplément livraison (relais colis) : {{ relay }}&euro;</label
          >
        </div>
        <div>
          <input
            v-model="shippingChoice"
            type="radio"
            id="home"
            name="delivery"
            :value="home"
            data-deliveryhome="home"
          />
          <label for="home"
            >Supplément Livraison (à domicile) : {{ home }}&euro;</label
          >
        </div>
      </div>
      <div v-if="shippingChoice > 0">
        <h3>détail :</h3>
        <ul>
          <li>Prix total de vos livres : {{ totalBooks }}&euro;</li>
          <li>supplément livraison : {{ shippingChoice }}&euro;</li>
        </ul>
      </div>
      <hr />
      <div>
        <h3>Total de votre commande :</h3>
        <h3>{{ totalLines }}&euro;</h3>
      </div>
    </div>
  </div>
</template>

<script>
export default{
      name:'total-cart',
      props: {
        books: Array
      },
      data: function(){
        return{
          shippingChoice: 0,
          relay: 5,
          home: 12,
        }
      },
      computed: {
        totalLines() {
          let total = 0;
          this.books.forEach(book => {
              total += (book.price * book.quantity);
          });
          total += this.shippingChoice;
          return total;
        }, 
        totalBooks(){
            let total = 0;
            this.books.forEach(book => {
                total += (book.price * book.quantity);
            });
            return total;
        }
      },
  };
</script>