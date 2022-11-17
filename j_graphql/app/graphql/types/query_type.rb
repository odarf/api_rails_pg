module Types
  class QueryType < GraphQL::Schema::Object
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    field :all_resorts, [ResortType], 'All Resorts everywhere'do
      argument :size, Int, required: false, default_value: 15
    end
    field :resort, ResortType, 'One Resort by its ID'do
      argument :id, Int, required: true
    end
    field :all_apartments, [ApartmentType], 'All Apartment everywhere'do
      argument :size, Int, required: false, default_value: 15
    end
    field :apartment, ApartmentType, 'One Apartment by its ID'do
      argument :id, Int, required: true
    end

    def all_resorts(size:)
      Resort.all.limit(size).order(id: :asc)
    end
    def resort(id:)
      Resort.find(id)
    end
    def all_apartments(size:)
      Apartment.all.limit(size).order(id: :asc)
    end
    def apartment(id:)
      Apartment.find(id)
    end
  end
end