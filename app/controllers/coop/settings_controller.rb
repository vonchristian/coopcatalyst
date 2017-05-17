module Coop
  class SettingsController < ApplicationController
    def index
      @cooperative = Cooperative.first
    end
  end
end
