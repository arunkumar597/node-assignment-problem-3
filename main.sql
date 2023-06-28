const mysql = require('mysql');

// Create a MySQL connection pool
const pool = mysql.createPool({
  host: 'your_host',
  user: 'your_username',
  password: 'your_password',
  database: 'your_database',
});

// Function to insert customers data
function insertCustomersData(customers) {
  // Acquire a connection from the pool
  pool.getConnection((err, connection) => {
    if (err) {
      console.error('Error connecting to MySQL:', err);
      return;
    }

    // Prepare the SQL query
    const query = 'INSERT INTO customers (email, name) VALUES ?';

    // Transform the customers data into a 2D array
    const values = customers.map(customer => [customer.email, customer.name]);

    // Execute the query with the values
    connection.query(query, [values], (error, results) => {
      // Release the connection back to the pool
      connection.release();

      if (error) {
        console.error('Error inserting data:', error);
        return;
      }

      console.log('Data inserted successfully!');
    });
  });
}

// Usage: Call the insertCustomersData function with the customers data
const customers = [
  {
    email: 'anurag11@yopmail.com',
    name: 'anurag',
  },
  {
    email: 'sameer11@yopmail.com',
    name: 'sameer',
  },
  {
    email: 'ravi11@yopmail.com',
    name: 'ravi',
  },
  {
    email: 'akash11@yopmail.com',
    name: 'akash',
  },
  {
    email: 'anjali11@yopmail.com',
    name: 'anjali',
  },
  {
    email: 'santosh11@yopmail.com',
    name: 'santosh',
  },
];

insertCustomersData(customers);