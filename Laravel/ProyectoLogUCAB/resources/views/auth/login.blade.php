@extends('layouts.home')

@section('contenido')
<div class="container">
    <div class="wrapper">
            <div class="loginpanel">
                    <div class="txt">
                      <input id="user" type="text" placeholder="Username" />
                      <label for="user" class="entypo-user"></label>
                    </div>
                    <div class="txt">
                      <input id="pwd" type="password" placeholder="Password" />
                      <label for="pwd" class="entypo-lock"></label>
                    </div>
                    <div class="buttons">
                      <input type="button" value="Login" />
                      <span>
                        <a href="javascript:void(0)" class="entypo-user-add register">Register</a>
                      </span>
                    </div>
                    
                    <div class="hr">
                      <div></div>
                      <div>OR</div>
                      <div></div>
                    </div>
                    
                    <div class="social">
                      <a href="javascript:void(0)" class="facebook"></a>
                      <a href="javascript:void(0)" class="twitter"></a>
                      <a href="javascript:void(0)" class="googleplus"></a>
                    </div>
                  </div>
                  
                  <span class="resp-info"></span>
    </div>
</div>
@endsection
