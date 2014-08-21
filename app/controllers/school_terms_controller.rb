class SchoolTermsController < ApplicationController
  before_action :set_school_year

  def index
    @school_terms = @school_year.school_terms.all
  end

  def show
    @school_term = @school_year.school_terms.find(params[:id])
  end

  def new
    @school_term = @school_year.school_terms.build
  end

  def create
    existing_terms = @school_year.school_terms.all
    @school_term = @school_year.school_terms.build(school_term_params)

    school_calendar = SchoolCalendarValidation.new(@school_year)

    if @school_term.start_date && @school_term.end_date
      unless school_calendar.within_school_year?(@school_term)
        render_new_template "Term falls outside the school year."
        return false
      end
    end

    if school_calendar.within_existing_term?(existing_terms, @school_term)
      render_new_template "Term overlaps existing terms."
      return false
    end

    if @school_term.save
      flash[:success] = "School term successfully created."
      redirect_to [@school_year, @school_term]
    else
      flash.now[:danger] = "School term not successfully created."
      render :new
    end
  end

private
  def set_school_year
    @school_year = SchoolYear.find(params[:school_year_id])
  end

  def school_term_params
    params.require(:school_term).permit(:title, :start_date, :end_date, :school_year_id)
  end

  def render_new_template(message)
    flash.now[:danger] = message
    render :new
  end

end
