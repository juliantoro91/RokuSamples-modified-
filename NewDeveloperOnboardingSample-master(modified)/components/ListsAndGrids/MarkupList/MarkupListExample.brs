' ********** Copyright 2018 Roku Corp.  All Rights Reserved. ********** 
'
' Important to note in our MarkupList example is that in our initialization
' of the MarkupListExample object, we will create a ContentReader task node
' that has the responsibility of retrieving the content to give to the
' MarkupList object to display on screen.
sub init()
    m.markupList = m.top.findNode("exampleMarkupList")

    m.markupListContentReader = createObject("roSGNode", "ContentReader")
    m.markupListContentReader.uri = "https://testappjue.web.app/media12.rss"
    m.markupListContentReader.observeField("content", "setMarkupListContent")
    m.markupListContentReader.control = "RUN"
end sub

' Once the ContentReader task sets its "content" field, this callback
' function will populate the MarkupList object with content. Since the
' ContentReader task returns a sample with two rows with the same assets,
' we will only use one of the rows to display the content.
Function setMarkupListContent()
    m.markupListContentReader.unobserveField("content")
    m.markupList.content = m.markupListContentReader.content.getChild(0)
end Function