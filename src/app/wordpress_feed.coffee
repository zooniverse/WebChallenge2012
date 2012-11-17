google.load('feeds', 1)

class WordpressFeed extends window.App.Events
  @base_url: "https://pangeaeducation.wordpress.com/category/"
  @feeds: {}

  @fetch: (number=10, feed="blog") =>
    @feeds[feed] = new google.feeds.Feed "#{@base_url}#{feed}/feed/"
    @feeds[feed].setNumEntries number
    @feeds[feed].load (results) =>
      if not results.error 
        feedEntries = new Array
        feedEntries.push new @(entry) for entry in results.feed.entries
        @trigger 'feed-loaded', feedEntries

  constructor: (entry) ->
    @title = entry.title
    @url = entry.link
    @description = entry.contentSnippet
    @content = entry.content
    @date = new Date entry.publishedDate
    @linkText = "PLACEHOLDER"
    @image = "http://placehold.it/1040x400"

window.App.WordpressFeed = WordpressFeed