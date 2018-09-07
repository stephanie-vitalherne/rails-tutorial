class Employee < ApplicationRecord
  belongs_to :department
  def full_name
    first_name + ' ' + last_name
  end

  def generate_eid
    self.eid = SecureRandom.uuid.hex(3).upcase
  end
end
