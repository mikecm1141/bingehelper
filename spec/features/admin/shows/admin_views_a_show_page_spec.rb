require 'rails_helper'

describe 'As an admin' do
  before(:each) do
    @admin_user = User.create!(name: 'Mike', email: 'mikecm@gmail.com', password: 'password', password_confirmation: 'password', admin: true)

    visit login_path

    fill_in :login_email, with: @admin_user.email
    fill_in :login_password, with: @admin_user.password
    click_on 'Login'
  end
  describe 'when I visit /admin/show/:id' do
    before(:each) do
      @show = Show.create!(title: 'Futurama')
    end
    scenario 'I see the show title' do
      visit admin_show_path(@show)

      expect(page).to have_content(@show.title)
    end
    it 'has links to edit and delete that show' do
      visit admin_show_path(@show)

      expect(page).to have_link('Edit', href: edit_admin_show_path(@show))
      expect(page).to have_link('Delete', href: admin_show_path(@show))
    end
  end
end
