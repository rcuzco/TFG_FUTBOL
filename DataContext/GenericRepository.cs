using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;


namespace TFG_FUTBOL.DataContext
{
    public class GenericRepository<TEntity> : IGenericRepository<TEntity> where TEntity : class
    {

        protected Func<DbContext> _createContextAction;

        public GenericRepository(Func<DbContext> createContext)
        {
            if (createContext == null) throw new ArgumentNullException(nameof(createContext), $"The parameter createContext can not be null");

            _createContextAction = createContext;
        }



        public virtual IEnumerable<TEntity> All()
        {
            var result = Enumerable.Empty<TEntity>();

            using (var context = _createContextAction())
            {
                var dbSet = context.Set<TEntity>();

                result = dbSet.AsNoTracking().ToList();
            }

            return result;
        }

        public virtual Task<IEnumerable<TEntity>> AllAsync()
        {
            return Task.Run(() =>
            {
                return All();
            });
        }

        public virtual TEntity Find(params object[] pks)
        {
            if (pks == null) throw new ArgumentNullException(nameof(pks), $"The parameter pks can not be null");

            TEntity result = null;
            using (var context = _createContextAction())
            {
                var dbSet = context.Set<TEntity>();

                result = dbSet.Find(pks);
            }

            return result;
        }

        public virtual Task<TEntity> FindAsync(params object[] pks)
        {
            return Task.Run(() =>
            {
                return Find(pks);
            });
        }


        public TEntity FirstOrDefault(Expression<Func<TEntity, bool>> filter)
        {
            var _filter = filter ?? throw new ArgumentNullException(nameof(filter));

            TEntity result = null;

            using (var context = _createContextAction())
            {

                var dbSet = context.Set<TEntity>();

                result = dbSet.FirstOrDefault(filter);
            }

            return result;
        }

        public Task<TEntity> FirstOrDefaultAsync(Expression<Func<TEntity, bool>> filter)
        {
            return Task.Run(() =>
            {
                return FirstOrDefault(filter);
            });
        }



        public virtual IEnumerable<TEntity> GetData(Expression<Func<TEntity, bool>> filter)
        {
            if (filter == null) throw new ArgumentNullException(nameof(filter), $"The parameter filter can not be null");

            var result = Enumerable.Empty<TEntity>();
            using (var context = _createContextAction())
            {

                var dbSet = context.Set<TEntity>();

                result = dbSet.AsNoTracking().Where(filter).ToList();
            }

            return result;
        }

      

        public virtual Task<IEnumerable<TEntity>> GetDataAsync(Expression<Func<TEntity, bool>> filter)
        {
            return Task.Run(() =>
            {
                return GetData(filter);
            });
        }



        public virtual int Add(TEntity newEntity)
        {
            if (newEntity == null) throw new ArgumentNullException(nameof(newEntity), $"The parameter newEntity can not be null");

            var result = 0;
            using (var context = _createContextAction())
            {

                var dbSet = context.Set<TEntity>();

                dbSet.Add(newEntity);

                result = context.SaveChanges();
            }

            return result;
        }

        public virtual Task<int> AddAsync(TEntity newEntity)
        {
            return Task.Run(() =>
            {
                return Add(newEntity);
            });
        }

        public virtual int Add(IEnumerable<TEntity> newEntities)
        {
            if (newEntities == null) throw new ArgumentNullException(nameof(newEntities), $"The parameter newEntities can not be null");

            var result = 0;
            using (var context = _createContextAction())
            {

                var dbSet = context.Set<TEntity>();

                dbSet.AddRange(newEntities);

                result = context.SaveChanges();
            }

            return result;
        }

        public virtual Task<int> AddAsync(IEnumerable<TEntity> newEntities)
        {
            return Task.Run(() =>
            {
                return Add(newEntities);
            });
        }

        public virtual int Remove(TEntity removeEntity)
        {
            if (removeEntity == null) throw new ArgumentNullException(nameof(removeEntity), $"The parameter removeEntity can not be null");

            var result = 0;
            using (var context = _createContextAction())
            {
                var dbSet = context.Set<TEntity>();

                dbSet.Attach(removeEntity);

                context.Entry(removeEntity).State = EntityState.Deleted;

                result = context.SaveChanges();
            }

            return result;
        }

        public virtual Task<int> RemoveAsync(TEntity removeEntity)
        {
            return Task.Run(() =>
            {
                return Remove(removeEntity);
            });
        }

        public virtual int Remove(IEnumerable<TEntity> removeEntities)
        {
            if (removeEntities == null) throw new ArgumentNullException(nameof(removeEntities), $"The parameter removeEntities can not be null");

            var result = 0;
            using (var context = _createContextAction())
            {

                var dbSet = context.Set<TEntity>();

                foreach (var removeEntity in removeEntities)
                {
                    dbSet.Attach(removeEntity);

                    context.Entry(removeEntity).State = EntityState.Deleted;
                }

                dbSet.RemoveRange(removeEntities);

                result = context.SaveChanges();
            }

            return result;
        }

        public virtual Task<int> RemoveAsync(IEnumerable<TEntity> removeEntities)
        {
            return Task.Run(() =>
            {
                return Remove(removeEntities);
            });
        }

        public virtual int Remove(params object[] pks)
        {
            if (pks == null) throw new ArgumentNullException(nameof(pks), $"The parameter removeEntity can not be null");

            var result = 0;
            using (var context = _createContextAction())
            {

                var dbSet = context.Set<TEntity>();

                var entity = Find(pks);

                dbSet.Attach(entity);

                context.Entry(entity).State = EntityState.Deleted;

                result = context.SaveChanges();
            }

            return result;
        }

        public virtual Task<int> RemoveAsync(params object[] pks)
        {
            return Task.Run(() =>
            {
                return Remove(pks);
            });
        }

        public virtual int Update(TEntity updateEntity)
        {
            if (updateEntity == null) throw new ArgumentNullException(nameof(updateEntity), $"The parameter updateEntity can not be null");

            var result = 0;
            using (var context = _createContextAction())
            {

                var dbSet = context.Set<TEntity>();

                dbSet.Attach(updateEntity);

                context.Entry(updateEntity).State = EntityState.Modified;

                result = context.SaveChanges();
            }

            return result;
        }

        public virtual Task<int> UpdateAsync(TEntity updateEntity)
        {
            return Task.Run(() =>
            {
                return Update(updateEntity);
            });
        }


        public virtual int InstertOrUpdate(TEntity entity)
        {
            if (entity == null) throw new ArgumentNullException(nameof(entity), $"The parameter updateEntity can not be null");

            var result = 0;
            using (var context = _createContextAction())
            {

                var entry = context.Entry<TEntity>(entity);

                entry.State = EntityState.Modified;

                result = TrySaveChanges(entity, context);
            }

            return result;
        }



        public virtual Task<int> InstertOrUpdateAsync(TEntity entity)
        {
            return Task.Run(() =>
            {
                return InstertOrUpdate(entity);
            });
        }

        public virtual int InstertOrUpdate(TEntity entity, object pks)
        {
            if (entity == null) throw new ArgumentNullException(nameof(entity), $"The parameter updateEntity can not be null");
            if (pks == null) throw new ArgumentNullException(nameof(pks), $"The parameter updateEntity can not be null");

            var result = 0;
            using (var context = _createContextAction())
            {

                var entry = context.Entry<TEntity>(entity);

                entry.State = EntityState.Modified;

                result = TrySaveChanges(entity, context);
            }

            return result;
        }


        public virtual Task<int> InstertOrUpdateAsync(TEntity entity, object pks)
        {
            return Task.Run(() =>
            {
                return InstertOrUpdate(entity);
            });
        }

        protected virtual int TrySaveChanges(TEntity entity, DbContext context)
        {
            int result = 0;



            try
            {
                result = context.SaveChanges();
            }
            catch (DbUpdateConcurrencyException ex)
            {
                var entry = context.Entry<TEntity>(entity);

                entry.State = EntityState.Added;

                result = context.SaveChanges();
            }


            return result;

        }

        public virtual int UpdateFields(TEntity updateEntity, params Expression<Func<TEntity, object>>[] updatedProperties)
        {
            if (updateEntity == null) throw new ArgumentNullException(nameof(updateEntity), $"The parameter updateEntity can not be null");

            var result = 0;

            using (var context = _createContextAction())
            {
                var dbSet = context.Set<TEntity>();

                dbSet.Attach(updateEntity);

                if (updatedProperties.Any())
                {
                    //update explicitly mentioned properties
                    foreach (var property in updatedProperties)
                    {
                        context.Entry(updateEntity).Property(property).IsModified = true;
                    }
                }
                else
                {
                    context.Entry(updateEntity).State = EntityState.Modified;
                }

                result = context.SaveChanges();
            }


            return result;
        }

        public virtual int UpdateFields(IEnumerable<TEntity> entities, params Expression<Func<TEntity, object>>[] updatedProperties)
        {
            if (entities == null) throw new ArgumentNullException(nameof(entities), $"The parameter entities can not be null");

            var result = 0;

            foreach (var entity in entities)
            {
                result += UpdateFields(entity, updatedProperties);
            }



            return result;
        }

    }

}
