PackageTemplateVueView = require './__package-name__-view'
{CompositeDisposable} = require 'atom'

Model =require './__package-name__-model'
View = require './__package-name__-view'
ViewModel = require './__package-name__-view-model'

module.exports = PackageTemplateVue =
  packageTemplateVueView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    model = new Model
    view = new View
    viewModel = new ViewModel(view.getElement(), model)
    @modalPanel = atom.workspace.addModalPanel(item:viewModel.view, visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', '__package-name__:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @packageTemplateVueView.destroy()

  serialize: ->
    packageTemplateVueViewState: @packageTemplateVueView.serialize()

  toggle: ->
    console.log 'PackageTemplateVue was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
