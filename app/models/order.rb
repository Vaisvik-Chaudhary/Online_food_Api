class Order < ApplicationRecord
   
    belongs_to :user

    private

    # def set_delivery_id
    #     self.delivery_id=Delivery.all.sample.id
    #     @users=User.where(role: "Delivery Man").select(:id)
    #     self.delivery_id= @users.all.sample.id
    # end
    

end
