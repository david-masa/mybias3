FactoryBot.define do

  factory :post do
    user_id             {3}
    title               {"推しの名前"}
    reason              {"理由"}
    category_id         {"KPOP"}
    youtube_url         {"https://www.youtube.com/watch?v=ZOEmagVFe1o"}
  end

end