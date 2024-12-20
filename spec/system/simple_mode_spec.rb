require 'rails_helper'

RSpec.describe 'シンプルモードクイズ', type: :system do
  let!(:location1) { FactoryBot.create(:location, :tokyo) }
  let!(:location2) { FactoryBot.create(:location, :osaka) }

  before do
    # モック: 距離計算と選択肢生成
    allow_any_instance_of(QuizUtils).to receive(:calculate_distance).and_return(500)
    allow_any_instance_of(QuizUtils).to receive(:generate_choices).and_return([500, 600, 400])
    # モック: ランダムで2地点を取得する部分
    allow(Location).to receive_message_chain(:order, :limit).and_return([location1, location2])
  end

  context 'クイズの表示と回答', js: true do
    before do
      visit new_simple_mode_quiz_path
    end

    it 'クイズページに正しい情報が表示されること' do
      handle_unexpected_alert do
        expect(page).to have_content('東京から大阪までの距離は何kmあるでしょう？')
        expect(page).to have_button('約500km')
        expect(page).to have_button('約600km')
        expect(page).to have_button('約400km')
      end
    end

    it '正解の選択肢を選んだ場合、正解メッセージが表示されること' do
      handle_unexpected_alert do
        click_on '約500km'
        expect(page).to have_content('正解！')
      end
    end

    it '不正解の選択肢を選んだ場合、不正解メッセージが表示されること' do
      handle_unexpected_alert do
        click_on '約400km'
        expect(page).to have_content('不正解！')
      end
    end
  end

  context 'ログイン済みユーザーのクイズ履歴の保存', js: true do
    let!(:user) { FactoryBot.create(:user) }

    before do
      login_as(user) # ログイン処理
      visit new_simple_mode_quiz_path
    end

    it '正解した場合、履歴が保存されること' do
      handle_unexpected_alert do
        click_on '約500km'
        expect(QuizHistory.count).to eq(1)
        history = QuizHistory.last
        expect(history.is_correct).to be true
      end
    end

    it '不正解の場合、履歴が保存されること' do
      handle_unexpected_alert do
        click_on '約400km'
        expect(QuizHistory.count).to eq(1)
        history = QuizHistory.last
        expect(history.is_correct).to be false
      end
    end
  end

  # アラートを検知して処理するヘルパー
  def handle_unexpected_alert
    yield
  rescue Selenium::WebDriver::Error::UnexpectedAlertOpenError
    # アラートが表示された場合はOKをクリックして閉じる
    begin
      page.driver.browser.switch_to.alert.accept
    rescue Selenium::WebDriver::Error::NoSuchAlertError
      # アラートが存在しない場合は無視
    end
    retry # 処理を再試行
  end
end
