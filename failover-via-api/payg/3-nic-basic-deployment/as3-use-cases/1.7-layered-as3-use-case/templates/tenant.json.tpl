    "${tenant_name}": {
      ${application_payload}
      "class": "Tenant",
      "${tenant_name}_profiles": {
        "class": "Application",
        "${tenant_name}_http_profile": {
          "class": "HTTP_Profile",
          "trustXFF": true
        },
        "${tenant_name}_http2_profile": {
          "class": "HTTP2_Profile",
          "enforceTlsRequirements": false
        }
      }
    }