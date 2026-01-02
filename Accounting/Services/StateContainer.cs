using Accounting.Models;

namespace Accounting.Services
{
    public class StateContainer
    {
        private List<SalesCategory>? _salesCategories;
        private List<PurchaseCategory>? _purchaseCategories;
        private readonly SemaphoreSlim _semaphore = new(1, 1);
        private readonly IServiceProvider _serviceProvider;

        public StateContainer(IServiceProvider serviceProvider)
        {
            _serviceProvider = serviceProvider;
        }

        public async Task<List<SalesCategory>> GetSalesCategoriesAsync()
        {
            if (_salesCategories != null)
                return _salesCategories;

            await _semaphore.WaitAsync();
            try
            {
                if (_salesCategories != null)
                    return _salesCategories;

                using (var scope = _serviceProvider.CreateScope())
                {
                    var salesCategoryService = scope.ServiceProvider.GetRequiredService<SalesCategoryService>();
                    _salesCategories = await salesCategoryService.GetSalesCategoriesAsync();
                    return _salesCategories;
                }
            }
            finally
            {
                _semaphore.Release();
            }
        }

        public async Task RefreshSalesCategoriesAsync()
        {
            await _semaphore.WaitAsync();
            try
            {
                using (var scope = _serviceProvider.CreateScope())
                {
                    var salesCategoryService = scope.ServiceProvider.GetRequiredService<SalesCategoryService>();
                    _salesCategories = await salesCategoryService.GetSalesCategoriesAsync();
                }
            }
            finally
            {
                _semaphore.Release();
            }
        }

        public async Task<List<PurchaseCategory>> GetPurchaseCategoriesAsync()
        {
            if (_purchaseCategories != null)
                return _purchaseCategories;

            await _semaphore.WaitAsync();
            try
            {
                if (_purchaseCategories != null)
                    return _purchaseCategories;

                using (var scope = _serviceProvider.CreateScope())
                {
                    var purchaseCategoryService = scope.ServiceProvider.GetRequiredService<PurchaseCategoryService>();
                    _purchaseCategories = await purchaseCategoryService.GetPurchaseCategoriesAsync();
                    return _purchaseCategories;
                }
            }
            finally
            {
                _semaphore.Release();
            }
        }

        public async Task RefreshPurchaseCategoriesAsync()
        {
            await _semaphore.WaitAsync();
            try
            {
                using (var scope = _serviceProvider.CreateScope())
                {
                    var purchaseCategoryService = scope.ServiceProvider.GetRequiredService<PurchaseCategoryService>();
                    _purchaseCategories = await purchaseCategoryService.GetPurchaseCategoriesAsync();
                }
            }
            finally
            {
                _semaphore.Release();
            }
        }
    }
}