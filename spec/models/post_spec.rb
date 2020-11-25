require 'rails_helper'
describe Post do
  describe '#create' do

    it "titleがない場合は登録できないこと" do
      post = build(:post, title: nil)
      post.valid?
      expect(post.errors[:title]).to include("を入力してください")
    end
    
    it "category_idがない場合は登録できないこと" do
      post = build(:post, category_id: nil)
      post.valid?
      expect(post.errors[:category_id]).to include("を入力してください")
    end

    it "reasonがない場合は登録できないこと" do
      post = build(:post, reason: nil)
      post.valid?
      expect(post.errors[:reason]).to include("を入力してください")
    end
    
    it "yotube_urlがない場合は登録できないこと" do
      post = build(:post, youtube_url: nil)
      post.valid?
      expect(post.errors[:youtube_url]).to include("を入力してください")
    end

  end
end