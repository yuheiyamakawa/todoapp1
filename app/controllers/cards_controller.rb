class CardsController < ApplicationController

    def index 
        board = Board.find(params[:board_id])
        @cards = board.cards.all.order(id: "DESC")
    end

    def show
      board = Board.find(params[:board_id])
      @card = board.cards.find(params[:id])
    end

    def new 
        @card = current_user.cards.new
    end

    def create
      board = Board.find(params[:board_id])
      @card = board.cards.new(card_params) 
      @card.user_id = current_user.id
      if @card.save
        redirect_to board_cards_path(board), notice: '保存できました'
      else
        flash.now[:error] = '保存に失敗しました'
        render :new
      end
    end

    def edit
      board = Board.find(params[:board_id])
      @card = board.cards.find(params[:id])
    end

    def update
      board = Board.find(params[:board_id])
      @card = board.cards.find(params[:id])
      @card.update(card_params)
      @card.user_id = current_user.id
      if @card.save
        redirect_to board_cards_path(board), notice: '更新できました'
      else
        flash.now[:error] = '更新できませんでした'
        render :edit
      end
    end

    def destroy
      board = Board.find(params[:board_id])
      card = board.cards.find(params[:id])
      card.destroy!
      redirect_to board_cards_path(board), notice:'削除に成功しました'
    end


    private
    def card_params
        params.require(:card).permit(:name, :description, :eyecatch)
    end


end