docker build -t saifulcce/multi-client:latest -t saifulcce/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t saifulcce/multi-server:latest -t saifulcce/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t saifulcce/multi-worker:latest -t saifulcce/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push saifulcce/multi-client:latest
docker push saifulcce/multi-server:latest
docker push saifulcce/multi-worker:latest


docker push saifulcce/multi-client:$SHA
docker push saifulcce/multi-server:$SHA
docker push saifulcce/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=saifulcce/multi-server:$SHA
kubectl set image deployments/client-deployment client=saifulcce/multi-client:$S
HA
kubectl set image deployments/worker-deployment worker=saifulcce/multi-worker:$S
HA

