# rdiCidr

Ok, let's get this out of the way. Why did I choose that name? I chose the name because palindromes are fun. The app's name stands for RDerik's Interactive  CIDR (RDICIDR). I had to add the Interactive to make the name work. I hope you like it.

RDICIDR is a react-app, but if you want to focus on the subnetting code, check the file:

```
src/lib/ipv4.js
```

You should find there how each property was calculated.

This application is not a final product. I just built it because I wanted to refresh my subnetting knowledge. Enjoy!

# Live version

You can find a live version at the following url:

[https://rdicidr.rderik.com](https://rdicidr.rderik.com)

If you find this tool useful, you might enjoy reading my blog: [https://rderik.com](https://rderik.com)

# Minikube

Check if Minikube is running:
```
minikube status
```

Initialize the cluster:
```
minikube start
```

List Minikube addons:
```
minikube addons list
```

Enable the Ingress addon:
```
minikube addons enable ingress
```

Get the IP address of Minikube:
```
minikube ip
```

Update the /etc/hosts file on your local machine to point to the external IP address of the Kubernetes cluster.
```
sudo nano /etc/hosts
```
Add an entry like this:
```
<MINIKUBE_IP> fsl-challenge.me
```
Replace <MINIKUBE_IP> with the IP address obtained from the minikube ip command.

# Helm

helm create fsl-challenge-test fsl-challenge-test -n production

helm uninstall fsl-challenge-test -n production

kubectl create secret generic my-secret --from-literal=MY_SECRET=On3H1torL3sS -n production

kubectl port-forward -n production service/<SERVICE_NAME> 9000:8080
