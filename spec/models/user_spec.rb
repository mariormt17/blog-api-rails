require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it "validate presence of email" do
      should validate_presence_of(:email)
    end

    it "validate presence of name" do
      should validate_presence_of(:name)
    end

    it "validate presence of auth_token" do
      should validate_presence_of(:auth_token)
    end

    it "validate relations" do
      should have_many(:posts)
    end
  end
end
