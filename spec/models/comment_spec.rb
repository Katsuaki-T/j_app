require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe '#comment ability' do
    before do
      @comment = FactoryBot.build(:comment)
    end

    context '内容に問題がない場合' do
      it 'ユーザーとトピックに紐づいたコメントがあればコメントできる場合' do
        expect(@comment).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'コメントがないと保存できない' do
        @comment.text = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include("文章（ぶんしょう）を入力してください")
      end

      it 'userが紐付いていないと保存できないこと' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Userを入力してください')
      end
      
      it 'topicが紐付いていないと保存できないこと' do
        @comment.topic = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Topicを入力してください')
      end

    end
  end
end
