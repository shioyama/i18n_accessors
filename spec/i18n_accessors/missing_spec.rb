require "spec_helper"

describe I18nAccessors::Missing do
  let(:model_class) do
    klass = Class.new do
      def title(**_); end
      def title?(**_); end
      def title=(_value, **_); end
    end
    klass.include described_class.new(:title)
    klass
  end

  it_behaves_like "locale accessor", :title, :en
  it_behaves_like "locale accessor", :title, :de

  context "locale is not in I18n.available_locales" do
    before { I18n.enforce_available_locales = true  }
    after  { I18n.enforce_available_locales = false }

    it "raises InvalidLocale if locale is not in I18n.available_locales" do
      expect { model_class.new.title_ru }.to raise_error(I18n::InvalidLocale)
    end
  end
end
