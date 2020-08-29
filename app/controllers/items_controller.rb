class ItemsController < ApplicationController
   before_action :authenticate_user!, except: :index
def index
  @item = Item.new
end

end
