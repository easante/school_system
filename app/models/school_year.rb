class SchoolYear < ActiveRecord::Base
  has_many :school_terms
  
  validates :title, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
