<?php

declare(strict_types=1);

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreProductRequest;
use App\Http\Requests\UpdateProductRequest;
use App\Http\Resources\ProductResource;
use App\Models\Produto;
use App\Services\ProductService;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    public function index(Request $request)
    {
        $this->authorize('viewAny', Produto::class);

        $query = Produto::query()
            ->with('variacoes')
            ->when($request->filled('empresa_id'), function ($q) use ($request) {
                return $q->where('empresa_id', $request->input('empresa_id'));
            })
            ->when($request->filled('tracking_type'), function ($q) use ($request) {
                return $q->where('tracking_type', $request->input('tracking_type'));
            })
            ->when($request->filled('search'), function ($q) use ($request) {
                $term = $request->input('search');
                return $q->where(function ($query) use ($term) {
                    $query->where('nome', 'LIKE', "%{$term}%")
                        ->orWhere('codigo_barras', 'LIKE', "%{$term}%")
                        ->orWhere('codigo_barras2', 'LIKE', "%{$term}%")
                        ->orWhere('codigo_barras3', 'LIKE', "%{$term}%")
                        ->orWhere('referencia', 'LIKE', "%{$term}%");
                });
            })
            ->orderByDesc('id');

        $products = $query->paginate($request->input('per_page', env('PAGINACAO', 15)));

        return ProductResource::collection($products);
    }

    public function show(Produto $product)
    {
        $this->authorize('view', $product);

        $product->load('variacoes');

        return new ProductResource($product);
    }

    public function store(StoreProductRequest $request, ProductService $service)
    {
        $this->authorize('create', Produto::class);

        $product = $service->create($request->validated())->load('variacoes');

        return new ProductResource($product);
    }

    public function update(UpdateProductRequest $request, Produto $product, ProductService $service)
    {
        $this->authorize('update', $product);

        $product = $service->update($product, $request->validated())->load('variacoes');

        return new ProductResource($product);
    }

    public function destroy(Produto $product)
    {
        $this->authorize('delete', $product);

        $product->delete();

        return response()->noContent();
    }
}
