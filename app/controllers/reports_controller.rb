class ReportsController < WebController
    before_action :authenticate_admin!

    def spots_index
        
    end

    def caretakers_index
        @observations_2mon = Observation.where(:created_at => 2.month.ago.beginning_of_month..2.month.ago.end_of_month).count #2 meses atrás
        @observations_1mon = Observation.where(:created_at => 1.month.ago.beginning_of_month..1.month.ago.end_of_month).count #1 mes atrás
        @observations_current = Observation.where(:created_at => Time.now.beginning_of_month..Time.now).count
    
        #test
        @observations_2mon = 60
        @observations_1mon = 15
        @observations_current = 35

        @caretakers = User.where(role: 0)
    end

    def caretaker_history
        caretaker = User.find_by_id(params[:id])

        #Tarefas feitas
        ths = TaskHasSpot.where(spot: caretaker.spots)
        @details_2mon = Detail.where(created_at: 2.month.ago.beginning_of_month..2.month.ago.end_of_month, task_has_spot: ths).count #2 mes atrás
        @details_1mon = Detail.where(created_at: 1.month.ago.beginning_of_month..1.month.ago.end_of_month, task_has_spot: ths).count #1 mes atrás
        @details_current = Detail.where(:created_at => Time.now.beginning_of_month..Time.now, task_has_spot: ths).count
        
        


        render json: { feitas2: @details_2mon, feitas1: @details_1mon, feitas_current: @details_current }
    end

end