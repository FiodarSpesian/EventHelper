class CategoriesController < ApplicationController
  before_action :set_category!, only: %i[ edit update destroy]

  def index
    @categories = current_user.categories
  end

  def new
    @category = current_user.categories.build
  end

  def create
    @category = current_user.categories.build(category_params)
    unless current_user.categories.find_by(name: category_params[:name])
      if @category.name.present?
        current_user.categories.append(@category)

        redirect_to user_categories_path, notice: 'Категория добавлена!'
      else
        flash.now[:alert] = 'Это поле не может быть пустым'

        render :new
      end
    else
      flash.now[:alert] = 'Такая категория уже существует'

      render :new
    end
  end

  def edit
  end

  def update
    unless current_user.categories.find_by(name: category_params[:name])
      @category.update(category_params)

      redirect_to user_categories_path, notice: 'Категория обновлена!'
    else
      flash.now[:alert] = 'Такая категория уже существует'

      render :edit
    end
  end

  def destroy
    @category.destroy

    redirect_to user_categories_path, notice: 'Категрия удалена!'
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def set_category!
    @category = Category.find(params[:id])
  end
end
