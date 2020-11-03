package dao;

import model.Customer;

import java.sql.SQLException;
import java.util.List;

public interface ICustomerDAO {
    List<Customer> findAll();

    Customer selectCustomer(int id);

    void save(Customer customer);

//    Customer findById(int id);

    boolean update(int id, Customer customer) throws SQLException;

    boolean remove(int id) throws SQLException;
}
