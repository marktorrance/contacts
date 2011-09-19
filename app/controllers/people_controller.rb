class PeopleController < ApplicationController
  def show
    @person = Person.find(params[:id])
    if (params[:plain])
      render :layout => false
    else
      respond_to do |format|
        format.html
        format.json { render :json => @person }
      end
    end
  end

  def dist
    # Take 2 person IDs, look up their addresses, hit Google Distance Matrix API,
    # return results
    @p1 = Person.find(params[:id])
    @p2 = Person.find(params[:p2])
    str = "origins=" + @p1.address_string_encoded
    str += "&destinations=" + @p2.address_string_encoded
    str += "&sensor=false"
    url = "http://maps.googleapis.com/maps/api/distancematrix/json?" + str

    agent = Mechanize.new
    agent.user_agent_alias = 'Mac Safari'
    page = agent.get(url)
    res = JSON.parse(page.body)
    @result = {
      :duration => res['rows'].first['elements'].first['duration']['text'],
      :dist => res['rows'].first['elements'].first['distance']['text']
    }
    render :layout => false
  end
end
