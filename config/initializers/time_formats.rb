
my_formats = {
  :cst => '%m/%d/%Y %I:%M%p %Z',
}

ActiveSupport::CoreExtensions::Time::Conversions::DATE_FORMATS.merge!(my_formats)
ActiveSupport::CoreExtensions::Date::Conversions::DATE_FORMATS.merge!(my_formats)