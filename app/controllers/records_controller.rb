class RecordsController < ApplicationController
  def index
    @records = Record.all
  end

  def new
    @record = Record.new
  end

  def create
    Record.create(record_params)
  end

  private
  def record_params
    params.require(:record).permit(:text, :area_id, :image)
  end
end
