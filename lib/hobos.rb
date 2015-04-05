require 'mechanize'
module Hobos

  class Api
    def initialize
      @browser = Browser.new.browser
    end

    def hobo uid
      clean_name(try_hobo(false))
    end

    private
    def try_hobo found_hobo?
      while !found_hobo?
        resp = @browser.get("http://www.e-hobo.com/hoboes/#{uid}").at('span').children.last.to_s
        if resp == "{ 'error': { 'message': 'bad UID' } }"
          try_hobo false
        else
          found_hobo? = true
        end
      end
      resp
    end
    
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

