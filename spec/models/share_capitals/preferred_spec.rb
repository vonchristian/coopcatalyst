require 'rails_helper'

module ShareCapitals
  describe Preferred do
    it_behaves_like 'a Members::ShareCapital subtype', kind: :preferred
  end
end
