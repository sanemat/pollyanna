require 'spec_helper'

describe HelpController do

  describe "GET 'detail'" do
    it "returns http success" do
      get 'detail'
      response.should be_success
    end
  end

end
