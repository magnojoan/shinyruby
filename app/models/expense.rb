class Expense < ActiveRecord::Base
  attr_accessible :amount, :interval, :name, :start_date, :user_id

  belongs_to :user

  validates :amount, :presence => true, :numericality => true
  validates :interval, :presence => true
  validates :name, :presence => true

end
