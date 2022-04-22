{
  "$schema": "https://raw.githubusercontent.com/F5Networks/f5-appsvcs-extension/master/schema/latest/as3-schema.json",
  "class": "AS3",
  "action": "deploy",
  "persist": true,
  "declaration": {
    "class": "ADC",
    "schemaVersion": "3.0.0",
    "id": "urn:uuid:76f06c5a-b673-430d-8df4-d817cb3b9f3c",
    "label": "HTTP Application Services",
    "remark": "HTTP layered template approach",
    "controls": {
      "trace": true
    },
    ${tenant_payload}
  }
}