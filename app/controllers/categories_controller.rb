class CategoriesController < ApplicationController
  load_and_authorize_resource

  # GET /categories or /categories.json
  def index
    @categories = Category.with_doctors
  end

  # GET /categories/1 or /categories/1.json
  def show
    @category = Category.find(params[:id])
  end
end
