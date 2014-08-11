require 'spec_helper'

describe SchoolYear do
  subject { Fabricate(:school_year) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:start_date) }
  it { should validate_presence_of(:end_date) }

  it "should save a new school year" do
    school_year = Fabricate(:school_year)
    expect(school_year.start_date.to_s).to eq('2014-09-01')
  end

end
