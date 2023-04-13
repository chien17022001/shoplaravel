@extends('user_template.layouts.template')
@section('main-content')
    <!-- Checkout Start -->
    <div class="container-fluid pt-5">
        <div class="row px-xl-5">
            <div class="col-lg-8">
                <div class="mb-4">
                    <h4 class="font-weight-semi-bold mb-4">Billing Address</h4>
                    <div class="row">
                        <div class="col-md-6 form-group">
                            <label>Name</label>
                            <p>{{ $shipping_address->name }}</p>
                        </div>

                        <div class="col-md-6 form-group">
                            <label>E-mail</label>
                            <p>{{ $shipping_address->email }}</p>
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Mobile Phone</label>
                            <p>{{ $shipping_address->phone_number }}</p>
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Address</label>
                            <p>{{ $shipping_address->address }}</p>
                        </div>

                    </div>
                </div>

            </div>
            <div class="col-lg-4">
                <div class="card border-secondary mb-5">
                    <div class="card-header bg-secondary border-0">
                        <h4 class="font-weight-semi-bold m-0">Order Total</h4>
                    </div>
                    <div class="card-body">
                        <div class="font-weight-medium mb-3">
                            <table class="table">
                                <tr>
                                    <th>Products Name</th>
                                    <th>Quantity</th>
                                    <th>Price</th>
                                </tr>
                                @php
                                    $total = 0;
                                @endphp
                                @foreach ($cart_items as $item)
                                    @php
                                        $product_name = App\Models\Product::where('id', $item->product_id)->value('product_name');
                                    @endphp
                                    <tr>
                                        <td>{{ $product_name }}</td>
                                        <td>{{ $item->quantity }}</td>
                                        <td>@money($item->price)</td>
                                    </tr>
                                    @php
                                        $total = $total + $item->price;
                                    @endphp
                                @endforeach

                            </table>
                            <hr class="mt-0">
                            <div class="d-flex justify-content-between mb-3 pt-1">
                                <h6 class="font-weight-medium">Subtotal</h6>
                                <h6 class="font-weight-medium">@money($total)</h6>
                            </div>
                            <div class="d-flex justify-content-between">
                                <h6 class="font-weight-medium">Shipping</h6>
                                <h6 class="font-weight-medium">@money(30000)</h6>
                            </div>
                        </div>



                    </div>
                    <div class="card-footer border-secondary bg-transparent">
                        <div class="d-flex justify-content-between mt-2">
                            <h5 class="font-weight-bold">Total</h5>
                            <h5 class="font-weight-bold">@money( $total + 30000)</h5>
                        </div>
                    </div>
                    <form action="" method="POST">
                        @csrf
                        <div class="card-footer border-secondary bg-transparent">
                            <input type="submit" value="Cancel Order" class="btn btn-lg btn-block btn-danger font-weight-bold my-3 py-3">
                        </div>
                    </form>
                    <form action="{{ route('placeorder') }}" method="POST">
                        @csrf
                        <div class="card-footer border-secondary bg-transparent">
                            <input type="submit" value="Place Order" class="btn btn-lg btn-block btn-primary font-weight-bold my-3 py-3">
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>
    <!-- Checkout End -->
@endsection
