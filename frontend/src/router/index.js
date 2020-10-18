import Vue from "vue";
import VueRouter from "vue-router";
import Home from "../views/Home.vue";

Vue.use(VueRouter);

const routes = [
  {
    path: "/",
    name: "Home",
    component: Home,
  },
  {
    path: "/stores",
    name: "Stores",
    component: () =>
      import(/* webpackChunkName: "about" */ "../views/Stores.vue"),
  },
  {
    path: "/stores/:id/transactions",
    name: "Transactions",
    component: () =>
      import(/* webpackChunkName: "about" */ "../views/Transactions.vue"),
  },
];

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes,
});

export default router;
