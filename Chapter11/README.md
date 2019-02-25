Chapter11 Alamofire


### NetworkReachability

### Get and Post Requset


- Get   
```swift
@IBAction func clickGetRequestBtn(_ sender: UIButton) {
    Alamofire.request("https://httpbin.org/get", method: .get, parameters: ["foo":"bar"]).responseJSON { response in
        print("original URL request: \(String(describing: response.request))")
        print("URL response: \(String(describing: response.response))")
        print("server data: \(String(describing: response.data))")
        print("timeline data: \(String(describing: response.timeline))")
        print("result of response serialization: \(response.result)")
        
        if let JSON = response.result.value {
            print("JSON: \(JSON)")
        }
    }
    
}
```

- Get Request  
```
original URL request: Optional(https://httpbin.org/get?foo=bar)
URL response: Optional(<NSHTTPURLResponse: 0x60000189a480> { URL: https://httpbin.org/get?foo=bar } { Status Code: 200, Headers {
    "Access-Control-Allow-Credentials" =     (
        true
    );
    "Access-Control-Allow-Origin" =     (
        "*"
    );
    Connection =     (
        "keep-alive"
    );
    "Content-Encoding" =     (
        gzip
    );
    "Content-Length" =     (
        270
    );
    "Content-Type" =     (
        "application/json"
    );
    Date =     (
        "Mon, 25 Feb 2019 06:35:08 GMT"
    );
    Server =     (
        nginx
    );
} })
server data: Optional(418 bytes)
server data: Optional(418 bytes)
timeline data: Timeline: { "Latency": 1.673 secs, "Request Duration": 1.675 secs, "Serialization Duration": 0.001 secs, "Total Duration": 1.676 secs }
result of response serialization: SUCCESS
JSON: {
    args =     {
        foo = bar;
    };
    headers =     {
        Accept = "*/*";
        "Accept-Encoding" = "gzip;q=1.0, compress;q=0.5";
        "Accept-Language" = "en;q=1.0";
        Host = "httpbin.org";
        "User-Agent" = "Alamofire_GetPostRequest/1.0 (com.coderdream.Alamofire-GetPostRequest; build:1; iOS 12.1.0) Alamofire/4.8.0";
    };
    origin = "220.249.72.237, 220.249.72.237";
    url = "https://httpbin.org/get?foo=bar";
}
```

- Post  
```swift
@IBAction func clickPostRequestBtn(_ sender: UIButton) {
    let parameters = [
        "foo" : "bar",
        "baz" : ["a", 1],
        "qux" : [
            "x" : 1,
            "y" : 2,
            "z" : 3
        ]
    ] as [String : Any]
    
    Alamofire.request("https://httpbin.org/post", method: .post, parameters: parameters).responseJSON { response in
        print("original URL request: \(String(describing: response.request))")
        print("URL response: \(String(describing: response.response))")
        print("server data: \(String(describing: response.data))")
        print("timeline data: \(String(describing: response.timeline))")
        print("result of response serialization: \(response.result)")
        
        if let JSON = response.result.value {
            print("JSON: \(JSON)")
        }
    }
}
```

- Post Request  
```
original URL request: Optional(https://httpbin.org/post)
URL response: Optional(<NSHTTPURLResponse: 0x600001899ea0> { URL: https://httpbin.org/post } { Status Code: 200, Headers {
    "Access-Control-Allow-Credentials" =     (
        true
    );
    "Access-Control-Allow-Origin" =     (
        "*"
    );
    Connection =     (
        "keep-alive"
    );
    "Content-Encoding" =     (
        gzip
    );
    "Content-Length" =     (
        386
    );
    "Content-Type" =     (
        "application/json"
    );
    Date =     (
        "Mon, 25 Feb 2019 06:35:46 GMT"
    );
    Server =     (
        nginx
    );
} })
server data: Optional(681 bytes)
timeline data: Timeline: { "Latency": 1.527 secs, "Request Duration": 1.528 secs, "Serialization Duration": 0.000 secs, "Total Duration": 1.528 secs }
result of response serialization: SUCCESS
JSON: {
    args =     {
    };
    data = "";
    files =     {
    };
    form =     {
        "baz[]" =         (
            a,
            1
        );
        foo = bar;
        "qux[x]" = 1;
        "qux[y]" = 2;
        "qux[z]" = 3;
    };
    headers =     {
        Accept = "*/*";
        "Accept-Encoding" = "gzip;q=1.0, compress;q=0.5";
        "Accept-Language" = "en;q=1.0";
        "Content-Length" = 70;
        "Content-Type" = "application/x-www-form-urlencoded; charset=utf-8";
        Host = "httpbin.org";
        "User-Agent" = "Alamofire_GetPostRequest/1.0 (com.coderdream.Alamofire-GetPostRequest; build:1; iOS 12.1.0) Alamofire/4.8.0";
    };
    json = "<null>";
    origin = "220.249.72.237, 220.249.72.237";
    url = "https://httpbin.org/post";
}
```