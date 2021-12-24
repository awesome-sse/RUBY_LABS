# frozen_string_literal: true

require_relative 'page.rb'

class IndexPage < Page
  def initialize(base_url, driver)
    super
    @path = '/'
  end

  def open
    super
    @form = driver.find_element :tag_name, 'form'
    self
  end

  def fill_form_with(text)
    input = form.find_element name: :a
    input.send_keys text
    self
  end

  def submit_form
    btn = form.find_element name: :commit
    btn.click
    self
  end

  def result
    wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    result = wait.until { driver.find_element(:id => "result_output") }
    result.text
  end

  protected

  attr_reader :path

  private

  attr_reader :form
end