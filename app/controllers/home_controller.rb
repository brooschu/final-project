class HomeController < ApplicationController
    
    def home
        render("home_templates/home.html.erb")
    end 
end 