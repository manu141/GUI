#validating the web form no data entered for the required question and looking for the error message.
require 'test/unit'
require 'selenium-webdriver'
require 'rubygems'

class MyTest < Test::Unit::TestCase

  # setup of the webdriver and url and wait time
  def setup

    #define driver for firefox webdriver
    @driver=Selenium::WebDriver.for :firefox
    #maximize the window
    @driver.manage.window.maximize
    #navigate to the test site
    @driver.navigate.to "https://docs.google.com/forms/d/e/1FAIpQLSeT6MPuoZm8Ks3TUw9j3lTKeUlwvcVseFeear6OF4ey24Q40g/viewform"
    #wait until the Logout link displays, timeout in 30 seconds
    @wait = Selenium::WebDriver::Wait.new(:timeout => 30) # seconds
    
  end
    
    def test_webpage
    
        #Do not Enter your name on the web form
        addName = @driver.find_element(:id, 'entry_1041466219')
        
        #verify the state of your name text box
        puts " Test Passed: no data Entered" if addName.selected? == false
        
        checkbox = @driver.find_element(:id, 'group_310473641_1')
        
        #verify the state of checkbox
        puts " Test Passed: checkbox is not selected" if checkbox.selected? == false
        
        checkbox2 = @driver.find_element(:id, 'group_310473641_2')
        
        #verify the state of checkbox2
        puts " Test Passed: checkbox2 is not selected" if checkbox2.selected? == false

        #submit the web form
        submit = @driver.find_element(:id, 'ss-submit')
        puts "Test passed: Clik on Submit button" if assert @wait.until {@driver.find_element(:id, 'ss-submit').displayed?
        }    
        submit.click

        #required message
        puts "Test passed: required message" if assert @wait.until {@driver.find_element(:class, 'required-message').displayed?
        }
        
        sleep 5
    
        #quit the driver   
        def teardown
            @driver.quit
        end
    end
end