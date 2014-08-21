class AddActiveYearToSchoolYear < ActiveRecord::Migration
  def change
    add_column :school_years, :active_year, :boolean, default: false
  end
end
