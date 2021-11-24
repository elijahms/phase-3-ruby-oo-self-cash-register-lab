require "pry"

class CashRegister 
    
    attr_accessor :discount, :total, :items, :last_transaction
    attr_reader :void_last_transaction
    
    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity=1)
        @last_transaction = price * quantity
        @title = title
        @price = price
        @total += price * quantity
        quantity.times do
            self.items << title
        end
    end 

    def apply_discount
        if self.discount != 0
            @total = total - (total * discount / 100.0)
            "After the discount, the total comes to $#{total.to_i}."
        else 
            "There is no discount to apply."
        end 
    end
    
    def void_last_transaction
        @total -= last_transaction
    end 

end
