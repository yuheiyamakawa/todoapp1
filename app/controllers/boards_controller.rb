class BoardsController < ApplicationController
  
      before_action :authenticate_user!, only: [:new] 

      def index
         @boards = Board.all
      end
  
      def show
      end
  
      def new
        @board = Board.new
      end
  
      def create
        @board = current_user.boards.new(board_params)
        if @board.save
            redirect_to root_path, notice: '保存できました'
        else
            flash.now[:error] = '保存に失敗しました'
            render :new
        end
      end
  
      def edit
      end
  
      def update
      end
  
      def destroy
      end
  
      private
      def board_params
          params.require(:board).permit(:name, :description)
      end
  
  end
