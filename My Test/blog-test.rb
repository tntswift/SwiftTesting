require "selenium-webdriver"
require "rspec"
require "ffi"
require_relative "signup_page.rb"
require_relative "users_page.rb"


#variables
timestamp = Time.now.to_i
username = "Tricia_#{timestamp}"
email= "tricia#{timestamp}@test.com"
password = "1234a"
expect_banner_text = "Welcome to the alpha blog Tricia_#{timestamp}"


# TEST: Sign up new user for blog
describe "Blog application URL1" do
  describe "new signup to blog application" do
	    it "confirm new user successfull" do
				driver = Selenium::WebDriver.for :firefox
				driver.navigate.to "https://selenium-blog.herokuapp.com/signup"
				
				#Enter input
				signup = SignupPage.new(driver)
				signup.enter_username(username)
				signup.enter_email(email)
				signup.enter_password(password)	
				signup.submit_form()		
			
				#Confirm successful
				users = UsersPage.new(driver)
				banner_text = users.get_banner_text()
				expect(banner_text).to eq(expect_banner_text)

				driver.quit
		end
	end
end
