class UsersController < ApplicationController
    
    before_action :authenticate_user!

    def show
        @user = User.find(params[:id])
        @allow_visit = FALSE
        current_user.companies.each do |company|
            company.job_postings.each do |jobposting|
                jobposting.job_applications.each do |application|                     
                    if @user == application.user
                        @allow_visit = TRUE
                    end
                end
            end
        end  

        if current_user.is_recruiter && @user==current_user
            redirect_to edit_user_registration_url
        elsif !current_user.is_recruiter && @user==current_user
            render :show
        elsif current_user.is_recruiter && @allow_visit == TRUE
            render :show
        else
            redirect_to user_profile_path(current_user), flash: { error: "You do not have permission to do that." }
        end

        
    end

    
end
