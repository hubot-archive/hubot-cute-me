# Description:
#   Cute me is a way to get pictures of cute things
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot cute me - Receive a cute thing
#   unicorn chaser - Receieve a cute thing
module.exports = (robot) ->
  robot.respond /cute me/, (msg) ->
    cuteMe(msg)

  robot.hear /unicorn chaser/, (msg) ->
    cuteMe(msg)

  cuteMe = (msg) ->
    msg.http('http://www.reddit.com/r/aww/.json')
      .header('Accept', 'application/json')
      .get() (err, response, body) ->
        results = JSON.parse(body)
        msg.send (msg.random results.data.children).data.url.concat('.png')
