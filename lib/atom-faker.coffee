faker = require "faker"
{CompositeDisposable} = require 'atom'

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
  subscriptions: null

  activate: (state) ->
    @subscriptions = new CompositeDisposable

    for cls of availableCommands
      for cmd of availableCommands[cls]
        @subscriptions.add(createCmd(cls, cmd))

  deactivate: ->
    @subscriptions.dispose()

createCmd = (cls, cmd) ->
  atom.commands.add "atom-workspace", "atom-faker:(#{cls})-#{cmd}", ->
    editor = atom.workspace.getActiveTextEditor()
    return unless editor?
    fn = availableCommands[cls][cmd]
    editor.insertText faker[cls][fn]()
