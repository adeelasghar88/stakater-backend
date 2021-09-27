eval $(minikube docker-env)
minikube docker-env
mvn clean package
docker build -t adeel/stakater-backend:latest .
helm install stakater-backend stakater-backend
sleep 30
export POD_NAME=$(kubectl get pods --namespace default -l "app.kubernetes.io/name=stakater-backend,app.kubernetes.io/instance=stakater-backend" -o jsonpath="{.items[0].metadata.name}")
export CONTAINER_PORT=$(kubectl get pod --namespace default $POD_NAME -o jsonpath="{.spec.containers[0].ports[0].containerPort}")
echo "Visit http://127.0.0.1:8080 to use your application"
kubectl --namespace default port-forward $POD_NAME 8080:8080