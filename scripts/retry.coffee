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

module.exports = (robot) ->
  robot.respond /(.+)/i, (msg) ->
    command = msg.match[1].trim()
    saveCommand command

  robot.hear new RegExp("come on " + robot.name), (msg) ->
    if robot.brain.data.last_command?
      robot.receive new Robot.TextMessage(msg.message.user, robot.brain.data.last_command, msg.id)
    else
      msg.send "Did you mean to write 'Come On Eileen'?"
      msg.send "https://www.youtube.com/watch?v=b8ORHVdTxbg"

  robot.hear new RegExp("thanks " + robot.name), (msg) ->
    msg.send "Don't mention it, #{msg.message.user.name}!"

  saveCommand = (command) ->
    robot.brain.data.last_command = command

# References:
# https://github.com/github/hubot-scripts/blob/master/src/scripts/bang-bang.coffee
# https://gist.github.com/lopopolo/4863319
