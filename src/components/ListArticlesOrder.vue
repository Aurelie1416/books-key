<template>
    <section>

        <div id="list_article">
            <article>
                <a href="article_admin.html" class="book">
                    <img src="image/hobbit.jpg" alt="book cover">
                    <h3>Bilbo le Hobbit</h3>
                    <p>J.R.R. Tolkien</p>
                    <p>20&euro;</p>
                </a>
            </article>
            <article>
                <a href="article_admin.html" class="book">
                    <img src="image/hobbit.jpg" alt="book cover">
                    <h3>Bilbo le Hobbit</h3>
                    <p>J.R.R. Tolkien</p>
                <p>20&euro;</p>
                </a>
            </article>
            <article>
                <a href="article_admin.html" class="book">
                    <img src="image/hobbit.jpg" alt="book cover">
                    <h3>Bilbo le Hobbit broueeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeette</h3>
                    <p>J.R.R. Tolkien</p>
                    <p>20&euro;</p>
                </a>
            </article>
        </div>

    </section>
</template>

<script>
  import store from '../store/index'

  export default{
        name: 'order-list-articles',
        store: store,
        // props: {
        //     customer: Object
        // },
        // data: function(){
        //     return{
        //         columns: this.$store.state.columnCustomerOrder,
        //     }
        // }
    }
</script>