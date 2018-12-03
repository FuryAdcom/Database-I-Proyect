<?php

namespace LogUCAB\Http\Controllers;

use Illuminate\Http\Request;

use LogUCAB\Http\Requests;
use Illuminate\Support\Facades\Redirect;

use DB;


class OfficeController extends Controller
{
    public function __construct(){

    }

    public function inicio(){
        return view("oficina.office");
    }
    public function create(){
        return view("oficina.createoffice");
    }
    public function store(){

    }
    public function lista(){
        return view("oficina.showoffice");
    }
    public function edit(){
        return view("oficina.editoffice");
    }
    public function update(){

    }
    public function destroy(){
        return view("oficina.deleteoffice");
    }
}
