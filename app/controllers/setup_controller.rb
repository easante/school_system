class SetupController < ApplicationController
  def index
    @school_year = SchoolYear.find_by(active_year: true)
    @school_years = SchoolYear.all
  end
end
