{
  containerPort: 8080,
  image: "gcr.io/heptio-images/ks-guestbook-demo:0.2",
  name: "jsonnet-guestbook-ui",
  replicas: 1,
  servicePort: 8080,
  type: "LoadBalancer",
}
