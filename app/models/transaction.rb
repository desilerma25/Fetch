class Transaction < ApplicationRecord

    def self.total_points
        total = []
        self.all.each do |t|
            total << t.points
        end
        return total.sum
    end

    def self.spend_points(spend)
        sorted = self.all.sort_by(&:date)
        used_points = {}
        return_resp = []
        if self.total_points < spend
            print "Sorry, you do not appear to have enough points."
        else
            i = 0
            while i < sorted.length do
                if spend <= 0 
                    break
                end
                if sorted[i].points > 0
                    if spend - sorted[i].points >= 0
                        used_points[sorted[i].payer] = -1 * sorted[i].points
                        # used_points["payer"] = sorted[i].payer
                        # used_points["points"] = -1 * sorted[i].points
                        spend = spend - sorted[i].points
                        Transaction.update(sorted[i].id, :points => 0)
                    else
                        remaining = sorted[i].points - spend
                        used_points[sorted[i].payer] = -1 * spend
                        # used_points["payer"] = sorted[i].payer
                        # used_points["points"] = -1 * spend
                        spend = 0
                        Transaction.update(sorted[i].id, :points => remaining)
                    end
                else
                    spend = spend - sorted[i].points
                    used_points[sorted[i].payer] = -sorted[i].points
                    # used_points["payer"] = sorted[i].payer
                    # used_points["points"] = -sorted[i].points
                    Transaction.update(sorted[i].id, :points => 0)
                end
                i+= 1
            end
        end
        used_points
    end

end
