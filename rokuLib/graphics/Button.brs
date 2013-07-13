'Button represents a selectable button with text
'@param text the text to be displayed on the button
'@param action a {@link String} representing the Button's action
'@return a Button object
'@see TextBox
Function Button(text as String, action as String, defaultBitmap as Object, focusedBitmap as Object, x as Float, y as Float) as Object
    this = {
        type: "Button"
        text: text
        action: action
        x: x
        y: y
        defaultImage: Image(defaultBitmap, x, y)
        focusedImage: Image(focusedBitmap, x, y)
        
        focused: false
        
        Draw: Button_Draw
        SetFocused: Button_SetFocused
    }

    return this
End Function

'Draws this Button to the specified screen
'@param screen an roScreen object
'@return true if successful {@link TextBox}
Function Button_Draw(screen as Object) as Boolean
    if m.focused
        m.image = m.focusedImage
    else
        m.image = m.defaultImage
    end if
    
    toDraw = [m.image, m.text]
    
    for i = 0 to toDraw.Count() - 1
        item = toDraw[i]
        if not item.Draw(screen) then return false
    end for
    
    return true
End Function