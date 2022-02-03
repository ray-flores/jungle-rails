class Admin::DashboardController < ApplicationController
  def show
    @product_count = Product.count(:id)
    @category_count = Category.count(:id)
  end
end
