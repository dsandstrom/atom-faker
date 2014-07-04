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
    color:"color"
  Company:
    suffixes:"suffixes"
    companyName:"companyName"
    companySuffix:"companySuffix"
    catchPhrase:"catchPhrase"
    bs:"bs"
  Image:
    avatar:"avatar"
    imageUrl:"imageUrl"
    abstractImage:"abstractImage"
    animals:"animals"
    business:"business"
    cats:"cats"
    city:"city"
    food:"food"
    nightlife:"nightlife"
    fashion:"fashion"
    people:"people"
    nature:"nature"
    sports:"sports"
    technics:"technics"
    transport:"transport"
  Lorem:
    words:"words"
    sentence:"sentence"
    sentences:"sentences"
    paragraph:"paragraph"
    paragraphs:"paragraphs"

module.exports =
  activate: (state) ->
    for cls of availableCommands
      for cmd of availableCommands[cls]
        console.log(cmd)
        console.log(cls)
        createCmd(cls, cmd)


createCmd = (cls, cmd) ->
  atom.workspaceView.command "atom-faker:(#{cls})-#{cmd}", ->
    editor = atom.workspace.getActiveEditor()
    return unless editor?
    fn = availableCommands[cls][cmd]
    editor.insertText faker[cls][fn]()
