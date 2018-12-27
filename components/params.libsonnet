{
  global: {
    // User-defined global parameters; accessible to all component and environments, Ex:
    // replicas: 4,
    mariadbEmptyPassword: "no",
    mariadbUser: "mywordpressuser",
    mariadbPassword: "mywordpresspassword",
    mariadbDatabase: "mywordpress",
  },
  components: {
    // Component-level parameters, defined initially from 'ks prototype use ...'
    // Each object below should correspond to a component in the components/ directory
    wordpress: {
      containerPort: 80,
      image: "bitnami/wordpress:5.0.2",
      name: "wordpress",
      replicas: 1,
      servicePort: 80,
      type: "ClusterIP",
    },
    mariadb: {
      containerPort: 3306,
      image: "bitnami/mariadb:10.1.37",
      name: "mariadb",
      replicas: 1,
      servicePort: 3306,
      type: "ClusterIP",
    },
  },
}
