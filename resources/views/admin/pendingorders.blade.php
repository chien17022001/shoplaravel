@extends('admin.layouts.template')
@section('page_title')
    Pending Order
@endsection
@section('content')
    <div class="container my-5">
        <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Page /</span> Pending Orders</h4>
        <div class="card p-4">
            <div class="card-title">
                <h2 class="text-center">Pending Orders</h2>
            </div>
            <div class="card-body">
                <table class="table">
                    <tr>
                        <th>Name</th>
                        <th>Shipping Information</th>
                        <th>Product Id</th>
                        <th>Quantity</th>
                        <th>Total Will Pay</th>
                        <th>Action</th>
                    </tr>

                @foreach ($pending_orders as $order)
                    <td>{{ $order -> name }}</td>
                    <td>
                        <ul>
                            <li>Phone Number - {{ $order-> phone_number }}</li>
                            <li>Email - {{ $order-> email }}</li>
                            <li>Address - {{ $order-> address }}</li>
                        </ul>
                    </td>
                    <td>{{ $order -> product_id }}</td>
                    <td>{{ $order -> quantity }}</td>
                    <td>{{ $order -> toltal_price }}</td>
                    <td><a href="" class="btn btn-success">Approve Now</a></td>
                    <td></td>
                @endforeach
            </table>
            </div>
        </div>
    </div>
@endsection
