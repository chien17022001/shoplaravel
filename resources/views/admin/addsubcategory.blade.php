@extends('admin.layouts.template')
@section('page_title')
Add Sub Category
@endsection
@section('content')
<div class="content-wrapper">
    <!-- Content -->

    <div class="container-xxl flex-grow-1 container-p-y">
      <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Page /</span> Add Sub Category</h4>

      <!-- Basic Layout -->
      <div class="row">
        <div class="col-xl">
          <div class="card mb-4">
            <div class="card-header d-flex justify-content-between align-items-center">
              <h5 class="mb-0">Add New Sub Category</h5>
              <small class="text-muted float-end">Input Information</small>
            </div>
            <div class="card-body">
              <form action="" method="POST">
                <div class="mb-3">
                  <label class="form-label" for="basic-default-fullname">Sub Category Name</label>
                  <input type="text" class="form-control" id="subcategory_name" name="subcategory_name" placeholder="Electronics" />
                </div>
                <div class="mb-3">
                    <label class="form-label" for="basic-default-fullname">Select Category</label>
                    <select class="form-select" id="category" name="category" aria-label="Default select example">
                        <option selected>Open this select menu</option>
                        <option value="1">One</option>
                        <option value="2">Two</option>
                        <option value="3">Three</option>
                      </select>
                  </div>

                <button type="submit" class="btn btn-primary">Add Sub Category</button>
              </form>
            </div>
          </div>
        </div>

      </div>
    </div>
    <!-- / Content -->
  </div>
@endsection
