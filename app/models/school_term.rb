class SchoolTerm < ActiveRecord::Base
  belongs_to :school_year

  validates :title, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :school_year_id, presence: true
end
