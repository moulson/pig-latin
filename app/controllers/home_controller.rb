class HomeController < ApplicationController
    def index
        
    end

    def translate(word)
        return word.gsub(/\w+/){|e|"#{e=~/^(qu|[^aeiou]+)/i?$'+$&:e+?w}ay"}
    end
end
