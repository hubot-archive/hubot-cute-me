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
    msg.http("http://api.dailycute.com.net/v1/posts/all")
      .get() (body) ->
        results = JSON.parse(body)
        msg.send (msg.random results.posts).image_src
