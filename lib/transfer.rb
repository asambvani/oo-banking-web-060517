class Transfer

  attr_accessor :status
  attr_reader :sender, :receiver, :amount


  def initialize(sender, receiver, amount)

    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"

  end

  def valid?

    return @sender.valid? && @receiver.valid?

  end

  def execute_transaction

    if self.valid? == true && self.status == "pending" && @sender.balance > amount

      @sender.deposit(-@amount)
      @receiver.deposit(@amount)
      self.status = "complete"

    else

      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."

    end

  end

  def reverse_transfer

    if self.status == "complete"

      @sender.deposit(+@amount)
      @receiver.deposit(-@amount)
      self.status = "reversed"

    end
  end


end
