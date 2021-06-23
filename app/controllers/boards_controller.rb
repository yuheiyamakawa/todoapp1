class BoardsController < ApplicationController
  
      before_action :authenticate_user!, only: [:new] 

      def index
         @boards = Board.all.order(id: "DESC")
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
        @board = current_user.boards.find(params[:id])
      end
  
      def update
        @board = current_user.boards.find(params[:id])
          if @board.update(board_params)
          redirect_to root_path, notice: '更新できました'
          else
          flash.now[:error] = '更新できませんでした'
          render :edit
          end
      end
  
      def destroy
      board = current_user.boards.find(params[:id])
      board.destroy!
      redirect_to root_path, notice:'削除に成功しました'
      end
  
      private
      def board_params
          params.require(:board).permit(:name, :description)
      end
  
  end
