<?php

namespace LogUCAB\Http\Controllers\Auth;

use LogUCAB\User;
use LogUCAB\Usuario;
use LogUCAB\Client;
use LogUCAB\Worker;
use LogUCAB\Audi;
use LogUCAB\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Foundation\Auth\RegistersUsers;

class RegisterController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Register Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users as well as their
    | validation and creation. By default this controller uses a trait to
    | provide this functionality without requiring any additional code.
    |
    */

    use RegistersUsers;

    /**
     * Where to redirect users after registration.
     *
     * @var string
     */
    protected $redirectTo = '/';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {

    }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
        return Validator::make($data, [
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:6|confirmed',
        ]);
    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array  $data
     * @return \LogUCAB\User
     */
    protected function create(array $data)
    {
        $c = Client::where('Correo_Personal', $data['email'])->first();
        $e = Worker::where('Correo_Personal', $data['email'])->first();
        $us = Usuario::where('Usuario.Nombre', $data['name'])->first();
        if(isset($us)){
            return Redirect::back()->withInput(Input::all());
        }else{
            $us = Usuario::where('Usuario.Correo', $data['email'])->first();
            if(isset($us)){
                return Redirect::back()->withInput(Input::all());
            }
        }

        if(!isset($data['rol'])){
        if(isset($c)){
            Usuario::create([
                "Codigo" => Usuario::max('Codigo')+1,
                "Nombre" => $data['name'],
                "Correo" => $data['email'],
                "Contraseña" => Hash::make($data['password']),
                "FK_Sele_Concede" => $c->FK_Asignado_Tipo
            ]);
            return User::create([
                'name' => $data['name'],
                'email' => $data['email'],
                'password' => Hash::make($data['password']),
                'rol' => $c->FK_Asignado_Tipo
            ]);
        }elseif(isset($e)){
            Usuario::create([
                "Codigo" => Usuario::max('Codigo')+1,
                "Nombre" => $data['name'],
                "Correo" => $data['email'],
                "Contraseña" => Hash::make($data['password']),
                "FK_Sele_Concede" => $e->FK_Asignado_Puesto
            ]);
            return User::create([
                'name' => $data['name'],
                'email' => $data['email'],
                'password' => Hash::make($data['password']),
                'rol' => $e->FK_Asignado_Puesto
            ]);
        }else{
            Usuario::create([
                "Codigo" => Usuario::max('Codigo')+1,
                "Nombre" => $data['name'],
                "Correo" => $data['email'],
                "Contraseña" => Hash::make($data['password']),
                "FK_Sele_Concede" => 7
            ]);
            User::create([
                'name' => $data['name'],
                'email' => $data['email'],
                'password' => Hash::make($data['password']),
                'rol' => 7
            ]);
            return redirect('/cliente/create');
        }
    }else{
        if(isset($c)){
            Usuario::create([
                "Codigo" => Usuario::max('Codigo')+1,
                "Nombre" => $data['name'],
                "Correo" => $data['email'],
                "Contraseña" => Hash::make($data['password']),
                "FK_Sele_Concede" => $data['rol']
            ]);
            return User::create([
                'name' => $data['name'],
                'email' => $data['email'],
                'password' => Hash::make($data['password']),
                'rol' => $data['rol']
            ]);
        }elseif(isset($e)){
            Usuario::create([
                "Codigo" => Usuario::max('Codigo')+1,
                "Nombre" => $data['name'],
                "Correo" => $data['email'],
                "Contraseña" => Hash::make($data['password']),
                "FK_Sele_Concede" => $data['rol']
            ]);
            return User::create([
                'name' => $data['name'],
                'email' => $data['email'],
                'password' => Hash::make($data['password']),
                'rol' => $data['rol']
            ]);
        }else{
            Usuario::create([
                "Codigo" => Usuario::max('Codigo')+1,
                "Nombre" => $data['name'],
                "Correo" => $data['email'],
                "Contraseña" => Hash::make($data['password']),
                "FK_Sele_Concede" => 7
            ]);
            return User::create([
                'name' => $data['name'],
                'email' => $data['email'],
                'password' => Hash::make($data['password']),
                'rol' => 7
            ]);
    }

    }
    }
}
