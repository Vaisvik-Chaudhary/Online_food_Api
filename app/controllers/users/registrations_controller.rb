class Users::RegistrationsController < Devise::RegistrationsController
    respond_to :json

   
    private


        def respond_with(resource, _opts = {})
            register_success && return if resource.persisted?

            register_failed

        end

        def register_success
            # UserMailer.with(user: @user).welcome_email.deliver_later    
            render json: {
                message: 'Signed up sucessfully.'
                #user: current_user
            }, status: :ok
        end

    def register_failed 
        render json: { message: 'Something went wrong.'}, status: :unprocessable_entity
    end
    
    def user_params
        params.permit(:email, :name, :contact_number, :password, :role, :username)
    end
end