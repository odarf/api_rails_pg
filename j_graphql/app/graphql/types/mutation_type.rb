module Types
  class MutationType < Types::BaseObject
    field :create_resort, ResortType, 'Create new Resort' do
      argument :name, String
      argument :email, String
      argument :description, String
    end
    field :create_apartment, ApartmentType, "Create new Apartment" do
      argument :room_type, String
      argument :description, String
      argument :resort_id, Int
    end

    def create_resort(name:, email:, description:)
      new_resort = Resort.create(name: name, email: email, description: description)
      new_resort
    end
    def create_apartment(room_type:, description:, resort_id:)
      new_apartment = Apartment.create(room_type: room_type, description: description, resort_id: resort_id)
      new_apartment
    end
  end
end