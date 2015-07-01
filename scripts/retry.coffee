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
#Robot = require('hubot')
#
#module.exports = (robot) ->
#  robot.respond /(.+)/i, (msg) ->
#    command = msg.match[1].trim()
#    saveCommand command
#
#  robot.hear new RegExp("come on " + robot.name), (msg) ->
#    if robot.brain.data.last_command?
#      robot.receive new Robot.TextMessage(msg.message.user, robot.brain.data.last_command, msg.id)
#    else
#      msg.send "Did you mean to write 'Come On Eileen'?"
#      msg.send "https://www.youtube.com/watch?v=b8ORHVdTxbg"
#
#  robot.hear new RegExp("thanks " + robot.name), (msg) ->
#    msg.send "Don't mention it, #{msg.message.user.name}!"
#
#  saveCommand = (command) ->
#    robot.brain.data.last_command = command

# References:
# https://github.com/github/hubot-scripts/blob/master/src/scripts/bang-bang.coffee
# https://gist.github.com/lopopolo/4863319

# Description:
#   None
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot !! - Repeat the last command directed at hubot
#
# Author:
#   None

#module.exports = (robot) ->
#  robot.respond /(.+)/i, (msg) ->
#    store msg
#
#  robot.respond /!!$/i, (msg) ->
#
#    if exports.last_command?
#      msg.send exports.last_command
#      msg['message']['text'] = "#{robot.name}: #{exports.last_command}"
#      robot.receive(msg['message'])
#      msg['message']['done'] = true
#    else
#      msg.send "i don't remember hearing anything."
#
#store = (msg) ->
#  command = msg.match[1].trim()
#  exports.last_command = command unless command == '!!'

#module.exports = (robot) ->
#  robot.respond /(.+)/i, (msg) ->
#    store msg
#
##  robot.respond /!!$/i, (msg) ->
#  robot.hear new RegExp("come on " + robot.name), (msg) ->
#    if exports.last_command?
#      msg.send "Sorry, I'll try to #{exports.last_command} again..."
#      msg['message']['text'] = "#{robot.name}: #{exports.last_command}"
#      robot.receive(msg['message'])
#      msg['message']['done'] = true
#    else
#      msg.send "Did you mean to write 'Come On Eileen'?"
#      msg.send "https://www.youtube.com/watch?v=b8ORHVdTxbg"
#
#store = (msg) ->
#  command = msg.match[1].trim()
#  exports.last_command = command