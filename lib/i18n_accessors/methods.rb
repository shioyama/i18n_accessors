# frozen-string-literal: true
module I18nAccessors
=begin

Defines methods for a set of locales to access translated attributes in those
locales directly with a method call, using a suffix including the locale:

  article.title_pt_br

If no locales are passed as an option to the initializer,
+I18n.available_locales+ will be used by default.

@example
  class Post
    def title
      "title in #{I18n.locale}"
    end
    include I18nAccessors::Methods.new("title", locales: [:en, :fr])
  end

  I18n.locale = :en
  post = Post.new
  post.title
  #=> "title in en"
  post.title_fr
  #=> "title in fr"

=end
  class Methods < Module
    # @param [String] One or more attributes
    # @param [Array<Symbol>] Locales
    def initialize(*attributes, locales: I18n.available_locales)
      attributes.each do |attribute|
        locales.each do |locale|
          normalized_locale = I18nAccessors.normalize_locale(locale)
          define_method "#{attribute}_#{normalized_locale}" do |*args|
            I18n.with_locale(locale) { send(attribute, *args) }
          end
          define_method "#{attribute}_#{normalized_locale}?" do |*args|
            I18n.with_locale(locale) { send("#{attribute}?", *args) }
          end
          define_method "#{attribute}_#{normalized_locale}=" do |value, *args|
            I18n.with_locale(locale) { send("#{attribute}=", value, *args) }
          end
        end
      end
    end
  end
end
