module.exports = (robot) ->
  robot.respond /hello/, (msg) ->
    msg.reply "hello!"

  robot.hear /orly/, ->
    msg.send "yarly"

  cuteMe = (msg) ->
    msg.http("http://api.dailycute.com.net/v1/posts/all")
      .get() (body) ->
        results = JSON.parse(body)
        msg.send (msg.random results.posts).image_src
