class Admin::DashboardController < ApplicationController
  def show
  end

  def product_count
    @product_count = Product.count
  end
  helper_method :product_count

  def category_count
    @category_count = Category.count
  end
  helper_method :category_count
end
