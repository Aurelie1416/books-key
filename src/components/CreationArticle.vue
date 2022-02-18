<template>
    <div id="creationArticle">
                <section>

            <h2>Ajouter un livre</h2>
            <form>
                <div>
                    <input type="text" v-model="title" name="title" placeholder="Titre" id="title" >
                </div>
                <div class="info_creation">
                    <div class="writer_form">
                        <input type="text" v-model="writer" name="writer" placeholder="Auteur" id="writer" >
                    </div>
                    <div class="edit">
                        <p>Edité le </p>
                        <div class="date_form">
                            <input type="date" v-model="publication_date" name="publication_date" placeholder="Date de publication" id="publication_date" >
                            <i class="far fa-calendar-alt publication"></i>
                        </div>
                    </div>
                </div>
                <div>
                    <input type="text" v-model="edition" name="edition" placeholder="Edition" id="edition" >
                </div>
                <div class="option">
                    <div class="radio">
                        <div class="format_form">
                            <label for="big">Grand format</label>
                            <input type="radio" name="format" id="big">
                        </div>
                        <div class="format_form">
                            <label for="pocket">Format de poche</label>
                            <input type="radio" name="format" id="pocket">
                        </div>
                    </div>
                    <div class="info_supp">
                      <div class="more_less">
                        <input type="number" name="page_number" v-model="page_number" placeholder="Nombre de page" id="number_page" >
                        <div class="button_more_less">
                          <div class="more">
                            <p>+</p>
                          </div>
                          <div class="less">
                            <p>-</p>
                          </div>
                        </div>
                      </div>
                      <div class="more_less">
                        <input type="number" v-model="price" name="price" placeholder="Prix (en euro)" id="price" >
                        <div class="button_more_less">
                          <div class="more">
                            <p>+</p>
                          </div>
                          <div class="less">
                            <p>-</p>
                          </div>
                        </div>
                      </div>
                    </div>
                </div>
                <div class="img">
                    <input type="file" name="img" placeholder="Image (facultatif)" id="img_logo">
                    <div>
                        <div class="img_label">
                            <i class="fas fa-image"></i>                        
                        </div>
                        <div class="img_input">
                            <p>Première de couverture</p> 
                        </div>
                    </div>
                </div>
                <textarea type="text" v-model="summary" name="summary" placeholder="Synopsis" rows="10" ></textarea>
                <button @click="handleSubmit($event)">Valider</button>
            </form>
        </section>
    </div>
</template>

<script>
  export default {
    name: 'creation-article',
    data: function(){
      return{
          title: "",
          writer: "",
          publication_date: "",
          edition: "",
          page_number: "",
          price: "",
          summary: ""
      }
    },
    methods: {
      handleSubmit(event){
        event.preventDefault(event);
        const form = event.target;
        const formData = new FormData(form);

        console.log('handlesubmit', event, event.target.action)
        console.log(JSON.stringify(Object.fromEntries(formData.entries())))

        fetch('/list/books', {
            method: 'POST', 
            body : JSON.stringify(Object.fromEntries(formData.entries()))
        });
      }
    }
  }
</script>