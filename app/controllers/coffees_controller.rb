class CoffeesController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new 
        @coffee = Coffee.new 
        @coffee.build_brand 
    end 

    def create 
        @coffee = Coffee.new(coffee_params)
        @coffee.user_id = current_user.id 
     
        if @coffee.save 
            redirect_to coffee_path(@coffee)
        else 
            @coffee.build_brand 
            render :new 
    end 
end 

def index 
    @title = "All"
    @coffees = Coffee.order_by_rating.includes(:brand)
end 

def show 
    @coffee = Coffee.find_by_id(params[:id])
end 


def edit 
end 

def hazelnut
    # @coffees = Coffee.all.select do |coffee| 
    #     coffee.flavor.include?('Hazelnut')
    # binding.pry
    @title = "Hazelnut"
    @coffees = Coffee.hazelnut 
    render :index
end 

def vanilla 
    @coffees = Coffee.vanilla 
    @title = "Vanilla"
    render :index
end 

def update 
    if @coffee.update(coffee_params)
        redirect_to coffee_path(@coffee)
    else 
        render :edit 
    end 
end 

    private 

    def coffee_params 
        params.require(:coffee).permit(:flavor, :description, :brand_id, brand_attributes: [:name])
    end 
end
