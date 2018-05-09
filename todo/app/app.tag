<app>
	<h1>TODO</h1>
	<ul>
		<li if={ todos.length } each={ todo, i in todos }>
			<div class="checkbox-wrapper">
				<input type="checkbox" id="todo_item_{ i }" checked={ todo.isComplete ? 'checked' : '' } onchange={ handleToggle }>
				<label for="todo_item_{ i }"></label>
			</div>
			<p>{ todo.title }</p>
		</li>
	</ul>
	<form onsubmit={ handleSubmit }>
		<label for="input_field">Use the field below to enter TODO items.</label>
		<input id="input_field" ref="inputField" type="text" name="todo">
		<input type="submit" value="Submit TODO">
	</form>
	<script>
		this.todos = [ {
			title: 'Submit a todo!',
		} ];

		this.handleSubmit = ( e ) => {
			e.preventDefault();

			if ( this.refs.inputField.value ) {
				this.todos = [ ...this.todos, { title: this.refs.inputField.value } ];
			}

			this.refs.inputField.value = '';
		};

		this.handleToggle = ( e ) => {
			e.preventDefault();

			this.todos = this.todos.map( ( todo, i ) => {
				if ( i === e.item.i ) {
					todo.isComplete = !todo.isComplete;
				}

				return todo;
			} );

			this.update();
		};
	</script>

	<style>
		app h1 {
			font-size: 2.4rem;
			margin-bottom: 1rem;
		}

		app ul {
			background: rgba( 0, 0, 0, 0.03 );
		}

		app li {
			display: flex;
			align-items: center;
			padding: 1rem;
		}

		app li:nth-child( odd ) {
			background: rgba( 0, 0, 0, 0.03 );
		}

		app li p {
			padding-top: 0.1rem;
		}

		app .checkbox-wrapper {
			width: 2.2rem;
			height: 2.2rem;
			display: block;
			position: relative;
			flex: 0 0 auto;
			margin-right: 1.5rem;
		}

		app input[type="checkbox"],
		app input[type="checkbox"] + label {
			width: 100%;
			height: 100%;
			display: block;
		}

		app input[type="checkbox"] {
			position: absolute;
			top: 0;
			left: 0;
		}

		app input[type="checkbox"] + label {
			background: #fff;
			border: solid 0.2rem #999;
			position: relative;
			text-align: center;
		}

		app input[type="checkbox"]:hover + label,
		app input[type="checkbox"]:focus + label {
			border-color: #444;
		}

		app input[type="checkbox"]:focus + label {
			outline: 5px auto -webkit-focus-ring-color;
		}

		app input[type="checkbox"]:checked + label::after {
			content: '\2713';
		}

		app form label {
			margin-bottom: 1rem;
		}
	</style>
</app>
