class CommentsController < ApplicationController
    def index
        comments = Comment.all
        render json: comments
    end

    def create
        comment = Comment.create(comment_params)
        render json: comment 
    end


    private
    
    def comment_params
        params.require(:comment).permit(:citizen_id, :police_department_id, :description, :date)
    end
end
