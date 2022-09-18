class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def full_name
    first_name.to_s + "" + last_name.to_s
  end

  def set(fname:, lname:)
    self.first_name = fname
    self.last_name = lname
  end

end
