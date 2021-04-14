%dw 2.0
import * from dw::test::Asserts
---
payload must equalTo(do {
  ns SOAP-ENV http://schemas.xmlsoap.org/soap/envelope/
  ---
  {
    SOAP-ENV#"Envelope" @("encodingStyle": "http://schemas.xmlsoap.org/soap/encoding/"): do {
      ns SOAP-ENV http://schemas.xmlsoap.org/soap/envelope/
      ---
      {
        SOAP-ENV#"Body": do {
          ns ns1 https://graphical.weather.gov/xml/DWMLgen/wsdl/ndfdXML.wsdl
          ---
          {
            ns1#"LatLonListZipCodeResponse": {
              "listLatLonOut" @("type": "xsd:string"): "<?xml version='1.0'?><dwml version='1.0' xmlns:xsd='http://www.w3.org/2001/XMLSchema' xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xsi:noNamespaceSchemaLocation='https://graphical.weather.gov/xml/DWMLgen/schema/DWML.xsd'><latLonList>35.7834,-78.7989</latLonList></dwml>"
            }
          }
        }
      }
    }
  }
})