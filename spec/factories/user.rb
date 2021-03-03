FactoryBot.define do
  factory :user do
    nickname                {'test'}
    email                   {'test@gmail.com'}
    password                {'Ebi04623'}
    password_confirmation   {'Ebi04623'}
    first_name              {'山田'}
    last_name               {'太郎'}
    first_name_kana         {'ヤマダ'}
    last_name_kana          {'タロウ'}
    birthday                {'1999-01-01'}
  end
end