module OrdersHelper
  def orders_for(product)
    booked_dates = []
    product.orders.collect do |order|
      booked_dates << (order.start_date..order.end_date).to_a
    end

    content_tag(:div, class: 'orders', style: 'display: none') do
      booked_dates.flatten.map { |date| date.strftime('%a, %b %-d, %Y') }.join('|')
    end
  end
end
