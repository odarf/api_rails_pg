Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"
  get "/graphql", to: "graphql#execute"
  get 'resort/index'
  get 'resort/show'


  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
end
