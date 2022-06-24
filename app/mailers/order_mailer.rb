class OrderMailer < ApplicationMailer
    def new_order_email
        @order = params[:order]
        
        #  mail(to: "pranavdodiya72@gmail.com", subject: "You got a order!")
        mail(to: "vaisvik.chaudhary@bacancy.com", subject: "You got a order!")
    end
end