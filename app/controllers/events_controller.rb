class EventsController < ApplicationController
  before_action :set_event!, only: %i[show edit update destroy]
  def index
    @user = current_user
    @q = @user.events.ransack(params[:q])
    @events = @q.result.order(event_date: :desc).page params[:page]
  end

  def new
    @user = current_user
    @event = @user.events.build
  end

  def show
      @weather_forecast = WeatherApi::Handler.call({ date: @event.event_date.to_s })
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      redirect_to user_events_path, notice: 'Событие добавлено!'
    else
      flash.now[:alert] = 'Вы неправильно заполнили поля формы'

      render :new
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)

      redirect_to user_events_path, notice: 'Событие обновлено'
    else
      flash.now[:alert] = 'Поля заполнены неправильно'

      render :edit
    end
  end

  def destroy
    @event.destroy

    redirect_to user_events_path, notice: 'Событие удалено!'
  end

  private

  def event_params
    params.require(:event).permit(:name, :body, :event_date, :category_id, :user_id)
  end

  def set_event!
    @event = Event.find(params[:id])
  end
end
