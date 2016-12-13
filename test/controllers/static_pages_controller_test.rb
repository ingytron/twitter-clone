require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @base_title = "Bettwitter &mdash; the Amazing Twitter Clone"
  end

  test "should get home" do
    get :home
    # get static_pages_home_url
    assert_response :success # Checks for 200 Ok status
    assert_select "title", "Home | #{@base_title}"
  end

  test "should get help" do
    get :help
    # get static_pages_help_url
    assert_response :success
    assert_select "title", "Help | #{@base_title}"
  end

  test "should get about" do
    get :about
    # get static_pages_about_url
    assert_response :success
    assert_select "title", "About | #{@base_title}"
  end

  test "should get contact" do
    get :contact
    assert_response :success
    assert_select "title", "Contact | #{base_title}"
  end

end
