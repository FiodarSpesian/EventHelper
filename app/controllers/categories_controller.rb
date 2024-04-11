class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]

  def index
    @categories = Category.where(user_id: id_of_user)
  end

  def new
    @category = Category.new
  end

  def show
  end

  def create
    params.require(:category)[:user_id] = id_of_user
    @category =  Category.new(category_params)

    if Category.where(user_id: id_of_user).find_by(name: @category.name)
      flash.now[:alert] = 'Такая категория уже существует create'

      render :new
    else
      if @category.save
        redirect_to categories_path, notice: 'Категория добавлена!'
      else
        flash.now[:alert] = 'Неправильно зоплнены поля формы'

        render :new
      end
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to events_path, notice: 'Событие обновлено'
    else
      flash.now[:alert] = 'Поля заполнены неправильно'

      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path, notice: 'Категрия удалена!'
  end

  private

  def category_params
    params.require(:category).permit(:name, :user_id)
  end

  def set_category
    @category = Category.find(params[:id])
  end

  def id_of_user
    return user_id = session[:user_id].to_s
  end
end
