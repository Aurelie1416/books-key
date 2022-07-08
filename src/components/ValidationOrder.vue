<template>
    <div id="validationOrder">
        <section id="buy">

            <h2>Je commande !</h2>
            <form method="POST" >
                <payment-method v-if="$route.name.match('cart')"></payment-method>
                <shipping-information></shipping-information>
                <button disabled>Validez votre commande</button>
            </form>
            <div class="test"></div>
        </section>
    </div>
</template>

<script>
 import PaymentMethod from './PaymentMethod.vue'
 import ShippingInformation from './ShippingInformation.vue'
  export default {
    name: 'validation-order',
    components: {
        PaymentMethod,
        ShippingInformation
      },
    methods: {
      handleSubmit(event){
    
        event.preventDefault();
        const form = event.target;
        const formData = new FormData(form);
        
        
        formData.append('img', document.querySelector('#img_logo').files[0] );
console.log('image', document.querySelector('#img_logo').files[0])
console.log('handlesubmit', event, event.target.action)
        console.log('image object', formData['img'])
        console.log('json', JSON.stringify(Object.fromEntries(formData.entries())))

      fetch('/api/order', {
            method: 'POST', 
             headers: {
              'Accept': 'application/json',
              'Content-Type': 'multipart/form-data'
          },
            body : JSON.stringify(Object.fromEntries(formData.entries())),
        })
      },
    }
  }
</script>