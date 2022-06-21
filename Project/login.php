<?php
include 'include/head.php';
include 'function/loginHandler.php';
if(isset($_POST['create'])) {
    validateNewUser($_POST, $new_user);
 } else if (isset($_POST['login'])) {
    validateLogin($_POST, $login_user);
 }
?>

<br>
<div class="container py-5">
        <?php
        // to set use the setMsg() fn
          if(!empty($message)) {
            echo "<div class='alert alert-{$message['class']}'>
              {$message['msg']}
            </div>";
          }
        ?>
    <div class="row">
        <div class="col-md-6 pr-5">
            <h3 class="font-weight-light">Create Account</h3>
            <hr>
            <form action="login.php" method="post">
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" class="form-control <?php checkValid("username", $new_user)?>"  placeholder="Enter a username..." name="username" value="<?php echo !empty($new_user['username']) ? $new_user['username'] : '' ?>" autocomplete="off">
                <div class="invalid-feedback">
                Username invalid! 
                </div>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" class="form-control <?php checkValid("email", $new_user)?>"  placeholder="Enter your email..." name="email" value="<?php echo !empty($new_user['email']) ? $new_user['email'] : '' ?>">
                <div class="invalid-feedback">
                Email invalid
                </div>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" class="form-control <?php checkValid("password", $new_user)?>"  placeholder="Enter a password" name="password">
                <div class="invalid-feedback">
                Password invalid!
                </div>
            </div>
            <div class="form-group">
                <label for="password_confirm">Confirm Password</label>
                <input type="password" class="form-control <?php checkValid("password_confirm", $new_user)?>"  placeholder="Confirm password..." name="password_confirm">
                <div class="invalid-feedback">
                Passwords don't match!
                </div>
            </div>
            <button class="btn btn-primary btn-block" type="submit" name="create" value="true"><i class="fa-solid fa-circle-plus mr-2"></i>Create Account</button>
            </form>
        </div>
        <div class="col-md-6 pl-5 border-left border-dark">
            <h3 class="font-weight-light">Login to Account</h3>
            <hr>
            <form action="login.php" method="post">
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" class="form-control"  placeholder="Enter a username..." name="username"  autocomplete="off">
                <div class="invalid-feedback">
                Username invalid
                </div>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" class="form-control"  placeholder="Enter a password" name="password">
                <div class="invalid-feedback">
                Password invalid!
                </div>
            </div>
            <button class="btn btn-success btn-block" type="submit" name="login" value="true"><i class="fa-solid fa-circle-plus mr-2"></i>Login</button>
            </form>
        </div>
    </div>
</div>

<?php
include 'include/footer.php';
?>