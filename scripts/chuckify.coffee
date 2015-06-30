# Description:
#   Tell a Chuck Norris joke about someone
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot chuckify <name>

module.exports = (robot) ->
  robot.respond /chuckify (.*)/i, (res) ->
    res.http('http://api.icndb.com/jokes/random').get() (error, response, body) ->
      # Get name and capitalize it
      name = res.match[1].charAt(0).toUpperCase() + res.match[1].slice(1);
      # Parse json response for the joke
      joke = JSON.parse(body).value.joke
      # Replace all instances of "Chuck" or "Chuck Norris" with the name
      newjoke = joke.replace /Chuck Norris|Chuck/g, name
      # Replace &quot; with quotation marks
      newjoke = newjoke.replace /&quot;/g,'"'
      # Check the gender of the name and correct if necessary
      if name == "Baylee" | "Winnie"
        newjoke = newjoke.replace /\bhe\b/g, "she"
        newjoke = newjoke.replace /\bHe\b/g, "She"
        newjoke = newjoke.replace /\bhis\b/g, "her"
        newjoke = newjoke.replace /\bHis\b/g, "Her"
        newjoke = newjoke.replace /\bhim\b/g, "her"

      # Send the joke
      res.send newjoke