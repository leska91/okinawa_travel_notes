class RecordsController < ApplicationController
  def index
    @records = Record.all
  end

  def new
    @record = Record.new
  end

  def create
    Record.create
  end

  private
  def record_params
    params.require(:record).permit(:text, :area_id, :image)
  end
end
