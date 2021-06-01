require 'rails_helper'

RSpec.describe Topic, type: :model do
  describe '#topic ability' do
    before do
      @topic = FactoryBot.build(:topic)
    end

    context '内容に問題がない場合' do
      it '全てのトピックがあれば保存できる場合' do
        expect(@topic).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'sentence_idが最初の状態だと保存できない' do
        @topic.sentence_id = 1
        @topic.valid?
        expect(@topic.errors.full_messages).to include("文章(ぶんしょう)を 選(えら)びましょう")
      end

      it 'descriptionがないと保存できない' do
        @topic.description = ''
        @topic.valid?
        expect(@topic.errors.full_messages).to include("説明文(せつめいぶん)を 書(か)きましょう")
      end

      it 'userが紐付いていないと保存できないこと' do
        @topic.user = nil
        @topic.valid?
        expect(@topic.errors.full_messages).to include('Userを入力してください')
      end
      
    end
  end
end