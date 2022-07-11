<template>
<section>
    <h2>Création d'un groupe d'écrivain</h2>
  <creation-group-writers></creation-group-writers>
</section>
    
</template>
<script>
import CreationGroupWriters from '../components/CreationGroupWriters.vue'
export default {
  name: 'page-creation-group-writers',
  components: {
    CreationGroupWriters
  }
}
</script>