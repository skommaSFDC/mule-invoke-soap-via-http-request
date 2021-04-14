# mule-invoke-soap-via-http-request

__Typical way to consume a SOAP web service in Mule is using Consume component in Web Service Consumer module. But sometimes you can't. This is an alternate way to do that using HTTP Request component__

1) One of the issues you may run into is WSDLs coded with RPC-style. You will see an error like this:
   
   Error trying to acquire a new connection:The provided WSDL is RPC style, RPC WSDLs are not supported

2) On one occasion, when I mapped SOAP body using transform and invoked Consume, for some reason request got transmitted to the provider with "<?xml version='1.0' encoding='UTF-8'?>" inside the envelope but over the body and provider system did not like it.  

Something like shown below:

         <soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:jpas="http://test.namspace.org/">
         <soapenv:Header/>
         <soapenv:Body>
            <?xml version='1.0' encoding='UTF-8'?>   <--------
            <jpas:request>...</jpas:request>
         </soapenv:Body>
         </soap:Envelope>
 
Since underlying protocol is HTTP even for SOAP request, we can use HTTP Request to invoke a SOAP web service call. It's typical HTTP Request configuration except, most importantly, it needs a header **"Content-Type" : "text/xml"** for this to work.

It has couple of endpoints.

1) **/soap-via-consume** (You can invoke this to see the error you would run into with RPC-styled WSDLs. This is using Consume component.

2) **/soap-via-http** (This is the one using HTTP Request)

__Request XML:__ https://github.com/srkomma/mule-invoke-soap-via-http-request/blob/master/src/test/resources/request.xml
