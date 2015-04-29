require 'mechanize'
module Hobos
  HOBOS_URL = "http://www.e-hobo.com/hoboes/"
  class Api
    def initialize
      @browser = Browser.new.browser
    end

    def hobo
      clean_name(try_hobo(false))
    end

    def hobo_by_id id
      begin
        clean_name(@browser.get("#{HOBOS_URL}#{id}").at('span').children.last.to_s)
      rescue
        ''
      end
    end

    private
    def try_hobo found_hobo
      unless found_hobo
        resp = @browser.get("#{HOBOS_URL}#{rand(1..700)}").at('span').children.last.to_s
        if resp == ""
          try_hobo false
        else
          found_hobo = true
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

    def initialize
      @browser = Mechanize.new
    end
  end
end

