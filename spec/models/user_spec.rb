require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、password、password_confirmation、lastname_em、firstname_em、lastname_katakana、firstname_katakana、birth_dateが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('ニックネームを入力してください')
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールを入力してください')
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'test.test'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを入力してください')
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
      end
      it 'passwordは半角英数字混合でなければ登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '12tes'
        @user.password_confirmation = '12tes'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'lastname_emが空では登録出来ない' do
        @user.lastname_em = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('名字(全角)を入力してください')
      end
      it 'firstname_emが空では登録出来ない' do
        @user.firstname_em = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('名前(全角)を入力してください')
      end
      it 'lastname_katakanaが空では登録出来ない' do
        @user.lastname_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('名字(カタカナ)を入力してください')
      end
      it 'firstname_katakanaが空では登録出来ない' do
        @user.firstname_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('名前(カタカナ)を入力してください')
      end
      it 'birth_dateが空では登録出来ない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('生年月日を入力してください')
      end
      it 'lastname_emが漢字、ひらがな、カタカナ以外では登録出来ない' do
        @user.lastname_em = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('名字(全角)は不正な値です')
      end
      it 'firstname_emが漢字、ひらがな、カタカナ以外では登録出来ない' do
        @user.firstname_em = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前(全角)は不正な値です')
      end
      it 'lastname_katakanaがカタカナ以外では登録出来ない' do
        @user.lastname_katakana = 'てすと'
        @user.valid?
        expect(@user.errors.full_messages).to include('名字(カタカナ)は不正な値です')
      end
      it 'firstname_katakanaがカタカナ以外では登録出来ない' do
        @user.firstname_katakana = 'てすと'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前(カタカナ)は不正な値です')
      end
    end
  end
end
