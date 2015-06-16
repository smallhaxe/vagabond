# require 'ffaker'

seed_params = [
                [ "Tejaswi", "Sagiraju",
                  "tejaswi@sagiraj.u", "tejaswi" ],
                  
                [ "Wyatt", "Sweet",
                  "wyatt@swee.t", "wyatt" ],
                  
                [ "Vanessa", "Farraye",
                  "vanessa@farray.e", "vanessa" ],
                  
                [ "Ugo", "Aniukwu",
                  "ugo@aniukw.u", "ugo" ]
              ]

seed_params.each do |first_name, last_name, email, password|
  
  User.create(
    first_name: first_name, last_name: last_name,
    email: email, password: password
  )
  
end
