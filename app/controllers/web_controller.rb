class WebController < ApplicationController
    layout :resolve_layout


    protected
    def resolve_layout
        if admin_signed_in?
            "dashboard"
        else
            "aplication"
        end
    end

end