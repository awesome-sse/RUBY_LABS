#!env ruby
# frozen_string_literal: true

require 'selenium-webdriver'
require './pages/index.rb'

BASE_URL = 'http://localhost:3000'

driver = Selenium::WebDriver.for :chrome

index_page = IndexPage.new BASE_URL, driver

index_page
  .open
  .fill_form_with('3 2 1')
  .submit_form
  
res = index_page.result.strip
raise 'Поле результата содержит некорректные данные' unless res == 'Отрезков не нашлось...'

index_page
  .open
  .fill_form_with('1 22 aa')
  .submit_form
  
res = index_page.result.strip
raise 'Поле результата содержит некорректные данные' unless res == 'Некорректный ввод'

index_page
  .open
  .fill_form_with('1 2 3 3 2 1')
  .submit_form
  
res = index_page.result.strip.delete(' ').delete("\n")
raise 'Поле результата содержит некорректные данные' unless res == '#ОтрезкиИндексы1[1,2][0,1]2[1,2,3][0,2]3[2,3][1,2][1,2,3]::[0,2]'

driver.quit
