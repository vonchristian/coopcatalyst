require 'rails_helper'

module Freights
  describe FreightIn do
    it_behaves_like 'a Freight subtype', kind: :freight_in
  end
end
