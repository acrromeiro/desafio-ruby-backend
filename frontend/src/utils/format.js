export function formatCPF(v) {
  v = v.toString()
  v = v.replace(/\D/g, "");
  v = v.replace(/(\d{3})(\d)/, "$1.$2");
  v = v.replace(/(\d{3})(\d)/, "$1.$2");

  v = v.replace(/(\d{3})(\d{1,2})$/, "$1-$2");
  return v;
}

export function formatReal(v) {
  return `R$ ${v.toFixed(2)}`;
}
