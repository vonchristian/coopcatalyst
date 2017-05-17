require 'rails_helper'

module Freights
  describe FreightOut do
    it_behaves_like 'a Freight subtype', kind: :freight_out
  end
end
