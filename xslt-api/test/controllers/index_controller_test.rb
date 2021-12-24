# frozen_string_literal: true

require 'test_helper'

class IndexControllerTest < ActionDispatch::IntegrationTest
  test 'check rss format' do
    # Делаем запрос с параметрами - словарь превратится в lower=10&upper=100&format=rss
    get '/', params: { a: '1 2 3 4 3 2 1', format: :rss }
    # Проверили, что получили статус ответа 200 OK
    assert_response :success
    # Тип ответа лежит в его заголовках, поэтому смотрим туда.
    assert_includes @response.headers['Content-Type'], 'application/rss'
  end
end
