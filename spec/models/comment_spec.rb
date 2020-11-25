require 'rails_helper'
describe Comment do
  describe '#create' do

    it "nameとemail、passwordとpassword_confirmationが存在すれば登録できること" do
      comment = build(:comment)
      expect(comment).to be_valid
    end

    it "user_idがない場合は登録できないこと" do
      comment = build(:comment, user_id: nil)
      comment.valid?
      expect(comment.errors[:user_id]).to include("を入力してください")
    end
    
    it "post_idがない場合は登録できないこと" do
      comment = build(:comment, post_id: nil)
      comment.valid?
      expect(comment.errors[:post_id]).to include("を入力してください")
    end

    it "textがない場合は登録できないこと" do
      comment = build(:comment, text: nil)
      comment.valid?
      expect(comment.errors[:text]).to include("を入力してください")
    end

  end
end