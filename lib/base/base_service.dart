 abstract class BaseService<M>{
 Future<M> insertData(Object obj);
 Future<M> updateData(Object obj);
 Future<M> deleteData(Object obj);
 Future<M> getAllData();
 Future<M> getDataById(int id);

}