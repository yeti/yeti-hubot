# Commands:
#   hubot pikachu me - Get a gif of Pikachu
QS = require 'querystring'
Robot = require('hubot')

module.exports = (robot) ->
  # Ask hubot for a gif of Pikachu
  robot.respond /pikachu me/i, (res) ->
    res['message']['text'] = "#{robot.name}: animate me pikachu"
    robot.receive(res['message'])
    res['message']['done'] = true

#  robot.hear /come on/i, (res) ->    # .hear is called anytime a message's text matches.
#    reply =
#      fail: "I'm sorry."
#      success: "You're welcome."
#    res.send reply.fail
#
#  robot.hear /robots/i, (res) ->
#    console.log robot

#  robot.respond /deep/i, (msg) ->    # .respond is called for messages preceded by the robot's name
#          # Configures the url of a remote server
#          msg.http('http://andymatthews.net/code/deepthoughts/get.cfm')
#              # and makes an http get call
#              .get() (error, response, body) ->
#                  # passes back the complete response
#                  msg.send body



#  robot.respond /post (.+)/i, (res) ->
#    url = 'http://httpbin.org/post'
#    data = QS.stringify({'hubot-post': res.match[1]})
#
#    res.http(url)
#        .post(data) (err, res, body) ->
#            res.send body
#
#  robot.hear /repeat/i, (res) ->
##    console.log res
#    console.log res.match
