#command: 'R="/usr/local/bin/kwmc query window focused float"; echo "<$(R)>$(/usr/local/bin/kwmc query window focused name)</$(R)>"'
command: "echo $(/usr/local/bin/kwmc query window focused name)"

refreshFrequency: 1000 # ms

render: (output) ->
  "#{output}"

style: """
  -webkit-font-smoothing: antialiased
  color: #FFFFFF
  font: 14px Avenir Next
  font-weight: 500
  height: 18px
  padding: 4px
  padding-left: 10px
  overflow: hidden
  text-overflow: ellipsis
  width: 500px
  background-color: #FF0000
"""
