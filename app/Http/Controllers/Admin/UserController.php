<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;

class UserController extends Controller
{
    public function Index(){
        $alluser = User::latest()->get();
        return view('admin.alluser', compact('alluser'));
    }
}
