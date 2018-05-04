<riot-form>
	<form class="riot-form">
		<div class="riot-form__errors">
			<a href="#firstname">Jump to `firstname`.</a>
			<a href="#lastname">Jump to `lastname`.</a>
			<a href="#score_5">Jump to `score`.</a>
		</div>
		<div class="riot-form__content">
			<ul>
				<li>
					<label for="">Firstname</label>
					<input id="firstname" type="text" name="firstname">
				</li>
				<li>
					<label for="">Lastname</label>
					<input id="lastname" type="text" name="lastname">
				</li>
				<li>
					<label for="">Score</label>
					<div class="radio-buttons-container">
						<div class="radio-button-elem { is-active: ( +activeScore >= +el.value ) }" each="{ el, i in scoreVals }">
							<input id="score_{ el.value }" type="radio" name="score" value="{ el.value }" onchange="{ updateScore }">
							<label for="score_{ el.value }">
								<span class="hide-visually">{ el.label }</span>
							</label>
						</div>
					</div>
				</li>
			</ul>
		</div>
		<div class="riot-form__footer">
			<input type="submit" value="Submit">
		</div>
	</form>

	<script>
	this.activeScore = null;
	this.scoreVals = new Array( 5 ).fill( null ).map( ( el, i ) => {
		return {
			value: i + 1,
			label: i + 1,
		};
	} );

	this.updateScore = ( e ) => {
		this.activeScore = +e.target.value;
	};
	</script>

	<style>
		.riot-form {

		}

		.riot-form label {
			display: block;
			margin-bottom: 0.5rem;
		}

		.riot-form input {
			font-size: 1.4rem;
		}

		.riot-form input[type="text"] {
			width: 100%;
			padding: 1.2rem;
		}

		.riot-form input[type="submit"] {
			width: 100%;
			min-width: 15rem;
			max-width: 25rem;
			display: block;
			color: #fff;
			background: rgb( 25, 175, 0 );
			border: none;
			border-radius: 2.2rem;
			margin: 0 auto;
			padding: 0 3rem;
			text-align: center;
			text-transform: uppercase;
			line-height: 4.4rem;
		}

		.riot-form__errors {
			border: solid 0.1rem firebrick;
			background: rgba( 255, 0, 0, 0.1 );
			padding: 2rem;
			margin-bottom: 2rem;
		}

		.riot-form__errors a {
			display: block;
			color: firebrick;
		}

		.riot-form__footer {
			padding-top: 3rem;
		}

		.radio-buttons-container {
			display: flex;
			display:
		}

		.radio-button-elem {
			position: relative;
		}

		.radio-button-elem input {
			opacity: 0;
			position: absolute;
			top: 0;
			left: 0;
			width: 100%;
			height: 100%;
		}

		.radio-button-elem label {
			width: 2.4rem;
			height: 2.4rem;
			position: relative;
		}

		.radio-button-elem label::after {
			content: '';
			position: absolute;
			top: 0;
			left: 0;
			width: 100%;
			height: 100%;
			border: solid 0.2rem #999;
			border-radius: 50%;
		}

		.radio-button-elem input:focus + label::after {
			background: #bbb;
			outline: -webkit-focus-ring-color auto 5px;
		}

		.radio-button-elem input:checked + label::after,
		.radio-button-elem.is-active label::after {
			background: #999;
		}

		.radio-button-elem:not( :last-child ) {
			margin-right: 2rem;
		}

		.hide-visually {
			position: fixed;
			top: 0;
			left: 0;
			transform: translate( -200%, -200% );
		}
	</style>
</riot-form>
