class @.FormCompleter
  constructor: (selector) ->
    @$formCompleter = selector
    @$formCompleterClear = @$formCompleter.find("#formCompleterClear")
    @$formCompleterForm = @$formCompleter.find(".completer-form")
    @$formCompleterListSet = @$formCompleter.find("#venueSet")
    @$formCompleterListItem = @$formCompleter.find("[data-js='venueName']")
    @$formCompleterAddNew = @$formCompleter.find(".field-group__add-new")
    @$formCompleterVenueNewAddress = @$formCompleter.find("#newVenueAddress")
    @$formCompleterVenueNewCancel = @$formCompleter.find("#newVenueCancel")

    @_bindEvents()

  _toggleNavigation: ->
    @$formCompleterForm.on "focus", (event) ->
      console.log("Form focused")

    @$formCompleterForm.on "blur", (event) ->
      console.log("Form not focused")

  _filterList: ->
    @$formCompleterForm.on "keyup", (event) =>
      $(@$formCompleterListItem).each ->
        if $(this).hasClass("field-group__list-item--visible")
          $(this).removeClass("field-group__list-item--visible")
      @_updateDomContent(event, @$formCompleterListItem, @$formCompleterAddNew)

  _updateDomContent:(event, domElement, addNew) ->
    if @$formCompleterForm[0].value.length > 1
      queryString = "li:contains('" + event.target.value + "')"
      if $(queryString).length > 0
        $(queryString).addClass("field-group__list-item--visible")
        $(addNew).removeClass("field-group__add-new--visible");
      else
        $(addNew).addClass("field-group__add-new--visible");

  _updateField: ->
    @$formCompleterListItem.on "click", (event) =>
      @$formCompleterForm.val($(event.target).data("name"))
      $(@$formCompleterListItem).each ->
        if $(this).hasClass("field-group__list-item--visible")
          $(this).removeClass("field-group__list-item--visible")

  _addNewVenue: ->
    @$formCompleterAddNew.on "click", (event) =>
      @$formCompleterVenueNewAddress.addClass("field-group__new-venue--visible")

  _cancelNewVenue: ->
    @$formCompleterVenueNewCancel.on "click", (event) =>
      event.preventDefault()
      @$formCompleterVenueNewAddress.removeClass("field-group__new-venue--visible")

  _clearField: ->
    @$formCompleterClear.on "click", (event) =>
      @$formCompleterForm[0].value = ""
      if $(this).hasClass("field-group__list-item--visible")
        $(this).removeClass("field-group__list-item--visible")
      @$formCompleterVenueNewAddress.removeClass("field-group__new-venue--visible")
      @$formCompleterAddNew.removeClass("field-group__add-new--visible")

  _bindEvents: =>
    @_addNewVenue()
    @_cancelNewVenue()
    @_toggleNavigation()
    @_filterList()
    @_updateField()
    @_clearField()

$ ->
  $("#formCompleter").each ->
    new FormCompleter($(this))
