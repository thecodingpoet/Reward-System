class Customer
  attr_accessor :inviter, :name, :point, :level

  def initialize(name)
    @name = name
    @point = 0
    @level = 0
  end

  def recommends(invitee)
    invitee.inviter = self if invitee.inviter.nil?  
  end  

  def reward(customer)
    customer.point += ( 1.0 / 2 ) ** customer.level
    customer.level += 1
    return if customer.inviter.nil?
    reward(customer.inviter)
  end

  def accepts
    reward @inviter
  end
end




