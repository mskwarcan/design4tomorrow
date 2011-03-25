require 'spec_helper'

describe SignUp do

  def reset_sign_up(options = {})
    @valid_attributes = {
      :id => 1,
      :name => "RSpec is great for testing too"
    }

    @sign_up.destroy! if @sign_up
    @sign_up = SignUp.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_sign_up
  end

  context "validations" do
    
    it "rejects empty name" do
      SignUp.new(@valid_attributes.merge(:name => "")).should_not be_valid
    end

    it "rejects non unique name" do
      # as one gets created before each spec by reset_sign_up
      SignUp.new(@valid_attributes).should_not be_valid
    end
    
  end

end