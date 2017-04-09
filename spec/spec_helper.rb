$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require "i18n_accessors"
require "i18n"

I18n.enforce_available_locales = false

Dir[File.expand_path("./spec/support/**/*.rb")].each { |f| require f }
