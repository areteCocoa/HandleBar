command: "./HandleBar.widget/scripts/spaces-focused.bash"

refreshFrequency: 1000

render: (output) ->
  """
<p class="space" id="in">test1</p>
<p class="space" id="in">test2</p>
<p class="space" id="in">test3</p>
<p class="space" id="a">test4</p>
  """

afterRender: (domEl) ->
   k = 10

update: (output, domEl) ->
     data = JSON.parse output
     space_count = data['count'].length
     spaces = data['spaces']
     space_p_tags = $(domEl).find('.space').length
     if space_count != space_p_tags
          random_filler = 10
     # TODO: Add more spaces if more are required
     
     $(domEl).find('.space').text()

style: """
  margin-left: 10px
  margin-right: 10px

  background-color: yellow
  -webkit-font-smoothing: antialiased
  color: green
  
  top: 0px
  left: 514px

  height: 18px
  padding-top: 4px
  padding-bottom: 4px
  
  font: 14px Avenir Next
  font-weight: 500
  text-align: center
  
  #a
    color: blue
    font-weight: 500
    background-color: green

    padding-top: 4px
    padding-bottom: 3px
  #in
    background-color: #00000000
  p
    display: inline
    padding-left: 20px
    padding-right: 20px
"""
