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
    component: () => import('../views/customer/book/PageBooks.vue')
  },
  {
    path: '/books',
    name: 'books-Admin',
    component: () => import('../views/admin/book/PageBooks.vue')
  },
  {
    path: '/creation-book',
    name: 'creation-book',
    component: () => import('../views/admin/book/PageCreationBook.vue')
  },
  {
    path: '/modification-account/:customerId',
    name: 'modification-customer-admin',
    component: () => import('../views/PageModificationCustomer.vue')
  },
  {
    path: '/modification-book/:bookId',
    name: 'modification-book',
    component: () => import('../views/PageModificationBook.vue')
  },
  {
    path: '/inscription',
    name: 'inscription',
    component: () => import('../views/customer/log/PageInscription.vue')
  },
  {
    path: '/creation-customer',
    name: 'creation-customer',
    component: () => import('../views/admin/customer/PageCreationCustomer.vue')
  },
  {
    path: '/connexion',
    name: 'connexion',
    component: () => import('../views/customer/log/PageLogin.vue')
  },
  {
    path: '/dashboard',
    name: 'dashboard',
    component: () => import('../views/admin/PageDashboard.vue')
  },
  {
    path: '/customers',
    name: 'customers',
    component: () => import('../views/admin/customer/PageCustomers.vue')
  },
  {
    path: '/my-account/:customerId',
    name: 'customer',
    component: () => import('../views/customer/account/PageCustomer.vue')
  },
  {
    path: '/modify-my-account/:customerId',
    name: 'modify-Customer',
    component: () => import('../views/PageModifyCustomer.vue')
  },
  {
    path: '/customer/:customerId',
    name: 'customer-admin',
    component: () => import('../views/admin/customer/PageCustomer.vue')
  },
  {
    path: '/orders',
    name: 'orders-admin',
    component: () => import('../views/admin/order/PageOrders.vue')
  },
  {
    path: '/:customerId/archives',
    name: 'archives',
    component: () => import('../views/customer/order/PageArchives.vue')
  },
  {
    path: '/order/:orderId',
    name: 'order-admin',
    component: () => import('../views/admin/order/PageOrder.vue')
  },
  {
    path: '/order/:orderId',
    name: 'order',
    component: () => import('../views/customer/order/PageOrder.vue')
  },
  {
    path: '/creation-publishing-house',
    name: 'creation-edition',
    component: () => import('../views/admin/publishingHouse/PageCreationPublishingHouse.vue')
  },
  {
    path: '/creation-writer',
    name: 'creation-writer',
    component: () => import('../views/admin/writer/PageCreationWriter.vue')
  },
  // {
  //   path: '/creation-group-writer',
  //   name: 'creation-group-writer',
  //   component: () => import('../views/admin/writer/PageCreationGroupWriters.vue')
  // },
  {
    path: '/creation-order/:customerId',
    name: 'creation-order',
    component: () => import('../views/PageCreationOrder.vue')
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
