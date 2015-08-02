class DefaultController < ApplicationController
  def index
    require 'mongo'
  
    # client = Mongo::Client.new Rails.configuration.mongo_endpoint+"/testdb"
    # result = "Here are your documents...\n" + "-"*90 + "\n\n"
    # 
    # client["test collection"].find().each do |doc|
    #   h = doc.to_hash
  
    #   h.each_pair do |x,y|
    #     result += "%s -> %s\n" % [x, y]
    #   end
    # end
  end
  
  def scatterplot
    client = Mongo::Client.new Rails.configuration.mongo_endpoint+"/testdb"
    result = []
    
    client["testdataset"].find().each do |doc|
      h = doc.to_hash
      datapoint = h['datapoint']
  
      result.push({
        'value' => datapoint[0],
        'freq' => datapoint[1]
      })
    end
    require 'json'
    @data = result.to_json.to_s
  end
  
  def scatterpost
    if params[:b1] == "add"
        client = Mongo::Client.new Rails.configuration.mongo_endpoint+"/testdb"
        client["testdataset"].insert_one({"datapoint" => [params[:x].to_f, params[:y].to_f]})
        redirect_to "/d3"
    end
    if params[:b2] == "clear"
        client = Mongo::Client.new Rails.configuration.mongo_endpoint+"/testdb"
        client["testdataset"].drop()
        redirect_to "/d3"
    end 
  end
end
