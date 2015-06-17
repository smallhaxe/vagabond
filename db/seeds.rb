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
                  ["San Francisco", "https://farm9.staticflickr.com/8233/8501175681_c9ae1e4f3e_o_d.jpg"],
                  ["Oakland", "https://farm4.staticflickr.com/3025/3091637074_e769a3be23_o_d.jpg"],
                  ["San Jose", "http://upload.wikimedia.org/wikipedia/commons/0/0f/SAN_JOSE_CALIFORNIA_PALM_TREE_2010.jpg"]
                ]

posts_seeds =   [
                  [1, "Hello, World!", "I'm Tejaswi!"],
                  [2, "Hello, World!", "I'm Wyatt!"],
                  [3, "Hello, World!", "I'm Vanessa"],
                  [4, "Hello, World!", "I'm Ugo!"],
                  [1, "Hello, Hipsters!", FFaker::HipsterIpsum::paragraphs],
                  [2, "Hello, Hipsters!", FFaker::HipsterIpsum::paragraphs],
                  [3, "Hello, Hipsters!", FFaker::HipsterIpsum::paragraphs],
                  [4, "Hello, Hipsters!", FFaker::HipsterIpsum::paragraphs],
                ]
users_seeds.each do |first_name, last_name, email, password|
  
  User.create(
    first_name: first_name, last_name: last_name,
    email: email, password: password
  )
  
end

places_seeds.each do |name, picture|
  Place.create( name: name, picture: picture )
end
  

posts_seeds.each do |id, title, body|
  Post.create( user_id: id, title: title, body: body )
end
