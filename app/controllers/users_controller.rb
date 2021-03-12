class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @records = user.records.order("created_at DESC")
  end
end
