class ReportsController < WebController
    before_action :authenticate_admin!

    def index
        @observations_2mon = Observation.where(:created_at => 2.month.ago.beginning_of_month..2.month.ago.end_of_month).count #2 meses atrás
        @observations_1mon = Observation.where(:created_at => 1.month.ago.beginning_of_month..1.month.ago.end_of_month).count #1 mes atrás
        @observations_current = Observation.where(:created_at => Time.now.beginning_of_month..Time.now).count
    
        #test
        @observations_2mon = 60
        @observations_1mon = 15
        @observations_current = 35
    end

end