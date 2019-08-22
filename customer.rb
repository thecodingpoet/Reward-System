class Customer
  attr_accessor :inviter, :point, :level

  def initialize
    @point = 0
    @level = 0
  end

  def recommends(invitee)
    invitee.inviter = self if invitee.inviter.nil?  
  end  
  
  def accepts
    return if inviter.nil?
    reward inviter
  end

  private 

  def reward(customer)
    customer.point += ( 1.0 / 2 ) ** customer.level
    customer.level += 1
    return if customer.inviter.nil?
    reward customer.inviter
  end
end
