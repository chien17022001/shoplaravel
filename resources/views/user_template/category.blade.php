@extends('user_template.layouts.template')
@section('main-content')
{{-- {{ $category->category_name }} - {{ $category->product_cout }} --}}

<div class="container-fluid pt-5">
    <div class="text-center mb-4">
        <h2 class="section-title px-5"><span class="px-2">{{ $category->category_name }} - ({{ $category->product_cout }})</span></h2>
    </div>
    <div class="row px-xl-5 pb-3">

        @foreach ($products as $product)
        <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
            <div class="card product-item border-0 mb-4">
                <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                    <img class="img-fluid w-100" style="height: 300px;" src="{{ asset($product-> product_img) }}" alt="">

                </div>
                <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                    <h6  class="text-truncate mb-3">{{ $product-> product_name}}</h6>
                    <div class="d-flex justify-content-center">
                        <h6>@money($product-> price)</h6>
                    </div>
                </div>
                <div class="card-footer d-flex justify-content-between bg-light border">
                    <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>See More</a>
                    <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
                </div>
            </div>
        </div>
        @endforeach

    </div>
    <div class="row px-xl-5 pb-3">{{ $products->links() }}</div>
</div>
@endsection
