class HelpController < ApplicationController
  before_action :authenticate, except: [:detail]

  def detail
  end
end
