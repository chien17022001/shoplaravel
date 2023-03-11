@extends('admin.layouts.template')
@section('page_title')
All Sub Category
@endsection
@section('content')

          <!-- Content wrapper -->
          <div class="content-wrapper">
            <!-- Content -->

            <div class="container-xxl flex-grow-1 container-p-y">
              <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Page /</span> All Sub Category</h4>
              @if (session()->has('message'))
              <div class="alert alert-success">
                  {{ session()->get('message') }}
              </div>
              @endif
              <!-- Basic Bootstrap Table -->
              <div class="card">
                <h5 class="card-header">Available Sub Category Information</h5>
                <div class="table-responsive text-nowrap">
                  <table class="table">
                    <thead>
                      <tr>
                        <th>Id</th>
                        <th>Sub Category Name</th>
                        <th>Slug</th>
                        <th>Product</th>
                        <th>Actions</th>
                      </tr>
                    </thead>
                    <tbody class="table-border-bottom-0">
                        @foreach ($allsubcategory as $subcategory)

                        <tr>
                            <td>{{ $subcategory -> id }}</td>
                            <td>{{ $subcategory -> subcategory_name }}</td>
                            <td>{{ $subcategory -> category_name }}</td>
                            <td>{{ $subcategory -> product_count }}</td>
                            <td>
                                <a href="{{ route('editsubcat', $subcategory -> id) }}" class="btn btn-primary">Edit</a>
                                <a href="{{ route('deletesubcat', $subcategory -> id) }}" class="btn btn-warning">Delete</a>
                            </td>
                        </tr>
                        @endforeach

                    </tbody>
              </div>
            </div>
          </div>
@endsection


