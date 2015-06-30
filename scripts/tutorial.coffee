QS = require 'querystring'

module.exports = (robot) ->
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
  robot.respond /norris/i, (msg) ->
    msg.http('http://api.icndb.com/jokes/random').get() (error, response, body) ->
      json = JSON.parse(body)
      msg.send "#{json.value.joke}"


  robot.respond /post (.+)/i, (msg) ->
    url = 'http://httpbin.org/post'
    data = QS.stringify({'hubot-post': msg.match[1]})

    msg.http(url)
        .post(data) (err, res, body) ->
            msg.send body

  robot.hear /repeat/i, (res) ->
    console.log res
    console.log res.match


  robot.respond /announce/i, (msg) ->
    robot.messageRoom 'random', 'Hello there Randoms.'