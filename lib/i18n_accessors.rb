require "i18n_accessors/version"
require "i18n_accessors/methods"
require "i18n_accessors/missing"

module I18nAccessors
  class << self

    # Configure I18nAccessors
    # @yield [I18nAccessors::Configuration] I18nAccessors configuration
    def configure
      yield config
    end

    # @!group Configuration Methods
    # @return [I18nAccessors::Configuration] I18nAccessors configuration
    def config
      @configuration ||= Configuration.new
    end

    # @return [Class] I18n Class to use for setting locale
    def i18n_class
      config.i18n_class
    end

    # Return normalized locale
    # @param [String,Symbol] locale
    # @return [String] Normalized locale
    # @example
    #   I18nAccessors.normalize_locale(:ja)
    #   #=> "ja"
    #   I18nAccessors.normalize_locale("pt-BR")
    #   #=> "pt_br"
    def normalize_locale(locale = I18n.locale)
      "#{locale.to_s.downcase.sub("-", "_")}".freeze
    end
  end

  class Configuration
    attr_accessor :i18n_class

    def initialize
      @i18n_class ||= I18n
    end
  end
end
