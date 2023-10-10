void MyApp() {
  Map<String, dynamic> userdata = {
    "users": [
      {
        "user_id": 1,
        "username": "john_doe",
        "email": "john@example.com",
        "full_name": "John Doe",
        "address": {
          "street": "123 Main St",
          "city": "New York",
          "zip_code": "10001"
        },
        "orders": [
          {
            "order_id": "A12345",
            "order_date": "2023-09-29",
            "products": [
              {
                "product_id": "P001",
                "product_name": "Smartphone",
                "quantity": 2,
                "price": 599.99
              },
              {
                "product_id": "P002",
                "product_name": "Laptop",
                "quantity": 1,
                "price": 999.99
              }
            ]
          },
          {
            "order_id": "A12346",
            "order_date": "2023-09-30",
            "products": [
              {
                "product_id": "P003",
                "product_name": "Tablet",
                "quantity": 3,
                "price": 299.99
              }
            ]
          }
        ]
      },
      {
        "user_id": 2,
        "username": "jane_smith",
        "email": "jane@example.com",
        "full_name": "Jane Smith",
        "address": {
          "street": "456 Oak St",
          "city": "Los Angeles",
          "zip_code": "90001"
        },
        "orders": []
      }
    ]
  };

  String city = userdata['users'][0]['address']['city'];
  String order = userdata['users'][0]['orders'][0]['products'][0]['product_id'];

  print(city);
  print(order);
}
