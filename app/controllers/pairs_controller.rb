class PairsController < ApplicationController

  def index
  end

  def show
    id = current_user.id
    @user = User.find(id)
    today = Date.today
    tomorrow = Date.tomorrow
    days_of_the_week = (today.at_beginning_of_week..today.at_end_of_week).to_a[0..4]
    @today_pair = get_pair(id, today)
    @tomorrow_pair = get_pair(id, tomorrow)
    @weeks_pairs = days_of_the_week.map { |day| get_pair(id, day) }
  end

  def get_pair id,date
    pair_id = Pairing.where(day: date, user_id: id)[0].pair_id
    pair = User.find(pair_id)
  end

  def all
    @pairs = Pairing.all
  end
end
