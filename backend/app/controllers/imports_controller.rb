class ImportsController < ApplicationController
  skip_before_action :verify_authenticity_token

  # @return [nil]
  def create
    ImportCnabFileService.import(params[:file])
    render json: @resource, status: :created
  end
end