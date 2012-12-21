class Estimate < ActiveRecord::Base
  attr_accessible :hours, :rate

  def total
    if hours && rate
      hours * rate
    end
  end
end
