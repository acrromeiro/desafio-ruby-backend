require 'rails_helper'
require 'json'

RSpec.describe "StoresController", type: :request do
  describe 'GET list' do
    context "ok" do

      let(:file_adress) do
        Rails.root.join("spec", "fixtures","files", "CNAB.txt")
      end


      it 'get stores' do
        post "/import", params: { file: file_adress }
        expect(response.status).to eq(201)
        get "/stores"

        @json_expected = "[{\"id\":1,\"name\":\"BAR DO JOÃO\",\"owner\":\"JOÃO MACEDO\",\"total\":-102.0,\"created_at\":\"2020...\"created_at\":\"2020-10-19T00:51:36.400-03:00\",\"updated_at\":\"2020-10-19T00:51:36.403-03:00\"}]"

        expect(response.body.to_s) == @json_expected
      end
    end
  end

  describe 'GET traansactions' do
    context "ok" do

      let(:file_adress) do
        Rails.root.join("spec", "fixtures","files", "CNAB.txt")
      end


      it 'get stores' do
        post "/import", params: { file: file_adress }
        expect(response.status).to eq(201)
        get "/stores/4/transactions"

        @json_expected = '{"store":{"id":4,"name":"MERCEARIA 3 IRMÃOS","owner":"JOSÉ COSTA","total":-7023.0,"created_at":"2020-10-19T01:17:25.652-03:00","updated_at":"2020-10-19T01:17:25.688-03:00"},"transactions":[{"id":8,"created_at":"2020-10-19T00:00:02.554-03:00","updated_at":"2020-10-19T00:00:02.554-03:00","abs_value":602.0,"cpf":"23270298056","card":"6777****1313","date_transaction":"2019-03-01 20:27:12","store_id":4,"type_transaction_id":3,"external_id":3,"description":"Financiamento","order":"out"},{"id":11,"created_at":"2020-10-19T00:00:02.551-03:00","updated_at":"2020-10-19T00:00:02.551-03:00","abs_value":102.0,"cpf":"23270298056","card":"8473****1231","date_transaction":"2019-03-02 02:12:33","store_id":4,"type_transaction_id":2,"external_id":2,"description":"Boleto","order":"out"},{"id":12,"created_at":"2020-10-19T00:00:02.554-03:00","updated_at":"2020-10-19T00:00:02.554-03:00","abs_value":6102.0,"cpf":"23270298056","card":"6777****1313","date_transaction":"2019-03-01 20:27:12","store_id":4,"type_transaction_id":3,"external_id":3,"description":"Financiamento","order":"out"},{"id":15,"created_at":"2020-10-19T00:00:02.554-03:00","updated_at":"2020-10-19T00:00:02.554-03:00","abs_value":103.0,"cpf":"23270298056","card":"6777****1313","date_transaction":"2019-03-01 20:27:12","store_id":4,"type_transaction_id":3,"external_id":3,"description":"Financiamento","order":"out"},{"id":18,"created_at":"2020-10-19T00:00:02.551-03:00","updated_at":"2020-10-19T00:00:02.551-03:00","abs_value":109.0,"cpf":"23270298056","card":"8723****9987","date_transaction":"2019-03-01 15:33:33","store_id":4,"type_transaction_id":2,"external_id":2,"description":"Boleto","order":"out"},{"id":20,"created_at":"2020-10-19T00:00:02.551-03:00","updated_at":"2020-10-19T00:00:02.551-03:00","abs_value":5.0,"cpf":"23270298056","card":"7677****8778","date_transaction":"2019-03-01 17:18:08","store_id":4,"type_transaction_id":2,"external_id":2,"description":"Boleto","order":"out"}]}'

        expect(response.body.to_s) == @json_expected
      end
    end
  end
end

