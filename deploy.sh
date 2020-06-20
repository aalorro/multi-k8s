docker build -t armandoalorro/multi-client:latest -t armandoalorro/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t armandoalorro/multi-server:latest -t armandoalorro/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t armandoalorro/multi-worker:latest -t armandoalorro/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push armandoalorro/multi-client:latest
docker push armandoalorro/multi-server:latest
docker push armandoalorro/multi-worker:lstest
docker push armandoalorro/multi-client:$SHA
docker push armandoalorro/multi-server:$SHA
docker push armandoalorro/multi-worker:$SHA
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=armandoalorro/multi-server:$SHA
kubectl set image deployments/client-deployment client=armandoalorro/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=armandoalorro/multi-worker:$SHA



