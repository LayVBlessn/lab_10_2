require 'rails_helper'

def submit_form(range)
  visit '/'
  fill_in 'range', with: range
  click_on 'Отправить'
  page
end

def submit_form_xml(range)
  visit '/'
  fill_in 'range', with: range
  choose 'Отображение сырого XML на стороне браузера'
  click_on 'Отправить'
  page
end

describe 'ProxyController' do

  it 'responds with XML when client-side XSLT is selected' do
    expect(submit_form_xml(174).source).to include('xml')
  end

  it 'responds with XML when client-side XSLT is selected' do
    expect(submit_form_xml(174).source).not_to include('<html>')
  end

  it 'responds with HTML when server-side XSLT is selected' do
    expect(submit_form(174).source).to include('<html>')
  end

end
