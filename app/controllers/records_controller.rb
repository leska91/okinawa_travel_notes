class RecordsController < ApplicationController
  before_action :set_record, only: [:edit, :show]

  def index
    @records = Record.all
  end

  def new
    @record = Record.new
  end

  def create
    Record.create(record_params)
  end

  def destroy
    record = Record.find(params[:id])
    record.destroy
  end

  def edit
  end

  def update
    record = Record.find(params[:id])
    record.update(record_params)
  end

  def show
  end

  private
  def record_params
    params.require(:record).permit(:text, :area_id, :image)
  end

  def set_record
    @record = Record.find(params[:id])
  end
end
