class Mailroom < ActionMailer::Base

  def confirm_order(customer_order)
    @customer_order = customer_order
    to = @customer_order.email
    mail(:to => to, :from => Settings.web_master, :content_type => "text/html", :subject => "Velo Bin Order #{@customer_order.id}")
  end
  
  def confirm_shipment(shipment)
    @shipment = shipment
    to = @shipment.customer_order.email
    mail(:to => to, :from => Settings.web_master, :content_type => "text/html", :subject => "Velo Bin Order #{@shipment.customer_order_id}")
  end
end