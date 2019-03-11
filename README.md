# recipe
Goals:
#high priority
  The app shows me
    what ingredients I need to consume  -done
    and how soon, -done
#    and possible choices of cuisines with such ingredients.
      how? cuisines, upon its generation checks ri's availability,
      and stores that in itself

#medium priority
#  The app somehow manages quantity of ingredients

#low priority
#  The app knows what season each ingredients are available and their prices.



#To achieve high priority, the app needs to be able to:
#  prioritize ingredients
    know current date. -done
    know expiration date -done
#      from the stock list : NEEDS TO BE WORKED ON
      otherwise by looking up database of ingredients -done
#  with ingredients in stock prioritized, : NOT DONE AT ALL
    show recipes that only require available ingredients
    show recipes that require additional ingredients,
      and what ingredients they require
#  has databases of
    available ingredients -done
#    recipes : NOT DONE AT ALL
      high priority: required ingredients
      low priority: the cooking process
#    general knowledge about ingredients
      high priority: how fast the ingredient expires -done
      medium priority: available seasons
      low priority: prices of the ingredient depending on seasons


method inspect_the_refrigerator

show following in ascending order;
call show_stocks_high_priority
  list the ingredients that will expire today
call show_stocks_medium_priority
  list the ingredients that will expire within 3 days if there is any
call show_stocks_low_priority
  list the rest of the ingredients


I wonder:
Maybe I should keep the list of KI sorted, and sort AI.list when performing search,
both alphabetically, to avoid searching from the top of the database every time.
