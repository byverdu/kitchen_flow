### WorkFlow in a Restaurant
============================

In the daily basis of a restaurant there are three important subjects; the costumer, the kitchen and the dining room. Normally the staff is working before any client arrives but this recreation will reproduce only the service.

The progress is the next. The costumer arrives to the restaurant where waiter receives him, sits him and offers him the menu.

After taking the order the kitchen staff receives the ticket and starts cooking the plates.

After some time the starters are ready to be served, the waiter takes them to the costumer. Kitchen keeps working on mains.

Waiter gives a call to the kitchen when the costumer is ready to eat the mains.

Kitchen staff finishes with the plates and send them to the waiter, who brings them to the costumer.

If the costumer is happy will leave some tips.



#### Possible names for Classes

````javascript
"costumer","kitchen","dining room","staff","menu"
````

======

#### Possible names for methods

````javascript
"arrive", "sit", "offer", "take order", "coking", "serving", "eat"
````

=======

#### Using CRC

###### Costumer

|Responsabilities|Collaborations|
| -------------- | ------------ |
| Arrives, sit   |  Dining Room |
| Order food     | Staff-waiter |
| Eats           |  Menu        |


###### Dining Room 

|Responsabilities|Collaborations|
| -------------- | ------------ |
| Hold Costumer  |  Costumer    |
| Serving        |  Staff-all   |
|                |  Menu        |
|                |  Kitchen     |



###### Kitchen

|Responsabilities|Collaborations|
| -------------- | ------------ |
| Coking         |  Dining Room |
| Sending        |  Staff-all   |
|                |  Menu        |


###### Staff

|Responsabilities|Collaborations|
| -------------- | ------------ |
| Arrives, sit   |  All         |
| Order food     |              |
| Eats           |              |

<!-- 

###### Menu

|Responsabilities|Collaborations|
| -------------- | ------------ |
| Arrives, sit   |  Dining Room |
| Order food     |  Staff       |
| Eats           |  Menu        |



-->