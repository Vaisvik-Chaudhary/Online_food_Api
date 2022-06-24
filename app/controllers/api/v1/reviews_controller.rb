module Api
    module V1
      class ReviewsController < ApplicationController

       
        def index
            if params[:reviewable_type] =="Restaurant"
                if params[:reviewable_id]
                    @reviews=Review.where(reviewable_id: params[:reviewable_id])
                end
            elsif params[:reviewable_type] =="Item"
                if params[:reviewable_id]
                    @reviews=Review.where(reviewable_id: params[:reviewable_id])
                end
            else
                @reviews=Review.all
            end
            render json: @reviews , status: :ok
        end

        def show
            @review = Review.find(params[:id])
            render json: @review, status: :ok
        end

       
        def create            

            
            @review = Review.new(review_params)
            if @review.save!
                render json: @review, status: :created
            else 
                render json: { errors: @review.errors.full_messages },
                    status: :unprocessable_entity
            end
        end

        def update
            @review = Review.find(params[:id])

            if @review.update(review_params)
            render json: {status: 'SUCCESS', message: 'item is updated', data:@review}, status: :ok
            else
            render json: {status: 'Error', message: 'item  is not updated', data:@review.errors}, status: :unprocessable_entity
            end
        end

   
        def destroy
            @review = Review.find(params[:id])
            @review.destroy
        end
        private

            def review_params
                params.permit(:rating, :body , :user_id, :reviewable_type, :reviewable_id)
            end
            
         
  
      end
    end
  end