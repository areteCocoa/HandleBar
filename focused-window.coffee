#command: 'R="/usr/local/bin/kwmc query window focused float"; echo "<$(R)>$(/usr/local/bin/kwmc query window focused name)</$(R)>"'
command: "echo $(/usr/local/bin/kwmc query window focused name)"

refreshFrequency: 200

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
  width: 250px
  background-color: #FF0000
"""
