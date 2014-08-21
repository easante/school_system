require 'spec_helper'

describe SchoolYearsController do

  describe "GET '#index'" do
    let(:year1) { Fabricate(:school_year) }
    let(:year2) { Fabricate(:school_year) }

    it "assigns a new school year object to @school_year" do
      get :index
      expect(assigns(:school_years)).to match_array([year1, year2])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET '#new'" do
    it "assigns a new school year object to @school_year" do
      get :new
      expect(assigns(:school_year)).to be_a_new(SchoolYear)
    end
  end

  describe "GET '#show'" do
    it "assigns the requested school year to @school_year" do
      school_year = Fabricate(:school_year)
      get :show, id: school_year.id
      expect(assigns(:school_year)).to eq(school_year)
    end

    it "renders the show template" do
      school_year = Fabricate(:school_year)
      get :show, id: school_year.id
      expect(response).to render_template :show
    end
  end

  describe "POST '#create'" do
    context "successful creation" do
      it "creates a school year with valid inputs" do
        post :create, school_year: Fabricate.attributes_for(:school_year)
        expect(SchoolYear.count).to eq(1)
      end

      it "redirects to the school_year_path" do
        post :create, school_year: Fabricate.attributes_for(:school_year)
        expect(response).to redirect_to(school_year_path(SchoolYear.first.id))
      end

      it "sets the flash success message" do
        post :create, school_year: Fabricate.attributes_for(:school_year)
        expect(flash[:success]).to eq('School year successfully created.')
      end
    end

    context "unsuccessful creation" do
      it "fails to create a school year with invalid inputs" do
        post :create, school_year: Fabricate.attributes_for(:school_year, title: '')
        expect(SchoolYear.count).to eq(0)
      end

      it "renders the new template" do
        post :create, school_year: Fabricate.attributes_for(:school_year, title: '')
        expect(response).to render_template :new
      end

      it "sets the flash danger message" do
        post :create, school_year: Fabricate.attributes_for(:school_year, title: '')
        expect(flash[:danger]).to eq('School year not successfully created.')
      end

      it "fails to create a school year with end date before start date" do
        start_date = '2014-08-01'
        end_date   = '2014-07-20'
        post :create, school_year: Fabricate.attributes_for(:school_year,
                                                          start_date: start_date,
                                                          end_date: end_date)
        expect(flash[:danger]).to eq('Start date has to come before end date.')
      end
    end
  end

  describe "GET '#edit'" do
    let(:year) { Fabricate(:school_year) }

    it "finds the school year to be edited and assigns it to @school_year" do
      get :edit, id: year
      expect(assigns(:school_year)).to eq(year)
    end

    it "renders the edit template" do
      get :edit, id: year
      expect(response).to render_template :edit
    end
  end

  describe "POST '#update'" do
    context "successful update" do
      let(:year) { Fabricate(:school_year) }

      it "finds the school year to be edited and assigns it to @school_year" do
        # require 'pry';binding.pry
        put :update, id: year, school_year: Fabricate.attributes_for(:school_year)
        expect(assigns(:school_year)).to eq(year)
      end

      it "updates a school year with valid inputs" do
        put :update, id: year, school_year: Fabricate.attributes_for(:school_year, title: '2014 Summer')
        expect(year.reload.title).to eq('2014 Summer')
      end

      it "redirects to the school_year_path" do
        put :update, id: year, school_year: Fabricate.attributes_for(:school_year, title: '2014 Summer')
        expect(response).to redirect_to(school_year_path(SchoolYear.first.id))
      end

      it "sets the flash success message" do
        put :update, id: year, school_year: Fabricate.attributes_for(:school_year, title: '2014 Summer')
        expect(flash[:success]).to eq('School year successfully updated.')
      end
    end

    context "unsuccessful update" do
      let(:year) { Fabricate(:school_year, title: '2013 Fall') }

      it "fails to update a school year with invalid inputs" do
        put :update, id: year, school_year: Fabricate.attributes_for(:school_year, title: '')
        expect(year.title).to eq('2013 Fall')
      end

      it "renders the new template" do
        put :update, id: year, school_year: Fabricate.attributes_for(:school_year, title: '')
        expect(response).to render_template :edit
      end

      it "sets the flash danger message" do
        put :update, id: year, school_year: Fabricate.attributes_for(:school_year, title: '')
        expect(flash[:danger]).to eq('School year not successfully updated.')
      end
    end
  end
end
