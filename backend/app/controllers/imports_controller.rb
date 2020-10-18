class ImportsController < ApplicationController
  skip_before_action :verify_authenticity_token

  # @return [nil]
  def create
    begin
      ImportCnabFileService.import(params[:file])
      render json: {status: :created}
    rescue
      render json: {status: :not_acceptable}
    end
  end
end