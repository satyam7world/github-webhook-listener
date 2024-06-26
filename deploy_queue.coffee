spawn = require('child_process').spawn
path = require('path')

module.exports = exports = (name, url, after) ->

  # looks like env variables are being set
  process.env.DEPLOY_SCRIPT = 'bin/deploy.sh'
  process.env.REPO_COMMIT = after

  deployScriptPath = path.join(__dirname, 'bin/deploy.sh')

  # deploy = spawn('ls', ['-lh', '/usr'])
  deploy = spawn 'bash', [deployScriptPath]

  deploy.stdout.on 'data', (data) ->
    console.log "running #{data}"

  deploy.stderr.on 'data', (data) ->
    console.log "Deploy error: #{data}"

  deploy.on 'exit', (code) ->
    unless code is 0
      console.log "Deploy failed with code #{code}."
    else
      console.log "Deploy successful."
