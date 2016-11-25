@Records = React.createClass
	getInitialState: ->
		records: @props.data
	getDefaultProps: ->
		records: []
	addRecord: (record) ->
		records = @state.records.slice()
		records.push record
		@setState records: records
	credits: ->
		credits = @state.records.filter (val) -> val.amount >= 0
		credits.reduce ((prev, curr) ->
			prev + parseFloat(curr.amount)
		), 0
	debits: ->
		debits = @state.records.filter (val) -> val.amount < 0
		debits.reduce ((prev, curr) ->
			prev + parseFloat(curr.amount)
		), 0
	balance: ->
		@credits(	) + @debits()
	render: ->
		React.DOM.div
			className: 'records'
			React.DOM.h2
				className: 'title'
				'Records'
			React.createElement AmountBox, amount: @credits(), text: 'Credit', type: 'success'
			React.createElement AmountBox, amount: @debits(), text: 'Debit', type: 'danger'
			React.createElement AmountBox, amount: @balance(), text: 'Balance', type: 'info'
			React.createElement RecordForm, handleNewRecord: @addRecord
			React.DOM.hr null
			React.DOM.table
				className: 'table table-bordered'
				React.DOM.thead null,
					React.DOM.tr null,
						React.DOM.th null, 'Title'
						React.DOM.th null, 'Amount'
						React.DOM.th null, 'Date'
				React.DOM.tbody null,
					for record in @state.records
						React.createElement Record, key: record.id, record: record