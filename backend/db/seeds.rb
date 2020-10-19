# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
tyoe_list = [
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
           ]

while !tyoe_list.empty? do
  begin
    TypeTransaction.create(tyoe_list)
  rescue
    tyoe_list = tyoe_list.drop(1) #removing the first if the id already exist.
  end
end