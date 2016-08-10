# Description:
#   Handle lunch selections
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot lunch random - Ask hubot to pick a restaurant at random
#   hubot lunch options - Ask for lunch options
#   hubot lunch at <restaurant name> - Vote for a restaurant choice
#   hubot lunch order <food> - Tell hubot your order
#   hubot lunch done - Clear all orders
#   hubot beer me - Get a picture of a beer
Robot = require('hubot')

module.exports = (robot) ->
  restaurants = [
    {name: "Don Ramons", votes: 0},
    {name: "Basil Thai", votes: 0},
    {name: "Brainwash", votes: 0},
    {name: "Extreme Pizza", votes: 0},
    {name: "Citizens Band", votes: 0},
    {name: "Focaccia", votes: 0},
    {name: "Other", votes: 0} # This should always be last in the array
  ]
  defaultRestaurants = restaurants.slice(0)
  defaultRestaurants.pop()
  orders = []

  # -----------------
  # Command Functions
  # -----------------

  # Ask hubot for a random restaurant
  robot.respond /lunch random/i, (res) ->
    randomRestaurant = res.random defaultRestaurants
    res.send "Let's eat at #{randomRestaurant.name}. What would you like?"

  # Ask hubot for lunch options
  robot.respond /lunch options/i, (res) ->
    res.send "Where should we eat today? (select a number)"
    options = ""
    for option, index in restaurants
      options += "#{index}: #{option.name}\n"
    res.send options

  # Vote for a restaurant choice
  robot.respond /lunch at (.*)/i, (res) ->
    if restaurants[res.match[1]]
      restaurants[res.match[1]].votes++
      res.send "Current totals are: \n"
      results = ""
      for option, index in restaurants
        results += "#{option.name}: #{option.votes} votes\n"
      res.send results
    else
      # TODO: Match names as well as numbers
      res.send "Sorry, I didn't understand your choice. Please try again."

  # Tell hubot your lunch order
  robot.respond /lunch order (.*)/i, (res) ->
    user = {name: res.message.user.name, order: res.match[1]}
    orders.push user
    res.send "Orders are currently:"
    results = ""
    for order in orders
      results += "#{order.name}: #{order.order}\n"
    res.send results

    orderCount = {};
    orders.forEach (user) ->
      orderCount[user.order] = (orderCount[user.order] || 0)+1;
    for order, count of orderCount
      res.send "#{order}: #{count}\n"

  # Tell hubot to clear lunch data
  robot.respond /lunch done/i, (res) ->
    # Reset votes
    for option, index in restaurants
      option.votes = 0
    # Reset orders
    orders = []

    res.send "I hope you enjoyed your meal!"


  # Ask hubot for a picture of beer
  robot.respond /beer me/i, (res) ->
    res['message']['text'] = "#{robot.name}: image me beer"
    robot.receive(res['message'])
    res['message']['done'] = true


