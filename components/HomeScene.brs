sub init()
    print "HomeScreen " ; "init()"
    m.keyboard = m.top.findNode("keyboard")
    m.label = m.top.findNode("label")
    m.button = m.top.findNode("button")
    m.layoutTop = m.top.findNode("layoutTop")
    
    m.keyboard.setFocus(true)
    m.keyboard.textEditBox.width = 20
    
    m.keyboard.textEditBox.observeField("text","onTextChange")
    m.button.observeField("buttonSelected","onButtonSelected")
end sub

function onKeyEvent(key as String, press as Boolean) as Boolean
  handled = false
  if press 
    if (key = "down") 
        m.button.setFocus(true)
    else if (key = "up")
        m.keyboard.setFocus(true)
    end if
  end if
  return handled
end function

sub onTextChange()
    print "HomeScreen " ; "onTextChange() " ; m.keyboard.textEditBox.text
'   track user keyboard input
    if Len(m.keyboard.textEditBox.text) > 0
        m.label.text = m.keyboard.textEditBox.text
    else
        m.label.text = "Please enter some text"
    end if
end sub

sub onButtonSelected()
    print "HomeScreen " ; "onButtonSelected()" ; m.button.buttonSelected
    if m.layoutTop.visible
        m.layoutTop.visible = false
        m.button.text = "Show Overhang"
        m.button.focusedIconUri = "pkg:/images/button-img-show-black.png" 
        
    else
        m.layoutTop.visible = true
        m.button.text = "Hide Overhang"
        m.button.focusedIconUri = "pkg:/images/button-img-hide-black.png"
    end if
end sub