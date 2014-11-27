# file: index.coffee

FeedParser = require 'feedparser'
request = require 'request'

req = request 'http://feeds.feedburner.com/hacker-news-feed-200?format=xml'

req
  .pipe(new FeedParser())
  .on('error', (err)->
    console.log err
  )
  .on('meta', (meta)->
    console.log '===== %s =====', meta.title
  )
  .on('readable', ->
    stream = @
    item = null
    while (item = stream.read())
      console.log('Got article: %s', item.title || item.description)
  )
