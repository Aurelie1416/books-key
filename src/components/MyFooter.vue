<template>
    <div id="footer">
        <footer class="body">
          <hr>
          <p> &copy; APFormation {{ dateYear() }}, All Right Reserved</p>
          <div>
              <a href="https://fr-fr.facebook.com/" target="_blank">
                  <i class="fab fa-facebook facebook"></i>
              </a>
              <a href="https://twitter.com/?lang=fr" target="_blank">
                  <i class="fab fa-twitter-square twitter"></i>            
              </a>
              <a href="https://www.tumblr.com/" target="_blank">
                  <i class="fab fa-tumblr-square tumblr"></i> 
              </a>
              <div class="instagram">
                  <a href="https://www.instagram.com/?hl=fr" target="_blank">
                      <i class="fab fa-instagram instagram_color"></i>  
                  </a>
                  <a href="https://www.instagram.com/?hl=fr" target="_blank">
                      <i class="fab fa-instagram instagram_brown"></i>  
                  </a>
              </div> 
              <a href="https://www.pinterest.fr/">
                  <i class="fab fa-pinterest pinterest" target="_blank"></i>
              </a>        
          </div>
        </footer>
    </div>
</template>

<script>
  export default {
    name: 'my-footer',
    methods: {
      dateYear() {
        const date = new Date();
        const year = date.getFullYear()
        return year;
      }
    }
  }
</script>