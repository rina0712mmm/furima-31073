class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :authenticate_user!, except: [:index, :show]

  def index
  end

  def show
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
