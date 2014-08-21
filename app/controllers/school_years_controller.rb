class SchoolYearsController < ApplicationController
  def index
    @school_years = SchoolYear.all
  end

  def show
    @school_year = SchoolYear.find(params[:id])
  end

  def new
    @school_year = SchoolYear.new
  end

  def create
    @school_year = SchoolYear.new(school_year_params)

    invalid_date = validate_dates
    if invalid_date
      render :new
      return false
    end

    if @school_year.save
      flash[:success] = "School year successfully created."
      redirect_to @school_year
    else
      flash.now[:danger] = "School year not successfully created."
      render :new
    end
  end

  def edit
    @school_year = SchoolYear.find(params[:id])
  end

  def update
    @school_year = SchoolYear.find(params[:id])
    invalid_date = validate_dates
    if invalid_date
      render :edit
      return false
    end

    if @school_year.update(school_year_params)
      flash[:success] = "School year successfully updated."
      redirect_to @school_year
    else
      flash.now[:danger] = "School year not successfully updated."
      render :edit
    end
  end

private
  def school_year_params
    params.require(:school_year).permit(:title, :start_date, :end_date)
  end

  def validate_dates
    unless @school_year.start_date.nil? &&  @school_year.end_date.nil?
      #require 'pry';binding.pry
      if @school_year.start_date >  @school_year.end_date
        flash.now[:danger] = "Start date has to come before end date."
        return true
      end
    end
  end
end
