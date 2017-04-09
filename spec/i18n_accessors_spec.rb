require 'spec_helper'

describe I18nAccessors do
  it 'has a version number' do
    expect(I18nAccessors::VERSION).not_to be nil
  end

  describe '.normalize_locale' do
    it "normalizes locale to lowercase string underscores" do
      expect(I18nAccessors.normalize_locale(:"pt-BR")).to eq("pt_br")
    end

    it "normalizes current locale if passed no argument" do
      I18n.with_locale(:"pt-BR") do
        aggregate_failures do
          expect(described_class.normalize_locale).to eq("pt_br")
        end
      end
    end
  end
end
