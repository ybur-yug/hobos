require 'mechanize'
require 'pry'

module Hobos
  class HoboAPI
    attr_accessor :hobos

    def initialize
      @browser = Browser.new.browser
      @hobos = @browser.get('http://www.e-hobo.com/hoboes/list/').links.map { |l| l if check_hobo l }
    end

    private
    def check_hobo link
      link.uri.to_s if link.uri.to_s.include? '/hoboes/'
    end
  end

  class Browser
    attr_accessor :browser
    attr_accessor :hobos

    def initialize
      @browser = Mechanize.new
    end
  end

end

api = Hobos::HoboAPI.new
hobos = api.hobos
puts hobos
