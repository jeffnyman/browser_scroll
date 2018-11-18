RSpec.describe Watir::Element do
  describe "scroll.to" do
    context "top" do
      it "will scroll to the top of the element" do
        @browser.button(text: 'Center').scroll.to.top
        expect(visible?(@browser.button(text: 'Top'))).to eq(false)
        expect(visible?(@browser.button(text: 'Center'))).to eq(true)
        expect(visible?(@browser.button(text: 'Bottom'))).to eq(true)
      end
    end

    context "bottom" do
      it "will scroll to the bottom of the element" do
        @browser.button(text: 'Center').scroll.to.bottom
        expect(visible?(@browser.button(text: 'Top'))).to eq(true)
        expect(visible?(@browser.button(text: 'Center'))).to eq(true)
        expect(visible?(@browser.button(text: 'Bottom'))).to eq(false)
      end
    end

    context "middle" do
      it "will scroll to the middle of the element" do
        @browser.button(text: 'Center').scroll.to.middle
        expect(visible?(@browser.button(text: 'Top'))).to eq(false)
        expect(visible?(@browser.button(text: 'Center'))).to eq(true)
        expect(visible?(@browser.button(text: 'Bottom'))).to eq(false)
      end
    end

    context "coordinates" do
      it "will scroll via an offset" do
        @browser.button(text: 'Bottom').scroll.to.by(-10000, -10000)
        expect(visible?(@browser.button(text: 'Top'))).to eq(true)
        expect(visible?(@browser.button(text: 'Center'))).to eq(true)
        expect(visible?(@browser.button(text: 'Bottom'))).to eq(false)
      end
    end
  end
end
