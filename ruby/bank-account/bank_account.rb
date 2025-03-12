class BankAccount
  def initialize
    @state = :none
    @lock = Mutex.new
    @balance = 0
  end

  def open
    @lock.synchronize do
      raise ArgumentError, "You can't open an already open account" if open?

      @state = :open
    end
  end

  def deposit(value)
    @lock.synchronize do
      raise ArgumentError, "You can't deposit money into a closed account" unless open?
      raise ArgumentError, "You can't deposit a negative amount" if value.negative?

      @balance += value
    end
  end

  def withdraw(value)
    @lock.synchronize do
      raise ArgumentError, "You can't withdraw money into a closed account" if closed?
      raise ArgumentError, "You can't withdraw from a closed account" if closed?
      raise ArgumentError, "You can't withdraw a negative amount" if value.negative?
      raise ArgumentError, "You can't withdraw more than you have" if value > @balance

      @balance -= value
    end
  end

  def close
    raise ArgumentError, "You can't close an already closed account" if closed? || @state == :none

    withdraw(balance) if balance.positive?

    @lock.synchronize { @state = :closed }
  end

  def balance
    @lock.synchronize do
      raise ArgumentError, "You can't check the balance of a closed account" if closed?

      @balance
    end
  end

  private

  def open?
    @state == :open
  end

  def closed?
    @state == :closed
  end
end
