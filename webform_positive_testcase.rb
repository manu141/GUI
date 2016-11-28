#Validating the web form page with postive scenario and with valid values.

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
    #wait,timeout in 10 seconds
    @wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds
    
  end

  def test_webpage
    
    #valdiate the image on the web form
    puts "Test Passed: found the image" if assert @wait.until {image = @driver.find_element(:class, 'ss-header-image-sizer').displayed?
    }
    
    #valdiate the header title on the web form
    form = assert @wait.until {
      element = @driver.find_element(:class, 'ss-form-title')
      element if element.displayed?
    }
    puts "Test Passed: found the title" if form 

    #valdiate the *required on the web form
    puts "Test Passed: found *required" if assert @wait.until {required = @driver.find_element(:class,'ss-required-asterisk').displayed?
    }
    
    #valdiate the yourName exists
    puts "Test Passed: found yourName" if assert @wait.until {yourName = @driver.find_element(:class,'ss-q-title').displayed?
    }
    
    #Enter your name on the web form
    addName = @driver.find_element(:id, 'entry_1041466219')
    addName.send_keys("test person")
    
    #check that the Dev question exists
    puts "Test Passed: found text do you enjoy development?" if assert @wait.until {yourName = @driver.find_element(:class, 'ss-q-item-label' ).displayed?
    }

    #check that the checkbox exists
    checkboxValidate = assert @wait.until {
    check =@driver.find_element(:class, 'ss-choices-required')
    check if check.displayed?
    }
    puts " Test Passed: found the checkbox" if checkboxValidate
      
    #click the checkbox
    checkbox = @driver.find_element(:id, 'group_310473641_1')
    checkbox.click    
    
    #verify the state of checkbox
    puts " Test Passed: checkbox is selected" if checkbox.selected? == true

    #check that the testing framework question exists
    puts "Test Passed: found question What is your favorite testing framework?" if assert @wait.until {yourName = @driver.find_element(:class, 'ss-form-question').displayed?
    }

    #check the drop down and select the #JUnit value
    my_select =  @driver.find_element(:id, 'entry_262759813')
    my_select.find_elements(:tag_name => "option").find do |option|
    option.text == "JUnit"
    end.click

    #check the comment text box and enter the comments
    puts "Test Passed: comment test box found" if assert @wait.until {@driver.find_element(:id,'entry_649813199').displayed?
    }
    comments = @driver.find_element(:id, 'entry_649813199').send_keys("Testing the comments")
    
    #verify the password warning text
    warning = @driver.find_element(:class, 'ss-password-warning')
    puts = "Test Passed: warning message found" if assert @wait.until {@driver.find_element(:class, 'ss-password-warning').displayed?
    }
    
    #verify the powered-by text
    powered = @driver.find_element(:class, 'powered-by-text')
    puts = "Test Passed: warning message found" if assert @wait.until {@driver.find_element(:class, 'powered-by-text').displayed?
    }

    #verify the logo
    logo = @driver.find_element(:class, 'ss-logo-image')
    puts = "Test Passed: logo found" if assert @wait.until {@driver.find_element(:class, 'ss-logo-image').displayed?
    }

    #verify the disclaimer text
    disclaimer = @driver.find_element(:class, 'disclaimer-msg')
    puts = "Test Passed: disclaimer text found" if assert @wait.until {@driver.find_element(:class, 'disclaimer-msg').displayed?
    }

    #verify the report abuse link
    report = @driver.find_element(:xpath, '//a[text()="Report Abuse"]')
    puts = "Test Passed: report abuse link found" if assert @wait.until {@driver.find_element(:xpath, '//a[text()="Report Abuse"]').displayed?
    }

    #verify the Terms of Service link
    service = @driver.find_element(:xpath, '//a[text()="Terms of Service"]')
    puts = "Test Passed: Terms of Service link found" if assert @wait.until {@driver.find_element(:xpath, '//a[text()="Terms of Service"]').displayed?
    }

    #verify the Additional Terms link
    additional = @driver.find_element(:xpath, '//a[text()="Additional Terms"]')
    puts = "Test Passed: Additional Terms link found" if assert @wait.until {@driver.find_element(:xpath, '//a[text()="Additional Terms"]').displayed?
    }

    #submit the web form
    submit = @driver.find_element(:id, 'ss-submit')
    puts "Test passed: Clik on Submit button" if assert @wait.until {@driver.find_element(:id, 'ss-submit').displayed?
    }    
    submit.click

    #submit succssfull
    puts "Test passed: Your response has been recorded." if assert @wait.until {@driver.find_element(:class, 'ss-resp-message').displayed?
    }
    
    sleep 5

    #quit the driver   
    def teardown
      @driver.quit
    end
  end
end