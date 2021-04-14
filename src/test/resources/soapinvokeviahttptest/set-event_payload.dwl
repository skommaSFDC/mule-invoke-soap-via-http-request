do {
  ns soapenv http://schemas.xmlsoap.org/soap/envelope/
  ---
  {
    soapenv#"Envelope": do {
      ns soapenv http://schemas.xmlsoap.org/soap/envelope/
      ---
      {
        soapenv#"Header": null,
        soapenv#"Body": do {
          ns ndf https://graphical.weather.gov/xml/DWMLgen/wsdl/ndfdXML.wsdl
          ---
          {
            ndf#"LatLonListZipCode" @("encodingStyle": "http://schemas.xmlsoap.org/soap/encoding/"): {
              "zipCodeList" @("type": "dwml:zipCodeListType"): "27519"
            }
          }
        }
      }
    }
  }
}