@extends('admin.layouts.template')
@section('page_title')
    Edit Category
@endsection
@section('content')
    <div class="content-wrapper">
        <!-- Content -->

        <div class="container-xxl flex-grow-1 container-p-y">
            <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Page /</span> Edit Category</h4>

            <!-- Basic Layout -->
            <div class="row">
                <div class="col-xl">
                    <div class="card mb-4">
                        <div class="card-header d-flex justify-content-between align-items-center">
                            <h5 class="mb-0">Edit Category</h5>
                            <small class="text-muted float-end">Input Information</small>
                        </div>
                        <div class="card-body">
                            @if ($errors->any())
                                <div class="alert alert-danger">
                                    <ul>
                                        @foreach ($errors->all() as $error)
                                            <li>{{ $error }}</li>
                                        @endforeach
                                    </ul>
                                </div>
                            @endif
                            <form action="{{ route('updatecategory') }}" method="POST">
                                @csrf
                                <input type="hidden" value="{{ $category_info->id }}" name="category_id">
                                <div class="mb-3">
                                    <label class="form-label" for="basic-default-fullname">Category Name</label>
                                    <input type="text" class="form-control" id="category_name" name="category_name"
                                    value="{{ $category_info->category_name }}" />
                                </div>
                                <div class="mb-3">

                                    <button type="submit" class="btn btn-primary">Update Category</button>
                            </form>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <!-- / Content -->
    </div>
@endsection
