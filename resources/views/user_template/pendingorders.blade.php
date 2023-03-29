@extends('user_template.layouts.user_profile_template')
@section('profilecontent')
pending orders
@if (session()->has('massage'))
    <div class="alert alert-success">
        {{ session()->get('message') }}
    </div>
@endif
@endsection
