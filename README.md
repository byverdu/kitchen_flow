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
=begin

 The main class is Restaurant, when you create an instance of Restaurant, it contains the following:

=end

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





```


















