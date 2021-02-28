require 'rails_helper'

RSpec.describe Illust, type: :model do
  before do
    @illust = FactoryBot.build(:illust)
  end

  describe "イラスト投稿機能" do

  context '内容に問題がない場合'do
    it "全ての項目が存在すれば出品できる" do
      expect(@illust).to be_valid
    end
  end
  context '内容に問題がある場合' do
    it "titleがない場合投稿できない" do
      @illust.title = ""
      @illust.valid?
      expect(@illust.errors.full_messages).to include("Title can't be blank")
    end
    it "titleがない場合投稿できない" do
      @illust.text = ""
      @illust.valid?
      expect(@illust.errors.full_messages).to include("Text can't be blank")
    end
    it "画像がない場合投稿できない" do
      @illust.image = nil
      @illust.valid?
      expect(@illust.errors.full_messages).to include("Image can't be blank")
    end
    it "userと紐づいていなければ投稿できない" do
      @illust.user = nil
      @illust.valid?
      expect(@illust.errors.full_messages).to include("User must exist")
    end
  end
end
end
