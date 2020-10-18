class PopulateTypeTransaction < ActiveRecord::Migration[6.0]
  def change
    TypeTransaction.create([
           {
               external_id: 1,
               description: 'Débito',
               order: "deposit"
           },
           {
               external_id: 2,
               description: 'Boleto',
               order: "out"
           },
           {
               external_id: 3,
               description: 'Financiamento',
               order: "out"
           },
           {
               external_id: 4,
               description: 'Crédito',
               order: "deposit"
           },
           {
               external_id: 5,
               description: 'Recebimento Empréstimo',
               order: "deposit"
           },
           {
               external_id: 6,
               description: 'Vendas',
               order: "deposit"
           },
           {
               external_id: 7,
               description: 'Recebimento TED',
               order: "deposit"
           },
           {
               external_id: 8,
               description: 'Recebimento DOC',
               order: "deposit"
           },
           {
               external_id: 9,
               description: 'Aluguel',
               order: "out"
           },
       ])
  end
end
