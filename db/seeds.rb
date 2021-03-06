# require 'ffaker'

users_seeds = [
                [ "Tejaswi", "Sagiraju",
                  "tejaswi@sagiraj.u", "tejaswi" ],
                  
                [ "Wyatt", "Sweet",
                  "wyatt@swee.t", "wyatt" ],
                  
                [ "Vanessa", "Farraye",
                  "vanessa@farray.e", "vanessa" ],
                  
                [ "Ugo", "Aniukwu",
                  "ugo@aniukw.u", "ugo" ]
              ]
              
places_seeds = [
                  ["San Francisco", 37.7577, -122.4376, "https://farm9.staticflickr.com/8233/8501175681_c9ae1e4f3e_o_d.jpg"],
                  ["Oakland", 37.7919615, -122.2287941, "https://farm4.staticflickr.com/3025/3091637074_e769a3be23_o_d.jpg"],
                  ["San Jose", 37.2970155, -121.8174109, "http://upload.wikimedia.org/wikipedia/commons/0/0f/SAN_JOSE_CALIFORNIA_PALM_TREE_2010.jpg"]
                ]

posts_seeds =   [
                  [1, nil, "Hello, World!", "I'm Tejaswi!"],
                  [2, nil, "Hello, World!", "I'm Wyatt!"],
                  [3, nil, "Hello, World!", "I'm Vanessa"],
                  [4, nil, "Hello, World!", "I'm Ugo!"],
                  [1, 1, "Hello, Hipsters!", FFaker::HipsterIpsum::paragraphs],
                  [2, 2, "Hello, Hipsters!", FFaker::HipsterIpsum::paragraphs],
                  [3, 3, "Hello, Hipsters!", FFaker::HipsterIpsum::paragraphs],
                  [4, 1, "Hello, Hipsters!", FFaker::HipsterIpsum::paragraphs],
                ]
users_seeds.each do |first_name, last_name, email, password|
  
  User.create(
    first_name: first_name, last_name: last_name,
    email: email, password: password
  )
  
end

places_seeds.each do |name, lat, lng, picture|
  Place.create( name: name, lat: lat, lng: lng, picture: picture )
end
  

posts_seeds.each do |uid, pid, title, body|
  Post.create( user_id: uid, place_id: pid, title: title, body: body )
end
