<template>
  <v-container>
    <v-row justify="center">
      <v-col cols="10">
        <v-card>
          <v-card-title>
            {{ name }}
            <v-spacer></v-spacer>
          </v-card-title>
          <v-data-table :headers="headers" :items="items"></v-data-table>
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
import { formatCPF, formatReal } from "../utils/format.js";
export default {
  data: () => {
    return {
      nome: "",
      headers: [
        { text: "*", value: "id" },
        { text: "Date", value: "date_transaction" },
        { text: "Value", value: "abs_value" },
        { text: "CPF", value: "cpf" },
        { text: "Card Number", value: "card" },
        { text: "Type Transaction", value: "description" },
      ],
      items: [],
      overlay: false,
    };
  },
  mounted: async function () {
    this.overlay = true;
    const { data } = await api.get(`/stores/${this.$route.params.id}/transactions`);
    this.name = data.store.name;
    this.items = await Promise.all(
      data.transactions.map((d) => {
        let n = d;
        n.abs_value = formatReal(n.abs_value);
        n.cpf = formatCPF(n.cpf);
        n.date_transaction = new Date(n.date_transaction).toLocaleString();

        return n;
      })
    );
    this.overlay = false;
  },
};
</script>
