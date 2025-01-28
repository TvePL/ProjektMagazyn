class HomeController < ApplicationController
  def index
    @users = User.all
    @categories = Category.all
    @products = Product.all
    @deliveries = Delivery.all
  end
end