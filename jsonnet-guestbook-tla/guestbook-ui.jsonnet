function (
    containerPort=8080, 
    image="gcr.io/heptio-images/ks-guestbook-demo:0.2", 
    name="jsonnet-guestbook-ui",
    replicas=1,
    servicePort=8080, 
    type="LoadBalancer"
)
    [
    {
        "apiVersion": "v1",
        "kind": "Service",
        "metadata": {
            "name": name
        },
        "spec": {
            "ports": [
                {
                "port": servicePort,
                "targetPort": containerPort
                }
            ],
            "selector": {
                "app": name
            },
            "type": type
        }
    },
    {
        "apiVersion": "apps/v1",
        "kind": "Deployment",
        "metadata": {
            "name": name
        },
        "spec": {
            "replicas": replicas,
            "revisionHistoryLimit": 3,
            "selector": {
                "matchLabels": {
                "app": name
                },
            },
            "template": {
                "metadata": {
                "labels": {
                    "app": name
                }
                },
                "spec": {
                "containers": [
                    {
                        "image": image,
                        "name": name,
                        "ports": [
                        {
                            "containerPort": containerPort
                        }
                        ]
                    }
                ]
                }
            }
        }
    }
    ]
