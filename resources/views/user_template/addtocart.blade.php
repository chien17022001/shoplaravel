@extends('user_template.layouts.template')
@section('main-content')
    <!-- Cart Start -->
    <div class="container-fluid pt-5">
        <div class="row px-xl-5">
            <div class="col-lg-8 table-responsive mb-5">
                <table class="table table-bordered text-center mb-0">
                    <thead class="bg-secondary text-dark">
                        <tr>
                            <th>Products</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Total</th>
                            <th>Remove</th>
                        </tr>
                    </thead>
                    <tbody class="align-middle">
                        @php
                            $total = 0;
                        @endphp
                        @foreach ($cart_items as $items)
                            <tr>
                                @php
                                    $product_name = App\Models\Product::where('id', $items->product_id)->value('product_name');
                                    $product_price = App\Models\Product::where('id', $items->product_id)->value('price');
                                    $product_img = App\Models\Product::where('id', $items->product_id)->value('product_img');
                                @endphp
                                <td class="align-middle"><img src="{{ $product_img }}" alt="" style="width: 50px;">
                                    {{ $product_name }}</td>
                                <td class="align-middle">{{ $product_price }}</td>
                                <td class="align-middle">{{ $items->quantity }}</td>
                                <td class="align-middle">{{ $items->price }}</td>
                                <td class="align-middle">
                                    {{-- <button class="btn btn-sm btn-primary" >
                                        <a href="{{ route('removeitem', $items->id) }}" ></a>
                                    </button> --}}
                                    <div class="btn btn-warning btn-sm">
                                        <a href="{{ route('removeitem', $items->id) }} " z-index:3><i
                                                class="fa fa-times"></i></a>
                                    </div>

                                </td>
                                @php
                                    $total = $total + $items->price;
                                @endphp
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
            <div class="col-lg-4">
                <form class="mb-5" action="">
                    <div class="input-group">
                        <input type="text" class="form-control p-4" placeholder="Coupon Code">
                        <div class="input-group-append">
                            <button class="btn btn-primary">Apply Coupon</button>
                        </div>
                    </div>
                </form>
                <div class="card border-secondary mb-5">
                    <div class="card-header bg-secondary border-0">
                        <h4 class="font-weight-semi-bold m-0">Cart Summary</h4>
                    </div>
                    <div class="card-body">
                        <div class="d-flex justify-content-between mb-3 pt-1">
                            <h6 class="font-weight-medium">Subtotal</h6>
                            <h6 class="font-weight-medium">{{ $total }}</h6>
                        </div>
                        <div class="d-flex justify-content-between">
                            <h6 class="font-weight-medium">Shipping</h6>
                            @if ($total <= 0)
                                <h6 class="font-weight-medium">$0</h6>
                            @else
                                <h6 class="font-weight-medium">$10</h6>
                                @php
                                    $total +=10;
                                @endphp
                            @endif
                        </div>
                    </div>
                    <div class="card-footer border-secondary bg-transparent">
                        <div class="d-flex justify-content-between mt-2">
                            <h5 class="font-weight-bold">Total</h5>
                            <h5 class="font-weight-bold">{{ $total }}</h5>
                        </div>
                        @if ($total <= 0)
                            <a href="" class="btn btn-block btn-primary my-3 py-3 disabled">Proceed To Checkout</a>
                        @else
                            <a href="{{ route('getshippingaddress') }}" class="btn btn-block btn-primary my-3 py-3">Proceed To Checkout</a>
                        @endif

                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
