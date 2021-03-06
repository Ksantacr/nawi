{**
 * templates/frontend/components/registrationForm.tpl
 *
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the basic registration form fields
 *
 * @uses $locale string Locale key to use in the affiliate field
 * @uses $firstName string First name input entry if available
 * @uses $middleName string Middle name input entry if available
 * @uses $lastName string Last name input entry if available
 * @uses $countries array List of country options
 * @uses $country string The selected country if available
 * @uses $email string Email input entry if available
 * @uses $username string Username input entry if available
 *}
<fieldset class="identity">
	<legend>
		{translate key="user.profile"}
	</legend>
	<div class="fields">
		<div class="form-group first_name">
			<label>
				{translate key="user.firstName"}
				<input class="form-control" type="text" name="firstName" id="firstName" value="{$firstName|escape}" maxlength="40" required>
			</label>
		</div>
		<div class="form-group middle_name">
			<label>
				{translate key="user.middleName"}
				<input class="form-control" type="text" name="middleName" value="{$middleName|escape}" maxlength="40">
			</label>
		</div>
		<div class="form-group last_name">
			<label>
				{translate key="user.lastName"}
				<input class="form-control" type="text" name="lastName" id="lastName" value="{$lastName|escape}" maxlength="40" required>
			</label>
		</div>
		<div class="form-group affiliation">
			<label>
				{translate key="user.affiliation"}
				<input class="form-control" type="text" name="affiliation[{$primaryLocale|escape}]" id="affiliation" value="{$affiliation.$primaryLocale|escape}" required>
			</label>
		</div>
		<div class="form-group country">
			<label>
				{translate key="common.country"}
				<select class="form-control" name="country" id="country" required>
					<option></option>
					{html_options options=$countries selected=$country}
				</select>
			</label>
		</div>
	</div>
</fieldset>

<fieldset class="login">
	<legend>
		{translate key="user.login"}
	</legend>
	<div class="fields">
		<div class="form-group email">
			<label>
				{translate key="user.email"}
				<input class="form-control" type="text" name="email" id="email" value="{$email|escape}" maxlength="90" required>
			</label>
		</div>
		<div class="form-group username">
			<label>
				{translate key="user.username"}
				<input class="form-control" type="text" name="username" id="username" value="{$username|escape}" maxlength="32" required>
			</label>
		</div>
		<div class="form-group password">
			<label>
				{translate key="user.password"}
				<input class="form-control" type="password" name="password" id="password" password="true" maxlength="32" required>
			</label>
		</div>
		<div class="form-group password">
			<label>
				{translate key="user.repeatPassword"}
				<input class="form-control" type="password" name="password2" id="password2" password="true" maxlength="32" required>
			</label>
		</div>
	</div>
</fieldset>
