import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {
    path: '/about',
    name: 'About',
    component: () => import('../views/About.vue')
  },
  {
    path: '/book/:bookId',
    name: 'book',
    component: () => import('../views/PageBook.vue')
  },
  {
    path: '/book/:bookId',
    name: 'book-Admin',
    component: () => import('../views/PageAdminBook.vue')
  },
  {
    path: '/cart',
    name: 'cart',
    component: () => import('../views/PageCart.vue')
  },
  {
    path: '/books',
    name: 'books',
    component: () => import('../views/PageBooks.vue')
  },
  {
    path: '/admin/books',
    name: 'books-Admin',
    component: () => import('../views/PageAdminBooks.vue')
  },
  {
    path: '/creation-article',
    name: 'creation-Article',
    component: () => import('../views/PageCreationArticle.vue')
  },
  {
    path: '/modification-article/:bookId',
    name: 'modification-Article',
    component: () => import('../views/PageModificationArticle.vue')
  },
  {
    path: '/inscription',
    name: 'inscription',
    component: () => import('../views/PageInscription.vue')
  },
  {
    path: '/connexion',
    name: 'connexion',
    component: () => import('../views/PageConnexion.vue')
  },
  {
    path: '/dashboard',
    name: 'dashboard',
    component: () => import('../views/PageDashboard.vue')
  },
  {
    path: '/customers',
    name: 'customers',
    component: () => import('../views/PageCustomers.vue')
  },
  {
    path: '/my-account/:customerId',
    name: 'customer',
    component: () => import('../views/PageCustomer.vue')
  },
  {
    path: '/modify-my-account/:customerId',
    name: 'modify-Customer',
    component: () => import('../views/PageModifyCustomer.vue')
  },
  {
    path: '/customer/:customerId',
    name: 'customer-admin',
    component: () => import('../views/PageCustomerAdmin.vue')
  },
  {
    path: '/orders',
    name: 'orders',
    component: () => import('../views/PageOrders.vue')
  },
  {
    path: '/archives',
    name: 'archives',
    component: () => import('../views/PageArchives.vue')
  },
  {
    path: '/order/:orderId',
    name: 'order-admin',
    component: () => import('../views/PageOrderAdmin.vue')
  },
  // {
  //   path: '/about',
  //   name: 'About',
  //   component: () => import(/* webpackChunkName: "about" */ '../views/About.vue')
  // },
  // {
  //   path: '/about',
  //   name: 'About',
  //   component: () => import(/* webpackChunkName: "about" */ '../views/About.vue')
  // },
  // {
  //   path: '/about',
  //   name: 'About',
  //   component: () => import(/* webpackChunkName: "about" */ '../views/About.vue')
  // },
  // {
  //   path: '/about',
  //   name: 'About',
  //   component: () => import(/* webpackChunkName: "about" */ '../views/About.vue')
  // },
  // {
  //   path: '/about',
  //   name: 'About',
  //   component: () => import(/* webpackChunkName: "about" */ '../views/About.vue')
  // },
  // {
  //   path: '/about',
  //   name: 'About',
  //   component: () => import(/* webpackChunkName: "about" */ '../views/About.vue')
  // },
  // {
  //   path: '/about',
  //   name: 'About',
  //   component: () => import(/* webpackChunkName: "about" */ '../views/About.vue')
  // },
  // {
  //   path: '/about',
  //   name: 'About',
  //   component: () => import(/* webpackChunkName: "about" */ '../views/About.vue')
  // },
  // {
  //   path: '/about',
  //   name: 'About',
  //   component: () => import(/* webpackChunkName: "about" */ '../views/About.vue')
  // },

]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
