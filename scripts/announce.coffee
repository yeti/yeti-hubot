# Description:
#   Send announcement to specified room
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot announce <room> <message>
#   hubot tell <user> <message>

module.exports = (robot) ->
  robot.respond /announce (.*?) (.*)/i, (res) ->
    room = res.match[1]
    announcement = res.match[2]

    robot.messageRoom "#{room}", "Hello #{room}! I thought you'd like to know that #{announcement}"

#  robot.respond /tell (.*)/i (res) ->
#    user = res.match[1]
#    robot.send {room: user}, "Hello"
  robot.respond /tell (.*?) (.*)/i, (res) ->
    user = res.match[1]
    message = res.match[2]

    robot.send {room: user}, "#{message}"