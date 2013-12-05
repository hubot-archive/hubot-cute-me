module.exports = (robot) ->
  robot.respond /cute me/, (msg) ->
    cuteMe(msg)

  cuteMe = (msg) ->
    msg.http("http://api.dailycute.com.net/v1/posts/all")
      .get() (body) ->
        results = JSON.parse(body)
        msg.send (msg.random results.posts).image_src
