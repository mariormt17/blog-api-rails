require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "validations" do
    it "validate presence of title" do
      should validate_presence_of(:title)
    end

    it "validate presence of content" do
      should validate_presence_of(:content)
    end

    it "validate presence of published" do
      should validate_presence_of(:published)
    end

    it "validate presence of user_id" do
      should validate_presence_of(:user_id)
    end
  end
end
