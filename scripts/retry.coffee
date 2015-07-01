# Description:
#   Repeat the last action
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   come on hubot - Repeat the previous action
# References:
#   https://github.com/github/hubot-scripts/blob/master/src/scripts/bang-bang.coffee
#   https://gist.github.com/lopopolo/4863319

Robot = require('hubot')

module.exports = (robot) ->

  robot.hear new RegExp("come on " + robot.name, "i"), (msg) ->
    if robot.brain.data.last_command?
      msg.send "Sorry, I'll try to #{robot.brain.data.last_command} again."
      robot.receive new Robot.TextMessage(msg.message.user, robot.brain.data.last_command, msg.id)
    else
      msg.send "Did you mean to write 'Come On Eileen'?"
      msg.send "https://www.youtube.com/watch?v=b8ORHVdTxbg"

  robot.respond new RegExp("(?!.*(!!|last|repeat|come on " + robot.name + "))(.*)", "i"), (msg) ->
    robot.brain.data.last_command = msg.match[0]

  robot.hear new RegExp("thanks " + robot.name), (msg) ->
    msg.send "Don't mention it, #{msg.message.user.name}!"