# Description:
#   Last asks Hubot to repeat the last command he received
#
# Commands:
#   hubot !! - execute the last received command
#   hubot last - execute the last received command
#   hubot repeat - execute the last received command

#Robot = require('hubot')
#
#module.exports = (robot) ->
#
#  robot.hear new RegExp("come on " + robot.name, "i"), (msg) ->
#    if robot.brain.data.last_command?
#      msg.send robot.brain.data.last_command
#      robot.receive new Robot.TextMessage(msg.message.user, robot.brain.data.last_command, msg.id)
#    else
#      msg.send "Did you mean to write 'Come On Eileen'?"
#      msg.send "https://www.youtube.com/watch?v=b8ORHVdTxbg"
#
#  robot.respond new RegExp("(?!.*(!!|last|repeat|come on " + robot.name + "))(.*)", "i"), (msg) ->
#    robot.brain.data.last_command = msg.match[0]