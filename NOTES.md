To Do
    scope method ideas
        - List orders by user
        - List orders by foodbank
    Food Bank
        scope :food_bank_orders, -> { Order.all.where("food_bank_id == self.id") }
        scope :todays_orders, -> { self.food_bank_orders.where("created_at > ?", 0.days.ago) }
        Validate based on if someone has made an order in the last week
            class Post < ActiveRecord::Base
                scope :recent, lambda { where('published_at >= ?', Time.now - 1.week) }
            end
end
    User
        List Orders for user
        scope :my_orders, -> { where(Order.all.id = self.id) }
        scope :most_recent_order, -> { self.my_orders.order(created_at: :desc LIMIT 1) }


    Your forms should correctly display validation errors.
        a. Your fields should be enclosed within a fields_with_errors class
            Watch Avi video how he adds messages onto that div field.
        b. Error messages describing the validation failures must be present within the view.

        Errors - 
            When someone tries to sign up with an already used email
            When someone logs in with wrong password
            When someone tries to visit a page that they are not logged in

Styling
    Materialize


Food Bank Idea
at least has many
at least one belongs_to

has_many through
Models
    User
        - username
        - password_digest
        
    Order
        t.string :protein
        t.string :vegetable
        t.string :fruit
        t.string :grain
        t.string :

        foreign key for user
        foreign key for foodbank
    
    Foodbank
        t.string :location

Requirements
Use the Ruby on Rails framework.

Your models must:
    • Include at least one has_many, at least one belongs_to, and at least two has_many :through relationships
    • Include a many-to-many relationship implemented with has_many :through associations. The join table must include a user-submittable attribute — that is to say, some attribute other than its foreign keys that can be submitted by the app's user

Your models must include reasonable validations for the simple attributes. You don't need to add every possible validation or duplicates, such as presence and a minimum length, but the models should defend against invalid data.

You must include at least one class level ActiveRecord scope method. a. Your scope method must be chainable, meaning that you must use ActiveRecord Query methods within it (such as .where and .order) rather than native ruby methods (such as #find_all or #sort).

Your application must provide standard user authentication, including signup, login, logout, and passwords.

Your authentication system must also allow login from some other service. Facebook, Twitter, Foursquare, Github, etc...

You must include and make use of a nested resource with the appropriate RESTful URLs.
    • You must include a nested new route with form that relates to the parent resource
    • You must include a nested index or show route

Your forms should correctly display validation errors.
    a. Your fields should be enclosed within a fields_with_errors class
    b. Error messages describing the validation failures must be present within the view.

Your application must be, within reason, a DRY (Do-Not-Repeat-Yourself) rails app.
    • Logic present in your controllers should be encapsulated as methods in your models.
    • Your views should use helper methods and partials when appropriate.
    • Follow patterns in the Rails Style Guide and the Ruby Style Guide.

Do not use scaffolding to build your project. Your goal here is to learn. Scaffold is a way to get up and running quickly, but learning a lot is not one of the benefits of scaffolding.