require 'rails_helper'

RSpec.describe "ImportsController", type: :request do
  describe 'POST import' do
    context "ok" do

      let(:file_adress) do
        Rails.root.join("spec", "fixtures","files", "CNAB.txt")
      end

      it 'imports transactions' do
        post "/import", params: { file: file_adress }
        expect(response.status).to eq(201)
        expect(Transaction.count).to eq(21)
        expect(Store.count).to eq(5)
      end
    end
  end
end
