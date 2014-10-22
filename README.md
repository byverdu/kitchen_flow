## Kitchen Workflow explained in a TDD way.
==========================================

Due to my background related with the hospitality I believe that I can explain the work flow in a restaurant.

My experience is mainly on the kitchen but I know all the required steps.

Lets bake a little bit.

## Technologies used:

1. Ruby
2. RSpec

## How to run the tests

```ruby
# Clone/download/fork the repo https://github.com/byverdu/kitchen_flow.git

> cd path/to/folder

> rspec -fd
```

## How to use it.

```ruby
# Clone/download/fork the repo https://github.com/byverdu/kitchen_flow.git

> cd path/to/folder

> irb

> require './lib/loader'

# all classes ready to use
```

#### Possible classes

```ruby
# The main class is Restaurant
# Initialized with 20 tables, 1 waiter, 1 chef.

> pub = Restaurant.new();

> pub.tables       # Array with 20 tables
> pub.tables_full  # Array with tables and costumers
> pub.waiter       # Staff.new('waiter')
> pub.kitchen      # [Staff.new('chef')]
> pub.is_full?

# Staff class has the following properties

> pub.waiter.duties     # ['menu','order','serve' ] 
> pub.kitchen.duties    # ['cook','order','serve' ]

> pub.waiter.section    # 'waiter' 
> pub.kitchen.section   # 'chef'

> pub.kitchen.in_duty   # 'cook' or 'order' or 'serve' 
> pub.waiter.in_duty    # 'menu' or 'order' or 'serve' 


# Costumer class

> alby = Costumer.new('Albert') # name is optional


# Costumer properties

alby.hungry # nil
alby.sit    # false
alby.name   # 'Albert'
alby.status # nil


```

#### Possible methods before going to the restaurant

```ruby
# Ask the costumer if is time to eat.

# Returns true if hour is 12:00 to 13:00 or 18:00 to 19:00


> alby.time_to_eat? Time.now.hour
> alby.hungry = true

# If is time to eat can go to the pub
# Otherwise raise error 'Stay hungry, Stay foolish'

> alby.going_to_eat pub 
> alby.hungry = true
> alby.sit    = true
> alby.status = nil
> 'yes, lets go to eat'

=begin

Effects of calling alby.going_to_eat pub 

pub.sitting_actual costumer
pub.tables.count = 1
pub.waiter.give_menu costumer
alby.status = 'menu'

=end
```

#### Possible methods inside the restaurant

```ruby
> alby.ready_to_order pub.waiter
> alby.status         = 'order'
> pub.waiter.in_duty  = 'order'

> pub.waiter.sent_order pub.chef
> pub.chef.in_duty = 'order'

> pub.chef.start_cooking
> pub.chef.in_duty = 'cook'
> 1800 # Seconds before the dish is ready

> pub.waiter.serving_food alby
> alby.status        = 'serve'
> pub.waiter.in_duty = 'serve'

> alby.enjoying_meal
> alby.status = 'eating'
> 1800 # Seconds before finishes the dish
```

#### Time to pay

```ruby
# costumer.time_to_pay returns 3 possible random values

> alby.time_to_pay
> alby.mood = 'acceptable'
> 'give me back every penny'

> alby.time_to_pay
> alby.mood = 'marvelous'
> 'oh man, best deal ever'

> alby.time_to_pay
> alby.mood = 'horrible'
> 'run run run'
```










