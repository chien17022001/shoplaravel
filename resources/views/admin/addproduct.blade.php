@extends('admin.layouts.template')
@section('page_title')
Add product
@endsection
@section('content')
<div class="content-wrapper">
    <!-- Content -->

    <div class="container-xxl flex-grow-1 container-p-y">
      <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Page /</span> Add Product</h4>

      <!-- Basic Layout -->
      <div class="row">
        <div class="col-xl">
          <div class="card mb-4">
            <div class="card-header d-flex justify-content-between align-items-center">
              <h5 class="mb-0">Add New Product</h5>
              <small class="text-muted float-end">Input Information</small>
            </div>
            <div class="card-body">
              <form action="" method="POST">
                <div class="mb-3">
                  <label class="form-label" for="basic-default-fullname">Product Name</label>
                  <input type="text" class="form-control" id="product_name" name="product_name" placeholder="Electronics" />
                </div>

                <div class="mb-3">
                    <label class="form-label" for="basic-default-fullname">Product Price</label>
                    <input type="number" class="form-control" id="product_price" name="product_price" placeholder="12" />
                </div>

                <div class="mb-3">
                    <label class="form-label" for="basic-default-fullname">Product Quantity</label>
                    <input type="number" class="form-control" id="product_quantity" name="product_quantity" placeholder="1000" />
                </div>

                <div class="mb-3">
                    <label class="form-label" for="basic-default-fullname">Product Short Description</label>
                    <textarea class="form-control" name="" id="" cols="30" rows="5"></textarea>
                </div>

                <div class="mb-3">
                    <label class="form-label" for="basic-default-fullname">Product Long Description</label>
                    <textarea class="form-control" name="" id="" cols="30" rows="10"></textarea>
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

                <div class="mb-3">
                    <label class="form-label" for="basic-default-fullname">Select Sub Category</label>
                    <select class="form-select" id="category" name="category" aria-label="Default select example">
                        <option selected>Open this select menu</option>
                        <option value="1">One</option>
                        <option value="2">Two</option>
                        <option value="3">Three</option>
                      </select>
                </div>

                <div class="mb-3">
                    <label for="formFile" class="form-label">Upload Product image</label>
                    <input class="form-control" type="file" id="formFile" />
                </div>

                <button type="submit" class="btn btn-primary">Add Product</button>
              </form>
            </div>
          </div>
        </div>

      </div>
    </div>
    <!-- / Content -->
  </div>
@endsection
