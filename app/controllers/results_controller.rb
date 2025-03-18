class ResultsController < ApplicationController
  def index
    sql = %(
      SELECT b.name as band_name, count(u.band_id) as total_votes from users u
      JOIN bands b on u.band_id = b.id 
      GROUP BY u.band_id
      ORDER BY total_votes DESC;
      )

    @results = ActiveRecord::Base.connection.execute(sql).to_a
  end
end
