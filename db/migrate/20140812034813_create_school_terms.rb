class CreateSchoolTerms < ActiveRecord::Migration
  def change
    create_table :school_terms do |t|
      t.string :title, limit: 30
      t.date :start_date
      t.date :end_date
      t.references :school_year, index: true

      t.timestamps
    end
  end
end
