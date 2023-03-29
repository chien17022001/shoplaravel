<?php

namespace App\Http\Controllers;

use App\Models\Cart;
use App\Models\Category;
use App\Models\Order;
use App\Models\Product;
use App\Models\ShippingInfo;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

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

    public function AddProductToCart(Request $request){
        $pruduct_price = $request ->price;
        $quantity = $request ->quantity;
        $price = $pruduct_price * $quantity;

        Cart::insert([
            'product_id' => $request ->product_id,
            'user_id' => Auth::id(),
            'quantity' => $request -> quantity,
            'price' => $price
        ]);

        return redirect()->route('addtocart')->with('message','Your item added to cart successfully');
    }

    public function RemoveCartItem($id){
        Cart::findOrFail($id)->delete();
        return redirect()->route('addtocart')->with('message','Your item removed from cart successfully');
    }

    public function AddShippingAddress(Request $request){
        ShippingInfo::insert([
            'user_id' => Auth::id(),
            'name' => $request->name,
            'email' => $request->email,
            'phone_number' => $request->phone_number,
            'address' => $request->address
        ]);
        return redirect()->route('checkout');
    }

    public function PlaceOrder(){
        $userid = Auth::id();
        $cart_items = Cart::where('user_id', $userid)->get();
        $shipping_address = ShippingInfo::where('user_id',$userid)->first();
        foreach($cart_items as $item){
            Order::insert([
                'user_id' => $userid,
                'name' => $shipping_address -> name,
                'phone_number' => $shipping_address -> phone_number,
                'email' => $shipping_address -> email,
                'address' => $shipping_address -> address,
                'product_id' => $item -> product_id,
                'quantity' => $item -> quantity,
                'toltal_price' => $item -> 	price
            ]);
            $id = $item->id;
            Cart::findOrFail($id)->delete();
        }
        ShippingInfo::where('user_id',$userid)->first()->delete();
        return redirect()->route('pendingorders')->with('message','Your Order Has Been Placed Successfully!');
    }

    public function GetShippingAddress(){
        return view('user_template.shippingaddress');
    }

    public function PendingOrders(){
        $pending_orders = Order::where('status','pending')->latest()->get();
        return view('user_template.pendingorders',compact('pending_orders'));
    }

    public function History(){
        return view('user_template.history');
    }

    public function AddToCart(){
        $userid = Auth::id();
        $cart_items = Cart::where('user_id',$userid)->get();
        return view('user_template.addtocart',compact('cart_items'));
    }

    public function CheckOut(){
        $userid = Auth::id();
        $cart_items = Cart::where('user_id', $userid)->get();
        $shipping_address = ShippingInfo::where('user_id',$userid)->first();
        return view('user_template.checkout',compact('cart_items','shipping_address'));
    }

    public function UserProfile(){
        return view('user_template.userprofile');
    }
}
