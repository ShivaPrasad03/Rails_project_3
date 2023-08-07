class Portfolio < ApplicationRecord
    # default_scope {where("bought_price > 500")}
    enum :holding_status, {yes: 1, no: 0}
    belongs_to :investor
    validates :stock_name, uniqueness: {scope: :investor_id, message: "& investor pair must be unique"}
    validates :stock_name, :holding_status, :bought_price, :quantity, presence: true
    validates :bought_price, numericality: {message: "must provide valid price"}

    validate :custom_validate

    before_save :before_save_cb
    after_save :after_save_cb


    #custom_validate 
    def custom_validate
        if self.quantity < 1 
            errors.add(:quantity, "must be greater than 0")
        end
    end


    #callbacks 
    def before_save_cb 
        puts "------------------------Trying to add new stock to portfolio-------------------------"
    end

    def after_save_cb 
        puts "-------------------------Stock added to portfolio successfully------------------------"
    end
end
