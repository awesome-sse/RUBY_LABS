# frozen_string_literal: true

require 'nokogiri'
require 'open-uri'

class IndexController < ApplicationController
  before_action :parse_params, only: :output
  before_action :prepare_url, only: :output

  def input; end

  def output
    api_response = open(@url)

    case @side
    when 'server'
      @result_xml = xslt_transform(api_response).to_html
    when 'client'
      render xml: insert_browser_xslt(api_response).to_xml
    end
  end

  private

  # CONSTS
  BASE_API_URL           = 'http://localhost:3000/?format=xml'
  XSLT_SERVER_TRANSFORM  = "#{Rails.root}/public/server_transform.xslt"
  XSLT_BROWSER_TRANSFORM = '/browser_transform.xslt'

  def parse_params
    @array = params[:a]
    @side = params[:side]
  end

  def prepare_url
    @url = "#{BASE_API_URL}&a=#{@array}"
  end

  # Преобразование XSLT на сервере (код Самарева).
  def xslt_transform(data, transform: XSLT_SERVER_TRANSFORM)
    doc = Nokogiri::XML(data)
    xslt = Nokogiri::XSLT(File.read(transform))
    xslt.transform(doc)
  end

  # Чтобы преобразование XSLT на клиенте работало, надо вставить ссылку на XSLT.
  # Делается это с помощью nokogiri через ProcessingInstruction (потому что ссылка
  # на XSLT называется в XML processing instruction).
  def insert_browser_xslt(data, transform: XSLT_BROWSER_TRANSFORM)
    doc = Nokogiri::XML(data)
    xslt = Nokogiri::XML::ProcessingInstruction.new(doc,
                                                    'xml-stylesheet',
                                                    "type=\"text/xsl\" href=\"#{transform}\"")
    doc.root.add_previous_sibling(xslt)
    # Возвращаем doc, так как предыдущая операция возвращает не XML-документ.
    doc
  end
end
