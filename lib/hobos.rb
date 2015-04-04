require 'mechanize'

module Hobos

  class HoboAPI
    def initialize
      @browser = Browser.new.browser
    end

    def hobo uid
      clean_name(@browser.get("http://www.e-hobo.com/hoboes/#{uid}").at('span').children.last.to_s)
    end

    private
    def clean_name hobo_name
      hobo_name.gsub!(/\d/, '')
      hobo_name.gsub!('#', '')
      hobo_name.gsub!(': ', '')
      hobo_name
    end
  end

  class Browser
    attr_accessor :browser
    attr_accessor :hobos_list

    def initialize
      @browser = Mechanize.new
      @hobos_list = @browser.get("http://www.e-hobo.com/hoboes/list/")
    end
  end

end

