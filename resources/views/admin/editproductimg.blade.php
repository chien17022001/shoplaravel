@extends('admin.layouts.template')
@section('page_title')
Edit Product Image
@endsection
@section('content')
<div class="content-wrapper">
    <!-- Content -->

    <div class="container-xxl flex-grow-1 container-p-y">
      <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Page /</span> Edit Product Image</h4>

      <!-- Basic Layout -->
      <div class="row">
        <div class="col-xl">
          <div class="card mb-4">
            <div class="card-header d-flex justify-content-between align-items-center">
              <h5 class="mb-0">Edit Product Image</h5>
              <small class="text-muted float-end">Input Information</small>
            </div>
            <div class="card-body">
              <form action="{{ route('updateproductimg') }}" method="POST" enctype="multipart/form-data">
                @csrf
                <div class="mb-3">
                  <label class="form-label" for="basic-default-fullname">Previous Image</label>
                  <div class="col-sm-10">
                    <img src="{{ asset($productinfo->product_img) }}" alt="">
                  </div>
                </div>

                <input type="hidden" value="{{ $productinfo ->id }}" name="id">

                <div class="mb-3">
                    <label for="formFile" class="form-label">Upload New image</label>
                    <input class="form-control" type="file" id="product_img" name="product_img" />
                </div>

                <button type="submit" class="btn btn-primary">Update Product Image</button>
              </form>
            </div>
          </div>
        </div>

      </div>
    </div>
    <!-- / Content -->
  </div>
@endsection
