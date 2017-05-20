command: "./HandleBar.widget/scripts/spaces-focused.bash"

refreshFrequency: 1000

render: (output) ->
  """
<s1 class="space id="in"></s1>
<s2 class="space id="in"></s2>
<s3 class="space id="in"></s3>
<s4 class="space id="in"></s4>
  """

update: (output, domEl) ->
     data = JSON.parse output
     space_count = data['count']
     spaces = data['spaces']
     for i in [0...space_count] by 1
          s_name = "s" + (i + 1)
          $(s_name).text(spaces[i].name)
          $(s_name).attr("class", "space")
          console.log(spaces[i].activated)
          if spaces[i].activated == "1"
               $(s_name).attr("id", "a")
          else
               $(s_name).attr("id", "in")

style: """
  background-color: yellow
  -webkit-font-smoothing: antialiased
  color: #00010
  
  top: 0px
  left: 263px
  width: 410px

  height: 18px
  padding-top: 4px
  padding-bottom: 4px
  
  font: 14px Avenir Next
  font-weight: 500
  text-align: center
  
  #a
    background-color: #0005
  #in
    background-color: #0002
  .space
    display: inline
    padding-left: 20px
    padding-right: 20px
"""
