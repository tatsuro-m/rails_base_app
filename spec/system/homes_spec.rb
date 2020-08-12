require 'rails_helper'

RSpec.describe 'Homes', type: :system do
  it 'home#indexにアクセスできること' do
    visit "/homes"
    expect(page).to have_content "雛形アプリの確認用ページです"
  end
end
