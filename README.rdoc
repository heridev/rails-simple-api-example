### This API example is made following the codeschool course Surviving API's with RAILS

#### If you want to retrieve the information using the public api(without token authentication)
##### Use the version 2 for the api

```
curl -i http://api.rails-api-example.dev/v2/patients
```


#### If you want to test the version which uses authentication based on tokens you can refer to the version 3, for example

##### First generate a valid user from console

```
User.create!
```

##### And copy the token generated for using it in the curl request test

##### if you want to do a request to retrieve the patients you can refer to this example:
```
curl -i -H "Authorization: Token token=validgeneratedtoken" http://api.rails-api-example.dev/v3/patients
```

##### examples:

```
curl -i -H "Authorization: Token token=5e0a3dd2fb3d9446e935723411e9d0e7" http://api.rails-api-example.dev/v3/patients
```

##### if all works ok you are going to see somehitng like:
```
TTP/1.1 200 OK
X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: "d16998b0e614746595b5d6b5a8b6c28a"
Cache-Control: max-age=0, private, must-revalidate
Set-Cookie: request_method=GET; path=/
X-Request-Id: fce876f2-a4ed-4c18-86dc-7640983eec01
X-Runtime: 0.004695
Date: Sun, 27 Apr 2014 17:24:14 GMT
Connection: close

[{"id":1,"first_name":"heriberto","last_name":"jose","phone":null,"created_at":"2014-04-19T19:59:37.800Z","updated_at":"2014-04-19T19:59:37.800Z","available":null},{"id":2,"first_name":"heriberto","last_name":"jose","phone":null,"created_at":"2014-04-19T19:59:39.978Z","updated_at":"2014-04-19T19:59:39.978Z","available":null},{"id":3,"first_name":"heriberto 2","last_name":"jose","phone":null,"created_at":"2014-04-19T19:59:43.681Z","updated_at":"2014-04-19T19:59:43.681Z","available":null},{"id":4,"first_name":"HeribetoPere","last_name":"perez","phone":null,"created_at":"2014-04-19T22:04:54.574Z","updated_at":"2014-04-19T22:04:54.574Z","available":null}]
```

##### If you add an invalid token like
curl -i -H "Authorization: Token token=invalidtoken" http://api.rails-api-example.dev/v3/patients

##### you are going to see something like:

```
HTTP/1.1 401 Unauthorized
X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
WWW-Authenticate: Token realm="Patients"
Content-Type: application/json; charset=utf-8
Cache-Control: no-cache
Set-Cookie: request_method=GET; path=/
X-Request-Id: 78ea43c1-f143-4311-bb39-4ab403cf8699
X-Runtime: 0.002966
Date: Sun, 27 Apr 2014 17:24:18 GMT
Connection: close

Bad credentials
```

### and that's it, regards


