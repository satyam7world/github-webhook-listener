module.exports = exports = (app) ->
  app.post '/', (req, res) ->
    console.log(req.body)
    # sample data https://gist.github.com/3496677
    { repository: {name, url}, after, ref } = req.body

    # Only run deploy when master branch is pushed
    if ref.match 'master'
      after = after[0...7]
      require('./deploy_queue')(name, url, after)
      res.send 'ok'
    else
      res.send 'not master'
