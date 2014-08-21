class SchoolCalendarValidation
  attr_reader :year

  def initialize(year)
    @year = year
  end

  def within_school_year?(term)
    school_year_period = school_period_date_range(year)
    school_year_period.include?(term.start_date) && school_year_period.include?(term.end_date)
  end

  def within_existing_term?(current_terms, term)
    return false if current_terms.empty?
    overlap = false

    current_terms.each do |current_term|
      term_span = school_period_date_range(current_term)
      overlap = overlap || (term_span.include?(term.start_date) ||
                term_span.include?(term.end_date))
    end
    overlap
  end

private
  def school_period_date_range(period)
    (period.start_date..period.end_date)
  end

end
