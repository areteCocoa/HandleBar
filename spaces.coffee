command: "./HandleBar.widget/scripts/spaces-focused.bash"

refreshFrequency: 1000

render: (output) ->
  """<s1 class="space" id="in"></s1><s2 class="space" id="in"></s2><s3 class="space" id="in"></s3><s4 class="space" id="in"></s4>"""

afterRender: (domEl) ->
  # spaces = $(domEl).find(".space")
  # for s in spaces
  #   cmd = "kwmc space -fExperimental " + $(domEl).find(s).text()
  #   console.log(cmd)
  #   $(s).on 'click', => @run(cmd)
  $("s1").on 'click', => @run("kwmc space -fExperimental 1")
  $("s2").on 'click', => @run("kwmc space -fExperimental 2")
  $("s3").on 'click', => @run("kwmc space -fExperimental 3")
  $("s4").on 'click', => @run("kwmc space -fExperimental 4")

update: (output, domEl) ->
     data = JSON.parse output
     space_count = data['count']
     spaces = data['spaces']
     for i in [0...space_count] by 1
          s_name = "s" + (i + 1)
          $(s_name).text(spaces[i].name)
          $(s_name).attr("class", "space")
#          console.log(spaces[i].activated)
          if spaces[i].activated == "1"
               $(s_name).attr("id", "a")
          else
               $(s_name).attr("id", "in")

style: """
  -webkit-font-smoothing: antialiased
  color: #fff
  
  top: 0px
  left: 290px
  width: 400px

  height: 23px
  
  font: 14px Avenir Next
  font-weight: 500
  text-align: center

  padding: 0px
  padding-top: 3px
  margin: 0px

  #a
    background-color: #fff4
  #in
    background-color: #fff2
  .space
    padding-left: 22px
    padding-right: 23px
    padding-top: 5px
    padding-bottom: 4px
    height: 100%
"""
