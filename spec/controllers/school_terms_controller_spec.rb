require 'spec_helper'

describe SchoolTermsController do
  let!(:year) { Fabricate(:school_year) }

  describe "GET '#index'" do
    let!(:term1) { Fabricate(:school_term, school_year_id: year.id) }
    let!(:term2) { Fabricate(:school_term, school_year_id: year.id) }

    it "assigns a new school term object to @school_term" do
      get :index, school_year_id: year.id
#      require 'pry';binding.pry
      expect(assigns(:school_terms)).to match_array([term1, term2])
    end

    it "renders the index template" do
      get :index, school_year_id: year.id
      expect(response).to render_template :index
    end
  end

  describe "GET '#new'" do
    it "assigns a new school term object to @school_term" do
      get :new, school_year_id: year.id
      expect(assigns(:school_term)).to be_a_new(SchoolTerm)
    end
  end

  describe "GET '#show'" do
    it "assigns the requested school term to @school_term" do
      school_term = Fabricate(:school_term, school_year_id: year.id)
      get :show, school_year_id: year.id, id: school_term.id
      expect(assigns(:school_term)).to eq(school_term)
    end

    it "renders the show template" do
      school_term = Fabricate(:school_term, school_year_id: year.id)
      get :show, school_year_id: year.id, id: school_term.id
      expect(response).to render_template :show
    end
  end

  describe "POST '#create'" do
    context "successful creation" do
      it "creates a school term with valid inputs" do
        post :create, school_term: Fabricate.attributes_for(:school_term), school_year_id: year.id
        expect(SchoolTerm.count).to eq(1)
      end

      it "redirects to the school_term_path" do
        post :create, school_term: Fabricate.attributes_for(:school_term), school_year_id: year.id
        expect(response).to redirect_to(school_year_school_term_path(year.id, SchoolTerm.first.id))
      end

      it "sets the flash success message" do
        post :create, school_term: Fabricate.attributes_for(:school_term), school_year_id: year.id
        expect(flash[:success]).to eq('School term successfully created.')
      end
    end

    context "unsuccessful creation" do
      it "fail to create a school term with invalid inputs" do
        post :create, school_term: Fabricate.attributes_for(:school_term, title: ''), school_year_id: year.id
        expect(SchoolTerm.count).to eq(0)
      end

      it "renders the new template" do
        post :create, school_term: Fabricate.attributes_for(:school_term, title: ''), school_year_id: year.id
        expect(response).to render_template :new
      end

      it "sets the flash danger message" do
        post :create, school_term: Fabricate.attributes_for(:school_term, title: ''), school_year_id: year.id
        expect(flash[:danger]).to eq('School term not successfully created.')
      end

    end
  end

end
