require 'rails_helper'
describe Comment do
  describe '#create' do

    it "user_id,post_id,textが存在すれば登録できること" do
      comment = build(:comment)
      expect(comment).to be_valid
    end

    it "textがない場合は登録できないこと" do
      comment = build(:comment, text: nil)
      comment.valid?
      expect(comment.errors[:text]).to include("を入力してください")
    end

  end
end