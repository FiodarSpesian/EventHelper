class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def show
    @event = set_event
  end

  def create
    @event =  Event.create(event_params)
    if @event.save
      redirect_to events_path, notice: 'Событие добавлено!'
    else
      flash.now[:alert] = 'Вы неправильно заполнили поля формы'
      render :new
    end
  end

  def edit
    @event = set_event
  end

  def update
    @event = set_event
    if @event.update(event_params)
      redirect_to event_path, notice: 'Событие обновлено'
    else
      flash.now[:alert] = 'Поля заполнены неправильно'

      render :edit
    end
  end

  def destroy
    @event = set_event
    @event.destroy
    redirect_to events_path
  end

  def search
    # must be to find how to render field for find something
  end

  private

  def event_params
    params.require(:event).permit(:name, :body, :event_date, :category_id, :user_id)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
