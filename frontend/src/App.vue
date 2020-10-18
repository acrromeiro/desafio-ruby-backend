<template>
  <div id="app">
    <v-app id="inspire">
      <v-app-bar app color="purple darken-4" dark>
        <v-toolbar-title>Cnab</v-toolbar-title>
        <v-spacer />
        <div>
          <v-btn @click="home()" text>
            Import File
          </v-btn>
          <v-btn @click="list()" text>
            Stores
          </v-btn>
        </div>
      </v-app-bar>
      <v-main>
        <router-view />
      </v-main>
    </v-app>
  </div>
</template>

<style lang="scss">
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

#nav {
  padding: 30px;

  a {
    font-weight: bold;
    color: #2c3e50;

    &.router-link-exact-active {
      color: #42b983;
    }
  }
}
</style>
<script>
export default {
  props: {
    source: String,
  },
  data: () => ({
    drawer: null,
  }),
  methods: {
    home() {
      this.$router.push("/");
    },
    list() {
      this.$router.push("/stores");
    },
  },
};
</script>
