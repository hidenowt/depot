module ApplicationHelper
  def current_time
    "#{Time.zone.now.strftime("%m/%d/%Y - %H:%M")}"
  end
  
  def dolar_to_currency(item)
    number_to_currency(item, :separator => ".", :delimiter => ",", :format => "%u%n")
  end
end
