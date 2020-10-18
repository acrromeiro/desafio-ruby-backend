import { create } from "axios";

const api = create({
  baseURL: process.env.BACKEND_URL || "http://localhost:3000",
});

export default api;
