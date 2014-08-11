require 'spec_helper'

describe SchoolYearsController do

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
      it "fail to create a school year with invalid inputs" do
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

    end
  end

end
