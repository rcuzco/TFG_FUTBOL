using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Threading.Tasks;


namespace TFG_FUTBOL.DataContext
{
    public interface IGenericRepository<TEntity> where TEntity : class
    {
        int Add(IEnumerable<TEntity> newEntities);
        int Add(TEntity newEntity);
        Task<int> AddAsync(IEnumerable<TEntity> newEntities);
        Task<int> AddAsync(TEntity newEntity);
        IEnumerable<TEntity> All();
        Task<IEnumerable<TEntity>> AllAsync();

        TEntity Find(params object[] pks);
        Task<TEntity> FindAsync(params object[] pks);
        TEntity FirstOrDefault(Expression<Func<TEntity, bool>> filter);
        Task<TEntity> FirstOrDefaultAsync(Expression<Func<TEntity, bool>> filter);
        IEnumerable<TEntity> GetData(Expression<Func<TEntity, bool>> filter);
        Task<IEnumerable<TEntity>> GetDataAsync(Expression<Func<TEntity, bool>> filter);
        int InstertOrUpdate(TEntity entity);
        int InstertOrUpdate(TEntity entity, object pks);
        Task<int> InstertOrUpdateAsync(TEntity entity);
        Task<int> InstertOrUpdateAsync(TEntity entity, object pks);
        int Remove(IEnumerable<TEntity> removeEntities);
        int Remove(params object[] pks);
        int Remove(TEntity removeEntity);
        Task<int> RemoveAsync(IEnumerable<TEntity> removeEntities);
        Task<int> RemoveAsync(params object[] pks);
        Task<int> RemoveAsync(TEntity removeEntity);
        int Update(TEntity updateEntity);
        Task<int> UpdateAsync(TEntity updateEntity);
        int UpdateFields(IEnumerable<TEntity> entities, params Expression<Func<TEntity, object>>[] updatedProperties);
        int UpdateFields(TEntity updateEntity, params Expression<Func<TEntity, object>>[] updatedProperties);
    }
}