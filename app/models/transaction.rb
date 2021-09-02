class Transaction < ApplicationRecord

    def self.total_points
        total = []
        self.all.each do |t|
            total << t.points
        end
        return total.sum
    end

    def self.spend_points(num) 

        # dont drop below neg
        # if # all transaction points does not eq neg
        #     # sort transactions by oldest 
        #     # subtract until 0
        #     # move to next trans until points is 0
        #     # return how array of subtracted points and from what payer
        # else
        #     "Sorry! You do not appear to have enough points."
        # end
        # spend from oldest to newest date
        # return list of points spent
    end
end
