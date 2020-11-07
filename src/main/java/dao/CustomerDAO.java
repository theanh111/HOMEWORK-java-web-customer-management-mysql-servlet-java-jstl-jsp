package dao;

import model.Customer;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerDAO implements ICustomerDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/homework?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "TheanHtran111@";

    private static final String INSERT_CUSTOMERS_SQL = "{CALL insertCustomerSQL (?,?,?,?,?)}";
    private static final String SELECT_CUSTOMER_BY_ID = "{CALL selectCustomerSQL (?)}";
    private static final String SELECT_ALL_CUSTOMERS = "{CALL selectAllCustomerSQL()}";
    private static final String DELETE_CUSTOMERS_SQL = "{CALL deleteCustomerSQL(?)}";
    private static final String UPDATE_CUSTOMERS_SQL = "{CALL updateCustomerSQL(?,?,?,?,?)}";
    private static final String SEARCH_CUSTOMER_BY_NAME = "{CALL searchCustomerByNameSQL(?)}";

    public CustomerDAO() {
    }

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return connection;
    }


    @Override
    public void save(Customer customer) {
        System.out.println(INSERT_CUSTOMERS_SQL);
        try (Connection connection = getConnection();
             CallableStatement callableStatement = connection.prepareCall(INSERT_CUSTOMERS_SQL)) {
            callableStatement.setInt(1, customer.getId());
            callableStatement.setString(2, customer.getName());
            callableStatement.setString(3, customer.getEmail());
            callableStatement.setString(4, customer.getAddress());
            callableStatement.setString(5, customer.getImage());
            System.out.println(callableStatement);
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Customer selectCustomer(int id) {
        Customer customer = null;
        try (Connection connection = getConnection();
             CallableStatement callableStatement = connection.prepareCall(SELECT_CUSTOMER_BY_ID);) {
            callableStatement.setInt(1, id);
            System.out.println(callableStatement);
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()) {
                String name = rs.getString("name");
                String email = rs.getString("email");
                String address = rs.getString("address");
                String image = rs.getString("image");
                customer = new Customer(id, name, email, address, image);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return customer;
    }

    @Override
    public List<Customer> findAll() {
        List<Customer> customers = new ArrayList<>();
        try (Connection connection = getConnection();
             CallableStatement callableStatement = connection.prepareCall(SELECT_ALL_CUSTOMERS);) {
            System.out.println(callableStatement);
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String address = rs.getString("address");
                String image = rs.getString("image");
                customers.add(new Customer(id, name, email, address, image));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return customers;
    }

    @Override
    public boolean remove(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             CallableStatement callableStatement = connection.prepareCall(DELETE_CUSTOMERS_SQL);) {
            callableStatement.setInt(1, id);
            rowDeleted = callableStatement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    @Override
    public boolean update(int id, Customer customer) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
             CallableStatement callableStatement = connection.prepareCall(UPDATE_CUSTOMERS_SQL);) {
            callableStatement.setInt(1, customer.getId());
            callableStatement.setString(2, customer.getName());
            callableStatement.setString(3, customer.getEmail());
            callableStatement.setString(4, customer.getAddress());
            callableStatement.setString(5, customer.getImage());
            rowUpdated = callableStatement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    @Override
    public List<Customer> searchByName(String searchName) {
        List<Customer> customersByName = new ArrayList<>();
        Connection connection = getConnection();
        try {
            CallableStatement callableStatement = connection.prepareCall(SEARCH_CUSTOMER_BY_NAME);
            callableStatement.setString(1, searchName);
            ResultSet rs = callableStatement.executeQuery();
            System.out.println("Đây là test: " + callableStatement);
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String address = rs.getString("address");
                String image = rs.getString("image");
                customersByName.add(new Customer(id, name, email, address, image));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return customersByName;
    }

    @Override
    public Customer searchById(int searchId) {
        Customer customer = null;
        Connection connection = getConnection();
        try {
            CallableStatement callableStatement = connection.prepareCall(SELECT_CUSTOMER_BY_ID);
            callableStatement.setInt(1, searchId);
            ResultSet rs = callableStatement.executeQuery();
            System.out.println("Đây là test: " + callableStatement);
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String address = rs.getString("address");
                String image = rs.getString("image");
                customer = new Customer(id, name, email, address, image);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return customer;
    }
}
