<?php

use App\Http\Controllers\Admin\CategoryController;
use App\Http\Controllers\Admin\DashboardController;
use App\Http\Controllers\Admin\OrderController;
use App\Http\Controllers\Admin\ProductController;
use App\Http\Controllers\Admin\SubCategoryController;
use App\Http\Controllers\ClientController;
use App\Http\Controllers\HomeController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('user_template.layouts.template');
});

Route::controller(HomeController::class)->group(function(){
    Route::get('/','Index')->name('home');
});

Route::controller(ClientController::class)->group(function(){
    Route::get('/category/{id}/{slug}','CategoryPage')->name('category');
    Route::get('/product-details/{id}/{slug}','SingleProduct')->name('singleproduct');
});

Route::middleware(['auth', 'role:user'])->group(function(){
    Route::controller(ClientController::class)->group(function(){
        Route::get('/add-to-cart','AddToCart')->name('addtocart');
        Route::post('/add-product-to-cart/{id}','AddProductToCart')->name('addproducttocart');
        Route::get('/checkout','CheckOut')->name('checkout');
        Route::get('/shipping-address','GetShippingAddress')->name('getshippingaddress');
        Route::post('/add-shipping-address','AddShippingAddress')->name('addshippingaddress');
        Route::post('/place-order','PlaceOrder')->name('placeorder');
        Route::get('/user-profile','UserProfile')->name('userprofile');
        Route::get('/user-profile/pending-orders','PendingOrders')->name('pendingorders');
        Route::get('/user-profile/history','History')->name('history');
        Route::get('/remove-cart-item/{id}','RemoveCartItem')->name('removeitem');
    });
});



Route::middleware(['auth', 'role:admin'])->group(function(){
    Route::controller(DashboardController::class)->group(function(){
        Route::get('/admin/dashboard','Index')->name('admindashboard');
    });

    Route::controller(CategoryController::class)->group(function(){
        Route::get('/admin/all-category','Index')->name('allcategory');
        Route::get('/admin/add-category','AddCategory')->name('addcategory');
        Route::post('/admin/store-category','StoreCategory')->name('storecategory');
        Route::get('/admin/edit-category/{id}','EditCategory')->name('editcategory');
        Route::post('/admin/update-category','UpdateCategory')->name('updatecategory');
        Route::get('/admin/delete-category/{id}','DeleteCategory')->name('deletecategory');
    });

    Route::controller(SubCategoryController::class)->group(function(){
        Route::get('/admin/all-subcategory','Index')->name('allsubcategory');
        Route::get('/admin/add-subcategory','AddSubCategory')->name('addsubcategory');
        Route::post('/admin/store-subcategory','StoreSubCategory')->name('storesubcategory');
        Route::get('/admin/edit-subcategory/{id}','EditSubCat')->name('editsubcat');
        Route::post('/admin/update-subcategory','UpdateSubCat')->name('updatesubcat');
        Route::get('/admin/delete-subcategory/{id}','DeleteSubCat')->name('deletesubcat');
    });

    Route::controller(ProductController::class)->group(function(){
        Route::get('/admin/all-products','Index')->name('allproducts');
        Route::get('/admin/add-product','AddProduct')->name('addproduct');
        Route::post('/admin/store-product','StoreProduct') -> name('storeproduct');
        Route::get('/admin/edit-product-img/{id}','EditProductImg')->name('editproductimg');
        Route::post('/admin/update-product-img','UpdateProductImg')-> name('updateproductimg');
        Route::get('/admin/edit-product/{id}','EditProduct')->name('editproduct');
        Route::post('admin/update-product','UpdateProduct')->name('updateproduct');
        Route::get('/admin/delete-product/{id}','DeleteProduct')->name('deleteproduct');
    });

    Route::controller(OrderController::class)->group(function(){
        Route::get('/admin/pending-ordery','Index')->name('pendingorder');
    });
});

require __DIR__.'/auth.php';
