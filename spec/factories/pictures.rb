FactoryBot.define do
  factory :picture do 
    goodsImage { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpeg')) }
    association :good
  end
end