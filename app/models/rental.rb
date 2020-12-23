class Rental < ActiveRecord::Base
    belongs_to :vhs
    belongs_to :client

    

    def due_date
        self.created_at + 7.days
    end

    def self.past_due_date
        Rental.all.select{|r| r if r.updated_at > r.due_date}
    end

end
        





# Rental.past_due_date - returns a list of all the rentals past due date, currently rented or rented in the past
 
# past_due = Rental.where (self.due_date < ?, Date.today)

# past_due = self.due_date

#  self.due_date.select("due_date < ?", Date.today)
# if self.created_at + 7.days == self.updated_at
#     not overdue
# elsif self.created_at + 7.days < self.updated_at
#     overdue
#     Rental.all.select{|r|r.updated_at > r.due_date}


    
