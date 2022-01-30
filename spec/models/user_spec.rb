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
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do 
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'test.test'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordは半角英数字混合でなければ登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '12tes'
        @user.password_confirmation = '12tes'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'lastname_emが空では登録出来ない' do
        @user.lastname_em = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname em can't be blank")
      end
      it 'firstname_emが空では登録出来ない' do
        @user.firstname_em = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname em can't be blank")
      end
      it 'lastname_katakanaが空では登録出来ない' do
        @user.lastname_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname katakana can't be blank")
      end
      it 'firstname_katakanaが空では登録出来ない' do
        @user.firstname_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname katakana can't be blank")
      end
      it 'birth_dateが空では登録出来ない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
      it 'lastname_emが漢字、ひらがな、カタカナ以外では登録出来ない' do
        @user.lastname_em = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname em is invalid")
      end
      it 'firstname_emが漢字、ひらがな、カタカナ以外では登録出来ない' do
        @user.firstname_em = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname em is invalid")
      end
      it 'lastname_katakanaがカタカナ以外では登録出来ない' do
        @user.lastname_katakana = 'てすと'
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname katakana is invalid")
      end
      it 'firstname_katakanaがカタカナ以外では登録出来ない' do
        @user.firstname_katakana = 'てすと'
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname katakana is invalid")
      end
    end
  end
end
