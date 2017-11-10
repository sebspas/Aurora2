<div class="loginbox col-md-3">
    <div class="panel panel-default t-black">
        <div class="panel-heading" >
            <h3 class="c-white title1">Connexion</h3>
        </div>
        <div class="panel-body">
            <form class="form form-horizontal col-md-12 c-white" method="GET" action="<?= Config::$path['model'] ?>login.php" class="center">
                <div class="form-group">
                    <label  for="pseudo">Login</label>
                    <input type="text" name="pseudo" id="pseudo" class="form-control" autofocus />
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" name="password" id="password" class="form-control" >
                </div>
                <div class="line3">
                    <a  class="txt-dec-none c-white" href="index.php?page=inscription">Sign Up</a>
                    <a  class="txt-dec-none c-white js-to-forgot">Forgot password ?</a>
                    <input class="btn blue3 right" type="submit" value="Play" name="login" id="send2" />
                </div>
            </form>
            <!-- .login-form -->
            <form class="forgot-form" method="GET" action="<?= Config::$path['model'] ?>forgot-pass.php" class="center">
                <div class="field">
                    <label for="email" class="field-label">Email</label>
                    <input type="email" name="email" id="email3" class="field-input" autofocus />
                </div>
                <div class="line3">
                    <a  class="txt-dec-none c-white js-to-login">Login</a>
                    <a  class="txt-dec-none c-white" href="index.php?page=inscription">Sign Up</a>
                    <input class="btn blue3 right" type="submit" value="forgot" name="forgot" id="send3" />
                </div>
            </form><!-- .forgot-form -->
        </div><!-- .frame-content -->
    </div>
</div>