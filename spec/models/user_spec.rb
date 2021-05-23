require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#user ability' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '内容に問題がない場合' do

      it '全てのトピックがあれば保存できる場合' do
        expect(@user).to be_valid
      end

      it 'passwordが6文字以上であれば登録できること' do
        @user.password = "000000"
        @user.password_confirmation = "000000"
        expect(@user). to be_valid
        end

        it 'identityがなくても保存できる' do
          @user.identity = ''
          expect(@user).to be_valid
        end
    end

    context '内容に問題がある場合' do

      it 'nameが空では登録できないこと' do
        @user.name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("名前（なまえ）を入力してください")
      end
  
      it 'emailが空では登録できないこと' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
  
      it 'passwordが空では登録できないこと' do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
     
      it 'passwordが5文字以下であれば登録できないこと' do
        @user.password = "12345"
        @user.password_confirmation ="12345"
        @user.valid?
        expect(@user.errors.full_messages). to include("パスワードは6文字以上で入力してください")
      end
  
      it 'passwordとpassword_confirmationが不一致では登録できないこと' do
        @user.password = "123456"
        @user.password_confirmation = "1234567"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
  
      it '重複したemailが存在する場合登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
    end
  end
end