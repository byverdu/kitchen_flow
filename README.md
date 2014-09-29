## Kitchen Workflow explained in a TDD way.
==========================================

Due to my background related with the hospitality I believe that I can explain the work flow in a restaurant.

My experience is mainly on the kitchen but I know all the required steps.

Lets bake a little bit.

## Technologies used:

1. Ruby
2. RSpec

## How to use it.

```ruby

# Clone/download/fork the repo

> cd path/to/folder

> irb

> require './lib/loader'

# all classes ready to use

```

#### Possible classes

```ruby
# The main class is Restaurant

> pub = Restaurant.new();

> pub.tables       # Array with 20 tables
> pub,tables_full  # Array with tables and costumers
> pub.waiter       # Staff.new('waiter')
> pub.kitchen      # [Staff.new('chef')]

# Staff class has the following properties

> pub.waiter.duties     # ['menu','order','serve' ] 
> pub.kitchen.duties    # ['cook','order','serve' ]

> pub.waiter.section    # 'waiter' 
> pub.kitchen.section   # 'chef'

> pub.kitchen.in_duty   # 'cook' or 'order' or 'serve' 
> pub.waiter.in_duty    # 'menu' or 'order' or 'serve' 


# Costumer class

alby = Costumer.new('Albert') # name is optional


# Costumer properties

alby.hungry # nil
alby.sit    # false
alby.name   # 'Albert'
alby.status # nil


```

#### Possible methods

```ruby

# Ask the costumer if is time to eat.

# Returns true if hour is 12:00 to 13:00 or 18:00 to 19:00

alby.time_to_eat? Time,now.hour

# If is time to eat can go to the pub

alby.going_to_eat pub

```














