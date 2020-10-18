<template>
  <div class="about">
    <v-container>
      <v-row align="center" justify="center">
        <h1>Add File CNAB to process</h1>
      </v-row>
      <form @submit.prevent="onSubmit" enctype="multipart/form-data">
        <v-row align="center" justify="center" style="height: 200px">
          <v-col cols="6">
            <v-file-input
              show-size
              accept="plain/text"
              label="Add File"
              v-model="file"
              @change="onSelect"
            ></v-file-input>
          </v-col>
          <v-col cols="6">
            <v-btn :disabled="disabled" @click="onSubmit">Process</v-btn>
          </v-col>
        </v-row>
      </form>

      <v-row v-if="erros.length > 0" justify="center">
        <v-col>
          <v-card class="mx-auto" tile>
            <v-list-item v-for="e in erros" :key="e">
              <v-list-item-content>
                <v-list-item-title>{{ e }}</v-list-item-title>
              </v-list-item-content>
            </v-list-item>
          </v-card>
        </v-col>
      </v-row>

      <v-snackbar v-model="alert" :color="color" right top>
        {{ message }}

        <template v-slot:action="{ attrs }">
          <v-btn dark text v-bind="attrs" @click="alert = false"> Close </v-btn>
        </template>
      </v-snackbar>
      <v-overlay :value="overlay">
        <v-progress-circular indeterminate size="64"></v-progress-circular>
      </v-overlay>
    </v-container>
  </div>
</template>

<script>
import api from "../services/api.js";

export default {
  name: "Home",
  data() {
    return {
      file: "",
      message: "",
      alert: false,
      color: "success",
      disabled: true,
      erros: [],
      overlay: false,
    };
  },
  methods: {
    onSelect() {
      this.overlay = true;
      if (!this.file) {
        this.disabled = true;
        this.overlay = false;
        return;
      }
      if (this.file.size > 500000) {
        this.message = "Max size 500kb";
        this.color = "error";
        this.alert = true;
        this.file = "";
        this.disabled = true;
        this.overlay = false;
        return;
      }
      this.overlay = false;
      this.disabled = false;
    },
    async onSubmit() {
      this.overlay = true;
      const formData = new FormData();
      formData.append("file", this.file);
      try {
        const { data } = await api.post("/import", formData);

        if (data.status === "created") {
          this.message = "Sucess Processing File!";
          this.color = "success";
        } else {
          this.message = "Erro Processing File!";
          this.color = "error";
        }
        this.alert = true;
      } catch (err) {
        console.log(err);
        this.message = err.response.data.error;
        this.color = "error";
        this.alert = true;
      } finally {
        this.overlay = false;
      }
    },
  },
  mounted: function () {
    this.overlay = false;
  },
};
</script>
