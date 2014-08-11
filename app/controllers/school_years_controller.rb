class SchoolYearsController < ApplicationController
  def show
    @school_year = SchoolYear.find(params[:id])
  end

  def new
    @school_year = SchoolYear.new
  end

  def create
    @school_year = SchoolYear.new(school_year_params)
    if @school_year.save
      flash[:success] = "School year successfully created."
      redirect_to @school_year
    else
      flash.now[:danger] = "School year not successfully created."
      render :new
    end
  end

private
  def school_year_params
    params.require(:school_year).permit(:title, :start_date, :end_date)
  end
end
