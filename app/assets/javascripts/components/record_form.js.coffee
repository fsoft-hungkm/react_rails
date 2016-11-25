@RecordForm = React.createClass
	getInitialState: ->
		title: ''
		amount: ''
		date: ''
	hanleChange: (e) ->
		name = e.target.name
		@setState "#{name}": e.target.value
	valid: ->
		@state.title && @state.amount && @state.date
	handleSubmit: (e) ->
		e.preventDefault()
		$.post '', { record: @state }, (data) =>
        @props.handleNewRecord data
        @setState @getInitialState()
      , 'JSON'
	render: ->
		React.DOM.form
			className: 'form-inline'
			onSubmit: @handleSubmit
			React.DOM.div
				className: 'form-group'
				React.DOM.input
					type: 'text'
					className: 'form-control'
					placeholder: 'Title'
					name: 'title'
					value: @state.title
					onChange: @hanleChange
			React.DOM.div
				className: 'form-group'
				React.DOM.input
					type: 'number'
					className: 'form-control'
					placeholder: 'amount'
					name: 'amount'
					value: @state.amount
					onChange: @hanleChange
			React.DOM.div
				className: 'form-group'
				React.DOM.input
					type: 'text'
					className: 'form-control'
					placeholder: 'Date'
					name: 'date'
					value: @state.date
					onChange: @hanleChange
			React.DOM.button
				type: 'submit'
				className: 'btn btn-primary'
				disabled: !@valid()
				'Create Record'