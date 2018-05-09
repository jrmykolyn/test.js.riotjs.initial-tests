<app>
	<!--
	/// TODO:
	- Create 'search field' elem. and trailing list.
	- List elem. to be dynamically generated/populated.
	- List elems. to be focusable; navigable via keyboard.
	-->

	<div class="">
		<pre>Searched for: { searchData }</pre>
	</div>
	<form>
		<input ref="inputField" type="text" value="{ defaultSearchTerm }">
		<ul>
			<li each="{ obj in data }" tabindex="0" onkeydown={ handleKeyDown } onclick={ () => { this.doSearch( item ); } }>
				<!--
					If possible, display the `name` followed by the `category`.
					If not `category` is available, display the `name` only.
					NOTE: RiotJS doesnt' seem to like template literals. String concatenation it is!
				-->
				{ obj.category ? obj.name + ' in ' + obj.category : obj.name }
			</li>
		</ul>
	</form>

	<script>
	/// TODO:
	// - Define var. to record selected item.
	// - Define var. to record default search term.
	// - Define array of 'category strings'.
	// - Define array of 'suggested search' strings.
	// - Dynamically create array of objects based on inputs above.
	// - Array to contain:
		// - 1x 'search term' object. (ie. { name: <search-term> } )
		// - 1+ 'search term + category' objects. (ie. { name: <search-term>, category: <category> } ).
		// - 1+ 'suggested search' objects (ie. { name: <suggested-search> }).

	this.searchData;
	this.defaultSearchTerm = 'Hello, world!';
	this.categories = [ 'Foo', 'Bar', 'Baz', 'Quux' ];
	this.suggestedSearches = [
		'Goodbye cruel world!',
		'Hello my honey',
		'Goodnight moon',
	];

	this.data = [
		{ name: this.defaultSearchTerm },
		...this.categories.map( ( c ) => { return { name: this.defaultSearchTerm, category: c } } ),
		...this.suggestedSearches.map( ( s ) => { return { name: s } } ),
	];

	this.handleKeyDown = ( e ) => {
		switch ( e.code ) {
			case 'ArrowUp':
				if ( this.data.indexOf( e.item.obj ) > 0 ) {
					e.target.previousElementSibling.focus();
				} else {
					this.refs.inputField.focus();
				}
				break;
			case 'ArrowDown':
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

	<style>

	</style>
</app>
