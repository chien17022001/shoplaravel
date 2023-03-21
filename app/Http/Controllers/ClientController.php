<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Product;
use Illuminate\Http\Request;

use function Ramsey\Uuid\v1;

class ClientController extends Controller
{
    public function CategoryPage($id){
        $category = Category::findOrFail($id);
        $product = Product::where('product_category_id',$id)->latest()->get();
        return view('user_template.category', compact('category','product'));
    }

    public function SingleProduct($id){
        $product = Product::findOrFail($id);
        $subcat_id = Product::where('id',$id)->value('product_subcategory_id');
        $related_product = Product::where('product_subcategory_id',$subcat_id)->latest()->get();
        return view('user_template.product', compact('product','related_product'));
    }

    public function AddProductToCart(){

    }

    public function PendingOrders(){
        return view('user_template.pendingorders');
    }

    public function History(){
        return view('user_template.history');
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
