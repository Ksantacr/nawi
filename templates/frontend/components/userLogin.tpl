{**
 * templates/frontend/pages/userLogin.tpl
 *
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING..
 *
 * User login form.
 *
 *}
 <!-- <p>{$loginUrl}</p>
 <p>{$baseUrl}</p>
 <p>{$registerUrl}</p> -->
 
	<!--<form class="pkp_form login" id="login" method="post" action="{$loginUrl}">-->
	<form class="pkp_form login" id="login" method="post" action="{url page="login" op="signIn"}">
		{csrf}
		<input type="hidden" name="source" value="{$source|strip_unsafe_html|escape}" />

		{if $error}
			<div class="alert alert-danger" role="alert">
				{translate key=$error reason=$reason}
			</div>
		{/if}

		<div class="form-group">
			
			<input type="text" name="username" class="form-control" id="login-username" placeholder="Usuario"{**{translate key='user.username'}*} value="{$username|escape}" maxlenght="32" required>
		</div>

		<div class="form-group">
			
			<input type="password" name="password" class="form-control" id="login-password" placeholder="Contraseña"{**{translate key='user.password'}*} password="true" maxlength="32" required="$passwordRequired">
		</div>
		<div class="login">
			<button type="submit" class="btn btn-primary">
				{**{translate key="user.login"}*}Iniciar Sesión
			</button>
		</div>

		<div class="register-forget">
			{if !$disableUserReg}
				{url|assign:registerUrl page="user" op="register" source=$source}
				<a class="btn btn-default register-button" href="{$registerUrl}" role="button">
					{**{translate key="user.login.registerNewAccount"}*}Registrarse
				</a>
			{/if}

			<a href="{url page="login" op="lostPassword"}">
				{**{translate key="user.login.forgotPassword"}*}Olvidé contraseña
			</a>
		</div>
		<!-- <div class="checkbox">
			<label>
				<input type="checkbox" name="remember" id="remember" value="1" checked="$remember"> {translate key="user.login.rememberUsernameAndPassword"}
			</label>
		</div> -->
		
	</form>