class ImportsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    begin
      ImportCnabFileService.import(params[:file])
      render json: {status: :created},status: :created
    rescue BusinessException
      render json: {status: :not_acceptable},status: :not_acceptable
    end
  end
end