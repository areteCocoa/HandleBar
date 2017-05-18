# Attributions:
# The svg path for the bolt icon provided by Open Iconic
# The source code is available at https://github.com/iconic/open-iconic

command: "pmset -g batt | grep \"%\" | awk 'BEGINN { FS = \";\" };{ print $2,$3,$4 }' | sed -e 's/-I/I/' -e 's/-0//' -e 's/;//' -e 's/;//'"

refreshFrequency: 10000

render: -> """
  <svg version="3.1" id="battery"
    xmlns="http://www.w3.org/2000/svg"
    xmlns:xlink="http://www.w3.org/1999/xlink"
    viewBox="0 0 100 25" >
    <rect id="charge" x="0" y="0" height="25" style="stroke-width:0;stroke:rgb(0,0,0)"/>
    <text id="text" x="8" y="17" style="font-size:12">##%</text>
  </svg>
"""

update: (output, domEl) ->
  values = output.split(' ')
  text = $('#text')
  charge = values.filter((v) ->
    return v.indexOf('%') == v.length - 1)
    .map(parseInt)[0]
  charge_width = charge

  if charge
    text.text(charge + '%')
  else
    text.text('error')
    
  charging = values.filter((v) ->
    return v.indexOf('charg') == 0).length

  fill = '#46586C'

  if charging
    fill = '#939CA6'

  $('#charge').attr('width', charge_width)
  $('#charge').css('fill',fill)
  
  text.text('Battery: ' + charge + '%')



style: """
    main = rgba(#fff,1)
    color: main
    opacity = .9
    background: #273A50
    height: 25px
    right: 225px
    font-family: Avenir Next

    border
      color: red
      border: 3px solid red

    svg
      width: 100px
      height: auto
      margin: 0
      opacity: opacity

    #hull
      fill: none
      stroke: main
      stroke-width: 1

    #charge
      stroke-width: 10
      stroke: rgb(#fff)

    #text
      font-weight: 500
      fill: main
      white-space: nowrap
      margin: auto
"""
