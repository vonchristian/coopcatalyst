require 'rails_helper'

module ShareCapitals
  describe Common do
    it_behaves_like 'a Members::ShareCapital subtype', kind: :common
  end
end
