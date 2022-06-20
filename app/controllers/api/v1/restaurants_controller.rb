module Api
    module V1
      class RestaurantsController < ApplicationController
        

        #before_action :set_restaurant, except:[:index, :create] 
        
        def add_role
            @user = User.find(params[:id])
            @restaurant=Restaurant.find_by(user_id: params[:id])
            @restaurant.update_attribute(:status, true)
            render json: @user
            
            
        end
      
        def index
            @restaurants=Restaurant.all
            render json: @restaurants , status: :ok
        end

    
        def show
            @restaurant = Restaurant.find(params[:id])
            render json: @restaurant, status: :ok
        end
        
       
        def create

            @restaurant = Restaurant.new(restaurant_params)
            if @restaurant.save!
                RestaurantMailer.with(restaurant: @restaurant).new_restaurant_email.deliver_later
                render json: @restaurant, status: :created
            else 
                render json: { errors: @restaurant.errors.full_messages },
                    status: :unprocessable_entity
            end
        end

        def update
            @restaurant = Restaurant.find(params[:id])

            if @restaurant.update(restaurant_params)
            render json: {status: 'SUCCESS', message: 'restaurant is updated', data:@restaurant}, status: :ok
            else
            render json: {status: 'Error', message: 'restaurant  is not updated', data:@restaurant.errors}, status: :unprocessable_entity
            end
        end

      
        def destroy
            @restaurant = Restaurant.find(params[:id])
            @restaurant.destroy
            render json: {
                message: 'deleted sucessfully.'
            }
        end

        private

            def restaurant_params
                params.permit(:restaurant_name, :restaurant_email, :restaurant_contact_number, :restaurant_address, :restaurant_city, :rest_image)
            end

            # def set_restaurant
            #     @restaurant = Restaurant.find(params[:id])
            # end
        
  
      end
    end
  end