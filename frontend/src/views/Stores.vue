<template>
  <v-container>
    <v-row justify="center">
      <v-col cols="10">
        <v-card>
          <v-card-title>
            Stores
            <v-spacer></v-spacer>
          </v-card-title>
          <v-data-table
            :headers="headers"
            :items="items"
            @click:row="handleClick"
            class="row-pointer"
          ></v-data-table>
        </v-card>
      </v-col>
    </v-row>
    <v-overlay :value="overlay">
      <v-progress-circular indeterminate size="64"></v-progress-circular>
    </v-overlay>
  </v-container>
</template>
<style lang="css" scoped>
.row-pointer >>> tbody tr :hover {
  cursor: pointer;
}
</style>
<script>
import api from "../services/api.js";
import {formatReal} from "../utils/format";
export default {
  data: () => {
    return {
      headers: [
        { text: "*", value: "id" },
        { text: "Name", value: "name" },
        { text: "Owner", value: "owner" },
        { text: "Total", value: "total" },
      ],
      items: [],
      overlay: false,
    };
  },
  methods: {
    handleClick(value) {
      this.$router.push(`/stores/${value.id}/transactions`);
    },
  },
  mounted: async function () {
    this.overlay = true;
    const { data } = await api.get("/stores");
    this.items = await Promise.all(
      data.map((d) => {
        let n = d;
        n.total = formatReal(n.total);
        return n;
      })
    );
    this.overlay = false;
  },
};
</script>
