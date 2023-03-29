@extends('user_template.layouts.template')
@section('main-content')
    <!-- Checkout Start -->
    <div class="container-fluid pt-5">
        <form action="{{ route('addshippingaddress') }}" method="POST">
            @csrf
            <div class="row px-xl-5">
                <div class="col-lg-20">
                    <div class="mb-4">
                        <h4 class="font-weight-semi-bold mb-4">Billing Address</h4>
                        <div class="row">
                            <div class="col-md-6 form-group">
                                <label>Name</label>
                                <input class="form-control" type="text" name="name" placeholder="John">
                            </div>

                            <div class="col-md-6 form-group">
                                <label>E-mail</label>
                                <input class="form-control" type="text" name="email" placeholder="example@email.com">
                            </div>
                            <div class="col-md-6 form-group">
                                <label>Mobile Phone</label>
                                <input class="form-control" type="text" name="phone_number" placeholder="+123 456 789">
                            </div>
                            <div class="col-md-6 form-group">
                                <label>Address</label>
                                <input class="form-control" type="text" name="address" placeholder="123 Street">
                            </div>
                            <div class="card-footer border-secondary bg-transparent">
                                <button class="btn btn-lg btn-block btn-primary font-weight-bold my-3 py-3">Next</button>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
        </form>
    </div>
    <!-- Checkout End -->
@endsection
