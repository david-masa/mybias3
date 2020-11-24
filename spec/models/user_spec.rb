require 'rails_helper'
describe User do
  describe '#create' do

    it "nameがない場合は登録できないこと" do
      user = build()
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end
    
    it "emailがない場合は登録できないこと" do
      user = User.new(name: "Alexa", email: nil, password: "00000000", password_confirmation: "00000000")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

  end


end