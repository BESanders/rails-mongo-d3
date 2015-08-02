Rails.application.routes.draw do
root to: "default#index"
get "/d3", to: "default#scatterplot"
post "/d3", to: "default#scatterpost"
end
