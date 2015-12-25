require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  # This is a step by step way to test the views.
  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    # On the root path there must be 2 ahrefs.
    assert_select 'a[href=?]', root_path, count: 2
    assert_select 'a[href=?]', help_path
    assert_select 'a[href=?]', about_path
    assert_select 'a[href=?]', contact_path
    get signup_path
    assert_select 'title', full_title('Sign up')
  end

end