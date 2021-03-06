class RecordsController < ApplicationController
  before_action :set_record, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show, :search]

  def index
    @records = Record.includes(:user).order("created_at DESC")
  end

  def new
    @record = Record.new
  end

  def create
    @record = Record.create(record_params)
    if @record.valid?
      @record.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    record = Record.find(params[:id])
    record.destroy
    redirect_to root_path
  end

  def edit
  end

  def update
    record = Record.find(params[:id])
    record.update(record_params)
    redirect_to controller: :records, action: :show
  end

  def show
    @comment = Comment.new
    @comments = @record.comments.includes(:user)
  end

  def search
    @records = Record.search(params[:keyword])
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
