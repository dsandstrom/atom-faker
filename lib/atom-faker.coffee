faker = require "faker"

availableCommands =
  Name:
    firstName:"firstName"
    lastName:"lastName"
    fullName:"findName"
  Address:
    zipCode:"zipCode"
    city:"city"
    streetName:"streetName"
    streetAddress:"streetAddress"
    usState:"usState"
    latitude:"latitude"
    longitude:"longitude"
  PhoneNumber:
    phoneNumber:"phoneNumber"
  Internet:
    email:"email"
    userName:"userName"
    domainName:"domainName"
    domainWord:"domainWord"
    ip:"ip"
  Company:
    companyName:"companyName"
    companySuffix:"companySuffix"
    catchPhrase:"catchPhrase"
    bs:"bs"
  Image:
    imageUrl:"imageUrl"
  Lorem:
    sentence:"sentence"
    sentences:"sentences"
    paragraph:"paragraph"
    paragraphs:"paragraphs"


module.exports =
  activate: (state) ->
    for cls of availableCommands
      for cmd of availableCommands[cls]
        createCmd(cls, cmd)


createCmd = (cls, cmd) ->
  atom.workspaceView.command "atom-faker:(#{cls})-#{cmd}", ->
    editor = atom.workspace.getActiveEditor()
    return unless editor?
    fn = availableCommands[cls][cmd]
    editor.insertText faker[cls][fn]()
