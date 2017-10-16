class BattlesController < ApplicationController
  def show
    @my_monster = MonsterDetail.find(params[:my_id].to_i)
    @opponent_monster = MonsterDetail.find(params[:opponent_id].to_i)
  end
end
