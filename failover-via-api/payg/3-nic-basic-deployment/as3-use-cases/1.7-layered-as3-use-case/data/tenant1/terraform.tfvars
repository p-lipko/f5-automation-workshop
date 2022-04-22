tenant_name = "test1"
applications = [
    {
        name: "test"
        virtualAddresses: ["10.1.1.20"]
        virtualPort: 80
        pool_members: [
            {
                serverAddresses: ["10.1.2.110", "10.1.2.113"]
                servicePort: 80
            }
        ]
    }
]