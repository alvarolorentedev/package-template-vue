fs = require 'fs'
path = require 'path'

module.exports =
class PackageTemplateVueView
  constructor: ->
    @element = document.createElement('div')
    @element.classList.add('package-template-vue-view')
    @element.innerHTML = fs.readFileSync(path.join(__dirname, 'package-template-vue-view.html'))

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @element.remove()

  getElement: ->
    @element
