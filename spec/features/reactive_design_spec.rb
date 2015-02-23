require 'rails_helper'

module ResponsiveHelpers
 
  def resize_window_to_mobile
    resize_window_by([640, 480])
  end
 
  def resize_window_to_tablet
    resize_window_by([960, 640])
  end
 
  def resize_window_default
    resize_window_by([1024, 768])
  end
 
  private
 
  def resize_window_by(size)
    Capybara.current_session.driver.browser.manage.window.resize_to(size[0], size[1]) if Capybara.current_session.driver.browser.respond_to? 'manage'
  end
 
end

include ResponsiveHelpers

context 'it has a reactive design' do

  it 'when extra small "pandagram" should not be seen' do
    visit ('/')
    resize_window_to_mobile
    expect(page).not_to have_content('logo')
  end
  
end