class StoresController  < ApplicationController
  skip_before_action :verify_authenticity_token

  def list
    render json: StoreService.get_all_stores
  end

  def transactions
    @store = StoreService.get_by_id(params[:id])
    @transactions = StoreService.get_store_transactions(@store)
    render json: {store:@store,transactions:@transactions}
  end
end