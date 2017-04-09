shared_examples_for "locale accessor" do |attribute, locale|
  let(:args) { [1, 2, 3] }

  it "handles getters and setters" do
    instance = model_class.new

    aggregate_failures "getter" do
      expect(instance).to receive(attribute).with(*args) do
        expect(I18n.locale).to eq(locale)
      end.and_return("foo")
      expect(instance.send(:"#{attribute}_#{locale}", *args)).to eq("foo")
    end

    aggregate_failures "presence" do
      expect(instance).to receive(:"#{attribute}?").with(*args) do
        expect(I18n.locale).to eq(locale)
      end.and_return(true)
      expect(instance.send(:"#{attribute}_#{locale}?", *args)).to eq(true)
    end

    aggregate_failures "setter" do
      expect(instance).to receive(:"#{attribute}=").with("value", *args) do
        expect(I18n.locale).to eq(locale)
      end.and_return("value")
      expect(instance.send(:"#{attribute}_#{locale}=", "value", *args)).to eq("value")
    end
  end
end
