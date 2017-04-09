require "i18n_accessors/version"
require "i18n_accessors/methods"
require "i18n_accessors/missing"

module I18nAccessors
  class << self
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
end
