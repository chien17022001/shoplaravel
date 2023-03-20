<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use function Ramsey\Uuid\v1;

class ClientController extends Controller
{
    public function CategoryPage(){
        return view('user_template.category');
    }

    public function SingleProduct(){
        return view('user_template.product');
    }

    public function AddToCart(){
        return view('user_template.addtocart');
    }

    public function CheckOut(){
        return view('user_template.checkout');
    }

    public function UserProfile(){
        return view('user_template.userprofile');
    }
}
