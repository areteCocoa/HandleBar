command: 'date +"%A, %B %e %Y"'

# Every 10 minutes
refreshFrequency: 600000

render: (output) ->
  "#{output}"

style: """
  -webkit-font-smoothing: antialiased
  color: #D9DBDE
  font: 14px Avenir Next
  font-weight: 500
  right: 5px
  top: 4px
"""
