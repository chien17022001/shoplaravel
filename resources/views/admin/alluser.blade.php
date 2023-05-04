@extends('admin.layouts.template')
@section('page_title')
    All User
@endsection
@section('content')
<div class="content-wrapper">
    <!-- Content -->

    <div class="container-xxl flex-grow-1 container-p-y">
      <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Page /</span> All User</h4>
      <!-- Basic Bootstrap Table -->
      <div class="card">
        <h5 class="card-header">Available User Information</h5>

        <div class="table-responsive text-nowrap">
          <table class="table">
            <thead>
              <tr>
                <th>Id</th>
                <th>Name</th>
                <th>Email</th>
                <th>User Type</th>
                <th>Actions</th>
              </tr>
            </thead>
            @php
                $i=1;
            @endphp
            <tbody class="table-border-bottom-0">
                @foreach ($alluser  as $user)
                <tr>
                    <td>{{ $i++ }}</td>
                    <td>{{ $user -> name }}</td>
                    <td>{{ $user -> email }}</td>
                    <td>{{ $user->roles->first()->display_name }}</td>

                    <td>
                        <a href="" class="btn btn-primary">Edit</a>
                        <a href="" class="btn btn-warning">Delete</a>
                    </td>
                </tr>
                @endforeach

            </tbody>
          </table>
      </div>
    </div>
  </div>
@endsection
