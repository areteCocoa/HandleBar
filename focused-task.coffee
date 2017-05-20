command: "cat HandleBar.widget/data/task.txt"

refreshFrequency: 200

render: (output) ->
  "#{output}"

style: """
  -webkit-font-smoothing: antialiased
  color: #FFFFFF
  
  font: 14px Avenir Next
  font-weight: 600

  left: 673px
  
  height: 18px
  width: 200px
  
  padding: 4px
  padding-left: 10px
  
  overflow: hidden
  text-overflow: ellipsis
  
  background-color: #00F
"""
