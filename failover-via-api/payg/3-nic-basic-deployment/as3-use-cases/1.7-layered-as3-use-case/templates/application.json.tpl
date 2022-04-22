
%{ for app in apps ~}
      "${app.name}": {
        "class": "Application",
        "service": {
          "class": "Service_HTTP",
          "virtualAddresses": ${jsonencode(app.virtualAddresses)},
          "virtualPort": ${app.virtualPort},
          "pool": "web_pool"
        },
        "web_pool": {
          "class": "Pool",
          "monitors": [
            "http"
          ],
          "members": ${jsonencode([
            for pool in app.pool_members:
            {
              "servicePort": pool.servicePort,
              "serverAddresses": pool.serverAddresses
            }
          ])}
        }
      },
%{ endfor }