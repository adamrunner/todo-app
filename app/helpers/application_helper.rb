module ApplicationHelper
  def datetime_local_value(datetime)
    return nil unless datetime
    datetime.strftime("%Y-%m-%dT%H:%M:%S")
  end
  def datetime_index_value(datetime)
    return nil unless datetime
    datetime.strftime("%c")
  end
end
