class HomeController < ApplicationController
  def show
    @categories = Category.with_doctors.limit(5)
  end
end