<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\SubCategory;
use Illuminate\Http\Request;
use Mockery\Matcher\Subset;

class SubCategoryController extends Controller
{
    public function Index(){
        $allsubcategory = SubCategory::latest()->get();
        return view('admin.allsubcategory', compact('allsubcategory'));
    }

    public function AddSubCategory(){
        $categories = Category::latest()->get();
        return view('admin.addsubcategory', compact('categories'));
    }
    public function StoreSubCategory(Request $request){
        $request->validate([
            'subcategory_name' => 'required|unique:sub_categories',
            'category_id' => 'required'
        ]);

        $category_id = $request->category_id;

        $category_name = Category::where('id', $category_id)->value('category_name');

        SubCategory::insert([
            'subcategory_name' => $request->subcategory_name,
            'slug' => strtolower(str_replace(' ','-',$request->subcategory_name)),
            'category_id' => $category_id,
            'category_name' => $category_name
        ]);

        Category::where('id', $category_id) -> increment('subcategory_count',1);
        return redirect()->route('allsubcategory')->with('message','Sub Category Add Successfully!');

    }

    public function EditSubCat($id){
        $subcatinfo = SubCategory::findOrFail($id);

        return view('admin.editsubcat', compact('subcatinfo'));
    }

    public function UpdateSubCat(Request $request){
        $request ->validate([
            'subcategory_name' => 'required|unique:sub_categories',
        ]);
        $subcatid = $request->subcatid;

        SubCategory::findOrFail($subcatid)->update([
            'subcategory_name' => $request -> subcategory_name,
            'slug' => strtolower(str_replace(' ','-',$request->subcategory_name)),
        ]);
        return redirect()->route('allsubcategory')->with('message','Sub Category Update Successfully!');
    }

    public function DeleteSubCat($id){
        $cat_id = SubCategory::where('id',$id)->value('category_id');
        SubCategory::findOrFail($id)->delete();
        Category::where('id',$cat_id)->decrement('subcategory_count', 1);
        return redirect()->route('allsubcategory')->with('message','Sub Category Delete Successfully!');
    }
}
