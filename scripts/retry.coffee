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

Robot = require('hubot')

module.exports = (robot) ->
  robot.hear new RegExp("come on " + robot.name, "i"), (res) ->
    if robot.brain.data.last_command?
      res.send "Sorry, I'll try '#{robot.brain.data.last_command}' again."
      robot.receive new Robot.TextMessage(res.message.user, robot.brain.data.last_command, res.id)
    else
      res.send "Did you mean to write 'Come On Eileen'?"
      res.send "https://www.youtube.com/watch?v=b8ORHVdTxbg"

  robot.respond new RegExp("(?!.*(!!|last|repeat|come on " + robot.name + "|thanks " + robot.name + "))(.*)", "i"), (res) ->
    robot.brain.data.last_command = res.match[0]

  robot.hear new RegExp("thanks " + robot.name), (res) ->
    res.send "Don't mention it, #{res.message.user.name}!"

# References:
#   https://github.com/github/hubot-scripts/blob/master/src/scripts/bang-bang.coffee
#   https://gist.github.com/lopopolo/4863319