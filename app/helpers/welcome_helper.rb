module WelcomeHelper

  def quantity_remaining(item)
    "#{item.quantity_remaining} - #{item.lot_quantity} Remaining."
  end

  def remaining(item)
    "#{item.quantity_remaining}/#{item.lot_quantity} Left"
  end

end
