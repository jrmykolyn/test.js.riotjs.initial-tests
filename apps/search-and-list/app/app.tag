<app>
	<!--
	NOTE: Structure and functionality of app is based on existing CVS components.
	-->
	<div>
		<pre>Searched for: { searchData }</pre>
	</div>
	<form>
		<input ref="inputField" type="text" value="{ defaultSearchTerm }">
		<ul>
			<li each="{ obj in data }" tabindex="0" onkeydown={ handleKeyDown } onclick={ () => { this.doSearch( item ); } }>
				<!--
					If possible, display the `name` followed by the `category`.
					If no `category` is available, display the `name` only.
					NOTE: RiotJS doesnt' seem to like template literals. String concatenation it is!
				-->
				{ obj.category ? obj.name + ' in ' + obj.category : obj.name }
			</li>
		</ul>
	</form>

	<script>
	// --------------------------------------------------
	// DECLARE VARS.
	// --------------------------------------------------
	// Define var. to record selected item.
	this.searchData;

	// Define var. to record default search term.
	this.defaultSearchTerm = 'Hello, world!';

	// Define array of 'category strings'.
	// NOTE: This replicates the array of strings that we receive extract from the query.
	this.categories = [ 'Foo', 'Bar', 'Baz', 'Quux' ];

	// Define array of 'suggested search' strings.
	// NOTE: This replicates the array of strings that we receive extract from the query.
	this.suggestedSearches = [
		'Goodbye cruel world!',
		'Hello my honey',
		'Goodnight moon',
	];

	// Dynamically create array of objects based on variables defined above.
	// - Array to contain:
		// - 1x 'search term' object. (ie. { name: <search-term> } )
		// - 1+ 'search term + category' objects. (ie. { name: <search-term>, category: <category> } ).
		// - 1+ 'suggested search' objects (ie. { name: <suggested-search> }).
	this.data = [
		{ name: this.defaultSearchTerm },
		...this.categories.map( ( c ) => { return { name: this.defaultSearchTerm, category: c } } ),
		...this.suggestedSearches.map( ( s ) => { return { name: s } } ),
	];

	// --------------------------------------------------
	// DEFINE FUNCTIONS
	// --------------------------------------------------
	this.handleKeyDown = ( e ) => {
		switch ( e.code ) {
			case 'ArrowUp':
				// If we're on the first item, focus the input field.
				if ( this.data.indexOf( e.item.obj ) === 0 ) {
					this.refs.inputField.focus();
				// Otherwise, focus the preceding list item.
				} else {
					e.target.previousElementSibling.focus();
				}
				break;
			case 'ArrowDown':
				// As long as we're not on the last item, shift focus to the next one.
				if ( this.data.indexOf( e.item.obj ) !== ( this.data.length - 1 ) ) {
					e.target.nextElementSibling.focus();
				}
				break;
			case 'Space':
			case 'Enter':
				this.doSearch( e.item.obj );
				break;
			default:
				// DO NO THINGS
		}
	};

	this.doSearch = ( data ) => {
		console.log( 'PERFORMING SEARCH' );
		console.log( data );
		this.searchData = JSON.stringify( data );
	};
 	</script>
</app>
