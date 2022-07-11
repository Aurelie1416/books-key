<template>
<section>
    <h2>Création d'un écrivain</h2>
  <creation-writer></creation-writer>
</section>
    
</template>
<script>
import CreationWriter from '../../../components/writer/CreationWriter.vue'
export default {
  name: 'page-creation-writer',
  components: {
    CreationWriter
  }
}
</script>