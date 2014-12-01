# file: index.coffee

pull = require 'pull-stream'
request = require 'request'
toPull = require 'stream-to-pull-stream'
FeedParser = require 'feedparser'

module.exports = (url)->
  return pull(
    toPull.source request(url).pipe(new FeedParser())
  )
