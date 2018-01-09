class Cart < ApplicationRecord
  has_many :order_items

  def total_quantity
    @count = 0

    order_items.all.each do |i|
        @count = @count + i.quantity
    end

    @count

  end


end
