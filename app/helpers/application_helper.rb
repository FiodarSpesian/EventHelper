module ApplicationHelper
  def inclination(count, one, few, many)
    return many if (count % 100).between?(11,14)

    case count % 10
    when 1 then one
    when 2..4 then few
    else
      many
    end
  end

  def todays_events(events)
    events.where(event_date: Date.current.to_s)
  end

  def user_events(user)
    return @events = Event.where(user_id: user.id)
  end

  def event_category(event)
    return category = Category.find(event.category_id)
  end
end
