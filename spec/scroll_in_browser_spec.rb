RSpec.describe Watir::Browser do
  describe "scroll.to" do
    context "top" do
      it "will scroll to the top of the page" do
        @browser.scroll.to.top
        expect(visible?(@browser.button(text: 'Top'))).to eq(true)
        expect(visible?(@browser.button(text: 'Center'))).to eq(true)
        expect(visible?(@browser.button(text: 'Bottom'))).to eq(false)
      end
    end

    context "bottom" do
      it "will scroll to the bottom of the page" do
        @browser.scroll.to.bottom
        expect(visible?(@browser.button(text: 'Top'))).to eq(false)
        expect(visible?(@browser.button(text: 'Bottom'))).to eq(true)
        expect(visible?(@browser.button(text: 'Center'))).to eq(true)
      end
    end

    context "middle" do
      it "will scroll to the middle of the page" do
        @browser.scroll.to.middle
        expect(visible?(@browser.button(text: 'Top'))).to eq(false)
        expect(visible?(@browser.button(text: 'Bottom'))).to eq(false)
        expect(visible?(@browser.button(text: 'Center'))).to eq(true)
      end
    end

    context "coordinates" do
      it "will scroll via an offset" do
        button = @browser.button(text: 'Bottom')
        @browser.scroll.by(0, button.wd.location.y)
        expect(visible?(button)).to eq(true)
      end

      it "will scroll to an x,y position" do
        button = @browser.button(text: 'Bottom')
        @browser.scroll.to [button.wd.location.x, button.wd.location.y]
        expect(visible?(button)).to eq(true)
      end

      it "will not scroll to unrecognized coordinates" do
        expect { @browser.scroll.to(1, 2) }.to raise_error(ArgumentError)
      end
    end
  end
end
