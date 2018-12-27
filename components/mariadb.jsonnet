local env = std.extVar("__ksonnet/environments");
local params = std.extVar("__ksonnet/params").components.mariadb;
[
{
    "apiVersion": "v1",
        "kind": "Service",
        "metadata": {
            "name": params.name
        },
        "spec": {
            "ports": [
            {
                "port": params.servicePort,
                "targetPort": params.containerPort
            }
            ],
            "selector": {
                "app": params.name
            },
            "type": params.type
        }
},
{
    "apiVersion": "apps/v1beta2",
    "kind": "Deployment",
    "metadata": {
        "name": params.name
    },
    "spec": {
        "replicas": params.replicas,
        "selector": {
            "matchLabels": {
                "app": params.name
            },
        },
        "template": {
            "metadata": {
                "labels": {
                    "app": params.name
                }
            },
            "spec": {
                "containers": [
                {
                    "image": params.image,
                    "name": params.name,
                    "ports": [
                    {
                        "containerPort": params.containerPort
                    },
                    ],
                    "env": [
                    {
                        "name": "ALLOW_EMPTY_PASSWORD",
                        "value": params.mariadbEmptyPassword,
                    },
                    {
                        "name": "MARIADB_USER",
                        "value": params.mariadbUser,
                    },
                    {
                        "name": "MARIADB_PASSWORD",
                        "value": params.mariadbPassword,
                    },
                    {
                        "name": "MARIADB_ROOT_PASSWORD",
                        "value": params.mariadbPassword,
                    },
                    {
                        "name": "MARIADB_DATABASE",
                        "value": params.mariadbDatabase,
                    },
                    ],
                    "volumeMounts": [
                    {
                        "mountPath": "/var/lib/mysql",
                        "name": "mariadb"
                    }
                    ]
                }
                ],
                "volumes": [
                {
                    "name": "mariadb",
                    "hostPath": {
                        "path": "/home/docker/mariadb-data"
                    }
                }
                ]
            }
        }
    }
}
]
