class UsersController < ApplicationController
  def index
    @user = User.find(session[:user_id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Вы успешно зарегестрировались!'
    else
      flash.now[:alert] = 'Вы неправильно заполнили поля формы регистрации'

      render :new
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      session[:user_id] = @user.id

      redirect_to root_path, notice: 'Данные пользователя обновлены!'
    else
      flash.now[:alert] = 'При попытке сохранить пользователя возникли ошибки'

      render :edit
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    session.delete(session[:user_id])

    redirect_to new_user_path, notice: "Ваш профиль успешно удален"
  end

  private

  def user_params
    params.require(:user).permit(:name, :surname, :email, :password, :password_confirmation)
  end
end
