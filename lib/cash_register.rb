class CashRegister
  attr_accessor :total
  attr_reader :last_transaction, :discount, :price

  @@cart = []

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @@cart = []
  end

  def add_item(title, price, quantity=0)
    @price = price
    quantity == 0 ? self.total += price : self.total += price * quantity
    if quantity == 0
      @@cart << title
    else
      while quantity > 0
        @@cart << title
        quantity -= 1
      end
    end
  end

  def apply_discount
    @total = self.total * (100 - @discount) / 100
    discount == 0 ? "There is no discount to apply." : "After the discount, the total comes to $#{self.total}."
  end

  def items
    @@cart
  end

  def void_last_transaction
    @total -= @price
  end
end
