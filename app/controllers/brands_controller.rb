class BrandsController < ApplicationController

    def index 
        @brands = Brand.alpha 
    end 
end
