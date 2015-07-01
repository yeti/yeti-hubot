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
#   snowbot lunchchoices - Ask for lunch choices
#   snowbot lunchwhere - Ask snowbot where to eat
#   snowbot lunchat <restaurant name> - Vote for a restaurant
#   snowbot lunchme <food> - Tell snowbot your order

Robot = require('hubot')
restaurants = ["Don Ramons", "Basil Thai", "Brainwash", "Extreme Pizza",
                "AK Subs", "1058 Hoagies", "Other"]

module.exports = (robot) ->

  robot.respond /lunchchoices/i, (msg) ->
    msg.send "Where should we eat today?"
#    options = restaurants.join("\n")
#    msg.send options
    options = ""
    for option, index in restaurants
      options += "#{index}: #{option}\n"
    msg.send options

  robot.respond /lunchat (.*)/i, (msg) ->
    msg.send "OK, we'll have lunch at #{msg.match[1]}"

  robot.respond /beer me/i, (msg) ->
    msg['message']['text'] = "#{robot.name}: image me beer"
    robot.receive(msg['message'])
    msg['message']['done'] = true