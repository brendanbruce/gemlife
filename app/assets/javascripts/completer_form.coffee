class @.FormCompleter
  constructor: (selector) ->
    @$formCompleter = selector
    @$formCompleterForm = @$formCompleter.find(".completer-form")
    @$formCompleterList = @$formCompleter.find("[data-js='venueName']")
    @$formCompleterAddNew = @$formCompleter.find(".field-group__add-new")

    @_bindEvents()

  _toggleNavigation: ->
    @$formCompleterForm.on "focus", (event) ->
      console.log("sqad")

    @$formCompleterForm.on "blur", (event) ->
      console.log("sqad")

  _filterList: ->
    @$formCompleterForm.on "keyup", (event) =>
      $(@$formCompleterList).each ->
        if $(this).hasClass("field-group__list-item--visible")
          $(this).removeClass("field-group__list-item--visible")
      @_updateDomContent(event, @$formCompleterList, @$formCompleterAddNew)

  _updateDomContent:(event, domElement, addNew) ->
    queryString = "li:contains('" + event.target.value + "')"
    if $(queryString).length > 0
      $(queryString).addClass("field-group__list-item--visible")
      $(addNew).removeClass("field-group__add-new--visible");
    else
      $(addNew).addClass("field-group__add-new--visible");

  _updateField: ->
    @$formCompleterList.on "click", (event) =>
      @$formCompleterForm.val($(event.target).data("name"))
      $(@$formCompleterList).each ->
        if $(this).hasClass("field-group__list-item--visible")
          $(this).removeClass("field-group__list-item--visible")

  _addNewVenue: ->
    @$formCompleterAddNew.on "click", (event) =>
      console.log("adding new field")

  _bindEvents: =>
    @_addNewVenue()
    @_toggleNavigation()
    @_filterList()
    @_updateField()

$ ->
  $("#formCompleter").each ->
    new FormCompleter($(this))
