Image.create!([
  {image_url: "http://a1.zassets.com/images/z/9/5/5/8/3/1/955831-p-MULTIVIEW.jpg", product_id: 1},
  {image_url: "https://thefashiontag.files.wordpress.com/2014/06/stilettos-summer-shoes-trend-2.jpg", product_id: 2},
  {image_url: "http://www.mytrendyclothe.com/wp-content/uploads/2015/07/bowling-shoes.jpg", product_id: 3},
  {image_url: "http://pomomusings.com/wp-content/uploads/2010/01/Chuck-Taylors.jpg", product_id: 4},
  {image_url: "http://www.shefinds.com/files/2013/07/Old-Navy-Flip-Flop-Sale.jpg", product_id: 5},
  {image_url: "http://springsbargains.com/wp-content/uploads/2011/05/old-navy-flip-flops.jpg", product_id: 5},
  {image_url: "http://direct2you.ws/images/library/Image/kids-shoes.jpg", product_id: 6}
])
Order.create!([
  {user_id: 2, product_id: 4, quantity: 3, subtotal: "180.0", tax: "16.2", total: "196.2"},
  {user_id: 2, product_id: 4, quantity: 1, subtotal: "60.0", tax: "5.4", total: "65.4"},
  {user_id: 1, product_id: 3, quantity: 2, subtotal: "60.0", tax: "5.4", total: "65.4"},
  {user_id: 1, product_id: 2, quantity: 1, subtotal: "50.0", tax: "4.5", total: "54.5"},
  {user_id: 1, product_id: 6, quantity: 3, subtotal: "195.0", tax: "17.55", total: "212.55"},
  {user_id: 2, product_id: 5, quantity: 2, subtotal: "10.0", tax: "0.9", total: "10.9"},
  {user_id: 2, product_id: 3, quantity: 5, subtotal: "150.0", tax: "13.5", total: "163.5"},
  {user_id: 2, product_id: 5, quantity: 4, subtotal: "20.0", tax: "1.8", total: "21.8"}
])
Product.create!([
  {name: "Frye Boots", price: "105.0", size: "9.5", description: "Leather boots with leather soles", in_stock: true, supplier_id: 1, user_id: 2},
  {name: "Stilettos", price: "50.0", size: "9", description: "Pencil shoes", in_stock: true, supplier_id: 3, user_id: 1},
  {name: "Bowling shoes", price: "30.0", size: "8.5", description: "Used bowling shoes", in_stock: true, supplier_id: 3, user_id: 1},
  {name: "Chuck Taylors", price: "60.0", size: "10", description: "Classic canvas high-top sneaker", in_stock: true, supplier_id: 1, user_id: 1},
  {name: "Flip Flops", price: "5.0", size: "8", description: "Plastic flip-flops", in_stock: true, supplier_id: 2, user_id: 1},
  {name: "Ernie boots", price: "65.0", size: "6", description: "Boots like Ernie", in_stock: true, supplier_id: 1, user_id: 2}
])
Supplier.create!([
  {name: "Nordstroms", email: "nordstroms@gmail.com", phone: "4151234567"},
  {name: "Old Navy", email: "oldnavy@gmail.com", phone: "6501234567"},
  {name: "Nick*Mart", email: "nickmart@gmail.com", phone: "8001234567"}
])
