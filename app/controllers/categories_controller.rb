class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]

  def index
    @categories = current_user.categories
  end

  def new
    @category = Category.new
  end

  def show
  end

  def create
    current_user.categories.find_or_create_by(name: category_params[:name])

    redirect_to categories_path, notice: 'Категория добавлена!'
  end

  def edit
  end

  def update
    current_user.categories.find(params[:id]).update(name: category_params[:name])

    redirect_to categories_path, notice: 'Категория обновлена!'
  end

  def destroy
    @category.destroy
    redirect_to categories_path, notice: 'Категрия удалена!'
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
