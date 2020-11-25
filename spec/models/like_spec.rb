require 'rails_helper'
describe Like do
  describe '#create' do

    it "user_id,post_idが存在すれば登録できること" do
      like = build(:like)
      expect(like).to be_valid
    end

  end
end