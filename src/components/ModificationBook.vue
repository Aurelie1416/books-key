<template>
    <div id="ModificationArticle">
        <section>

            <h2>Ajouter un livre</h2>
            <form v-on:submit.prevent="handleSubmit" method="post" enctype="multipart/form-data">
              <div>
                <div>
                  <label v-bind:class="[{inputNeutral : !titleNeutral}]" for="title">Titre</label>
                  <input type="text" v-model="title" name="title" placeholder="Titre" id="title" v-bind:class="[{isValid : titleValid}, {isInvalid : !titleValid}, {isNeutral : titleNeutral}]">
                  <i v-if="titleValid && !titleNeutral" v-bind:style="{ display: 'initial' }" class="far fa-check-circle check"></i>
                  <i v-if="!titleValid && !titleNeutral" v-bind:style="{ display: 'initial' }" class="far fa-times-circle nocheck"></i>
                </div>
                <div>
                  <small v-bind:class="[{inputWrong : !titleValid && !titleNeutral}]">Ce champ est obligatoire</small>
                </div>
              </div>
              <div class="info_creation">
                <div>
                  <div class="writer_form">
                    <label v-bind:class="[{inputNeutral : !writerNeutral}]" for="writer">Auteur</label>
                    <input type="text" v-model="writer" name="writer" placeholder="Auteur" id="writer" v-bind:class="[{isValid : writerValid}, {isInvalid : !writerValid}, {isNeutral : writerNeutral}]">
                    <i v-if="writerValid && !writerNeutral" v-bind:style="{ display: 'initial' }" class="far fa-check-circle check"></i>
                    <i v-if="!writerValid && !writerNeutral" v-bind:style="{ display: 'initial' }" class="far fa-times-circle nocheck"></i>
                  </div>
                  <div>
                    <small v-bind:class="[{inputNeutral : !writerNeutral}]">
                      Un nom doit comporter : 
                      <span v-bind:class="[{inputWrong : !writerNumberLetters && !writerNeutral}, {inputValid : writerNumberLetters}]" class="lastNameNumberCaracters">au moins 2 caractères, </span> 
                      <span v-bind:class="[{inputWrong : !writerLetter && !writerNeutral}, {inputValid : writerLetter}]" class="lastNameLetter">uniquement des lettres</span> 
                    </small>
                  </div>
                </div>

                  <div>
                    <label class="inputNeutral" for="publication_date">Publié le</label>

                    <div class="date_form">
                        <input type="date" v-bind:class="[{isValid : dateValid}, {isInvalid : !dateValid}]" v-model="publication_date" name="publication_date" placeholder="Date de publication" id="publication_date">
                        <i class="far fa-calendar-alt publication"></i>
                        <i v-if="dateValid && !dateNeutral" v-bind:style="{ display: 'initial' }" class="far fa-check-circle check"></i>
                        <i v-if="!dateValid && dateNeutral" v-bind:style="{ display: 'initial' }" class="far fa-times-circle nocheck"></i>
                    </div>
                <div>
                  <small v-bind:class="[{inputWrong : !dateValid && !dateNeutral}]">Ce champ est obligatoire</small>
                </div>
                  </div>
              </div>
              <div>
                <div>
                  <label v-bind:class="[{inputNeutral : !editionNeutral}]" for="edition">Maison d'édition</label>
                  <input type="text" v-model="edition" name="edition" placeholder="Maison d'édition" id="edition" v-bind:class="[{isValid : editionValid}, {isInvalid : !editionValid}, {isNeutral : editionNeutral}]">
                  <i v-if="editionValid && !editionNeutral" v-bind:style="{ display: 'initial' }" class="far fa-check-circle check"></i>
                  <i v-if="!editionValid && !editionNeutral" v-bind:style="{ display: 'initial' }" class="far fa-times-circle nocheck"></i>
                </div>
                <div>
                  <small v-bind:class="[{inputWrong : !editionValid && !editionNeutral}]">Ce champ est obligatoire</small>
                </div>
              </div>
                <div class="option">
                    <div class="radio">
                        <div class="format_form">
                            <label class="inputNeutral" for="big">Grand format</label>
                            <input value="Grand format" v-model="format" type="radio" name="format" id="big" required>
                        </div>
                        <div class="format_form">
                            <label  class="inputNeutral" for="pocket">Format de poche</label>
                            <input value="Format de poche" v-model="format" type="radio" name="format" id="pocket" required>
                        </div>
                    </div>
                    <div class="info_supp">
                      <div class="more_less">
                        <label v-bind:class="[{inputNeutral : !pageNeutral}]" for="page_number">Nombre de page</label>
                        <input pattern="[0-9]" v-bind:class="[{isValid : pageValid}, {isInvalid : !pageValid && !pageNeutral}]" type="number" name="page_number" v-model="page_number" placeholder="Nombre de page" id="page_number" >
                        <div class="button_more_less">
                          <div class="more" v-on:click="changeNumber('page_number', page_number, 1)">
                            <p>+</p>
                          </div>
                          <div class="less" v-on:click="changeNumber('page_number', page_number, -1)">
                            <p>-</p>
                          </div>
                        </div> 
                      </div>
                        <div class="more_less">
                          <label v-bind:class="[{inputNeutral : !quantituNeutral}]" for="quantity">Quantité en stock</label>
                          <input pattern="[0-9]" v-bind:class="[{isValid : quantityValid}, {isInvalid : !quantityValid && !quantituNeutral}]" type="number" name="quantity" v-model="quantity" placeholder="quantité en stock" id="quantity" >
                          <div class="button_more_less">
                            <div class="more" v-on:click="changeNumber('quantity', quantity, 1)">
                              <p>+</p>
                            </div>
                            <div class="less" v-on:click="changeNumber('quantity', quantity, -1)">
                              <p>-</p>
                            </div>
                          </div>
                      </div>
                      
                      <div class="more_less">
                        <label v-bind:class="[{inputNeutral : !priceNeutral }]" for="price">Prix (en euro)</label>
                        <input v-bind:class="[{isValid : priceValid}, {isInvalid : !priceValid && !priceNeutral}]" type="number" v-model="price" name="price" placeholder="Prix (en euro)" id="price" >
                        <div class="button_more_less">
                          <div class="more" v-on:click="changeNumber('price', price, 1)">
                            <p>+</p>
                          </div>
                          <div class="less" v-on:click="changeNumber('price', price, -1)">
                            <p>-</p>
                          </div>
                        </div>
                      </div>
                    </div>
                </div>
                <div class="img">
                    <input v-on:change="addImage" ref="upload" accept="image/jpeg, image/png, image/jpg" type="file" name="img" placeholder="Image (facultatif)" id="img_logo">
                    <div>
                        <div class="img_label">
                            <i class="fas fa-image"></i>                        
                        </div>
                        <div class="img_input" v-bind:class="[{isValid : imageValid}, {isInvalid : !imageValid && !imageNeutral}, {isNeutral : imageNeutral}]">
                            <p>{{imageName}}</p> 
                        </div>
                        <i v-if="imageValid && !imageNeutral" v-bind:style="{ display: 'initial' }" class="far fa-check-circle check" id="check_card"></i>
                        <i v-if="!imageValid && !imageNeutral" v-bind:style="{ display: 'initial' }" class="far fa-times-circle nocheck" id="nocheck_card"></i>
                    </div>
                    <div>
                      <small v-bind:class="[{inputWrong : imageNeutral}, {inputNeutral : !imageNeutral}]">Ce champs est obligatoire</small>
                      <small v-bind:class="[{inputWrong : !imageValid && !imageNeutral}, {inputNeutral : imageNeutral}]">Seule les images de type PNG, JPEG ou JPG sont acceptées</small>
                   </div>
                </div>
                <textarea v-bind:class="[{isValid : summaryValid}, {isInvalid : !summaryValid && !summaryNeutral}, {isNeutral : summaryNeutral}]" type="text" v-model="summary" name="summary" placeholder="Synopsis" rows="10" ></textarea>
                <div>
                  <small v-bind:class="[{inputWrong : !summaryValid && !summaryNeutral}]">Ce champ est obligatoire</small>
                </div>
                <button :disabled="!formValid" v-bind:class="[{button_hover : formValid}]">Valider</button>
            </form>
        </section>
    </div>
</template>

<script>
  import store from '../store/index'
  export default {
    name: 'creation-article',
    store: store,
    data: function(){
      return{
          title: this.$store.state.books[this.$route.params.bookId].title,
          writer: this.$store.state.books[this.$route.params.bookId].writer,
          publication_date: this.$store.state.books[this.$route.params.bookId].publication_date,
          edition: this.$store.state.books[this.$route.params.bookId].edition,
          format: this.$store.state.books[this.$route.params.bookId].format,
          page_number: this.$store.state.books[this.$route.params.bookId].page_number,
          quantity: this.$store.state.books[this.$route.params.bookId].quantity,
          price: this.$store.state.books[this.$route.params.bookId].price,
          summary: this.$store.state.books[this.$route.params.bookId].summary,
          image: null,
          imageName: this.$store.state.books[this.$route.params.bookId].image
      }
    },
    created: function(){
        this.$store.dispatch('ajaxBooks');
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
      addImage(event) {
       console.log(event.target.files, event.target.files[0].name)
        try {
          this.imageName = event.target.files[0].name;
        } catch (error) {
          console.error(error);
        }
      },
      changeNumber(attribute, number, modificator){
          console.log(this.title)
        if(number == null){
          number = 1;
        }
        else if(modificator > 0 || (modificator < 0 && parseInt(number) > 1)){
            number = parseInt(number) + modificator;
        }
        this[attribute] = number;
      },
    },
    computed: {
      titleValid: function(){
          if(this.title != null){
            return this.title.length > 0
          }
        return false
      },
      titleNeutral: function(){
        return this.title == null
      },
      writerLetter: function(){
        if(this.writer != null){
          return this.writer.match(/^[A-Za-záàâäãåçéèêëíìîïñóòôöõúùûüýÿæœÁÀÂÄÃÅÇÉÈÊËÍÌÎÏÑÓÒÔÖÕÚÙÛÜÝŸÆŒ][-,a-záàâäãåçéèêëíìîïñóòôöõúùûüýÿæœÁÀÂÄÃÅÇÉÈÊËÍÌÎÏÑÓÒÔÖÕÚÙÛÜÝŸÆŒ. ']+[ ]*$/) && !this.writer.match(/[0-9]/) && this.writer.length > 0
        }
        return false
      },
      writerNumberLetters: function(){
        if(this.writer != null){
          return this.writer.length >= 2
        }
        return false
      },
      writerValid: function(){
        if(this.writer != null){
          return this.writerLetter && this.writerNumberLetters
        }
        return false
      },
      writerNeutral: function(){
        return this.writer == null
      },
      editionValid: function(){
        if(this.edition != null){
          return this.edition.length > 0
        }
        return false
      },
      editionNeutral: function(){
        return this.edition == null
      },
      dateValid: function(){
        if(this.publication_date != null){
          return (new Date(this.publication_date) !== "Invalid Date") && !isNaN(new Date(this.publication_date))
        }
        return false
      },
      dateNeutral: function(){
        return this.publication_date == ""
      },
      imageValid: function(){
        if(this.imageName != null){
          console.log('true', this.imageName.match(/[/.](gif|jpg|jpeg|png)$/i))
          return this.imageName.match(/[/.](gif|jpg|jpeg|png)$/i)
        }
        console.log('wrong', this.imageName)
        return false
      },
      imageNeutral: function(){
        return this.image == null
      },
      summaryValid : function(){
        if(this.summary != null){
          return this.summary.trim().split(/\s+/).length >= 3
        }
        return false
      },
      summaryNeutral: function(){
        return this.summary == null
      }, 
      formValid: function(){
        return this.imageValid 
      },
      priceNeutral: function(){
        return this.price == null
      },
      priceValid: function(){
        return this.price > 0
      },
      pageNeutral: function(){
        return this.page_number == null
      },
      pageValid: function(){
        return this.page_number >= 5 && this.page_number.toString().match(/^[0-9]*$/)
      },
      quantituNeutral: function(){
        return this.quantity == null
      },
      quantityValid: function(){
        return this.quantity > 0 && this.quantity.toString().match(/^[0-9]*$/)
      } 
    },
    watch: {
    }
  }
</script>