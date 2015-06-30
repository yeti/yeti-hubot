module.exports = (robot) ->
#  robot.hear /come on/i, (res) ->
#    reply =
#      fail: "I'm sorry."
#      success: "You're welcome."
#    res.send reply.fail
#
#  robot.hear /robots/i, (res) ->
#    console.log robot

#  robot.respond /deep/i, (msg) ->
#          # Configures the url of a remote server
#          msg.http('http://andymatthews.net/code/deepthoughts/get.cfm')
#              # and makes an http get call
#              .get() (error, response, body) ->
#                  # passes back the complete response
#                  msg.send body
  robot.respond /norris/i, (msg) ->
    msg.http('http://api.icndb.com/jokes/random').get() (error, response, body) ->
#      console.log error
#      console.log response
      console.log body
      msg.send body
