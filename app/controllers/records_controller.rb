class RecordsController < ApplicationController
  before_action :set_record, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show]

  def index
    @records = Record.includes(:user).order("created_at DESC")
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
    params.require(:record).permit(:text, :area_id, :image).merge(user_id: current_user.id)
  end

  def set_record
    @record = Record.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
