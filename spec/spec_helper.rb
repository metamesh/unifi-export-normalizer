require 'simplecov'
SimpleCov.start do
  add_filter "/test/"
  add_filter "/vendor/"
  minimum_coverage 50
end
require 'codecov'
PROJECT_ROOT ||= File.expand_path("..", __dir__)
STUB_PATH ||= File.expand_path(File.join(__FILE__, "..", "stub"))
$LOAD_PATH.unshift(STUB_PATH)

Dir.glob("#{PROJECT_ROOT}/lib/**/*.rb").each do |f|
  require f
end

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
]
SimpleCov.formatters << SimpleCov::Formatter::Codecov if ENV["CI"]
