module ViewCounter
  private

    def inc_counter
      if session[:counter].nil?
        session[:counter] = 0
      else
        session[:counter] += 1
      end
      @view_counter = session[:counter]
    end
end
