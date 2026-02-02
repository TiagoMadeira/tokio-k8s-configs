docker_name =
docker_password =
docker_email = 



start_staging_cluster:

	@echo enable ingress
	minikube addons enable ingress
	@echo create observability namespace
	kubectl create namespace observability
	@echo creating docker registry secret
	kubectl create secret docker-registry regcred --docker-server=https://index.docker.io/v1/ --docker-username=$(docker_name) --docker-password=$(docker_password) --docker-email=$(docker_email)
	@echo applying config files
	kubectl apply -f staging/configmaps/calculator-service-configmap.yaml
	kubectl apply -f staging/configmaps/rest-service-configmap.yaml
	kubectl apply -f staging/configmaps/jaeger-configmap.yaml
	@echo applying deployments
	kubectl apply -f staging/rest-service-deployment.yaml
	kubectl apply -f staging/calculator-service-deployment.yaml
	kubectl apply -f staging/jaeger-deployment.yaml
	@echo applying ingresses
	kubectl apply -f staging/ingress/jaeger-ingress.yaml
	kubectl apply -f staging/ingress/calculator-ingress.yaml

start_production_cluster:

	@echo enable ingress
	minikube addons enable ingress
	@echo create observability namespace
	kubectl create namespace observability
	@echo creating docker registry secret
	kubectl create secret docker-registry regcred --docker-server=https://index.docker.io/v1/ --docker-username=$(docker_name) --docker-password=$(docker_password) --docker-email=$(docker_email)
	@echo applying config files
	kubectl apply -f production/configmaps/calculator-service-configmap.yaml
	kubectl apply -f production/configmaps/rest-service-configmap.yaml
	kubectl apply -f production/configmaps/jaeger-configmap.yaml
	@echo applying deployments
	kubectl apply -f production/rest-service-deployment.yaml
	kubectl apply -f production/calculator-service-deployment.yaml
	kubectl apply -f production/jaeger-deployment.yaml
	@echo applying ingresses
	kubectl apply -f production/ingress/jaeger-ingress.yaml
	kubectl apply -f production/ingress/calculator-ingress.yaml


start_development_cluster:
	@echo enable ingress
	minikube addons enable ingress
	@echo create observability namespace
	kubectl create namespace observability
	@echo creating docker registry secret
	kubectl create secret docker-registry regcred --docker-server=https://index.docker.io/v1/ --docker-username=$(docker_name) --docker-password=$(docker_password) --docker-email=$(docker_email)
	@echo applying config files
	kubectl apply -f development/configmaps/calculator-service-configmap.yaml
	kubectl apply -f development/configmaps/rest-service-configmap.yaml
	kubectl apply -f development/configmaps/jaeger-configmap.yaml
	@echo applying deployments
	kubectl apply -f development/rest-service-deployment.yaml
	kubectl apply -f development/calculator-service-deployment.yaml
	kubectl apply -f development/jaeger-deployment.yaml
	@echo applying ingresses
	kubectl apply -f development/ingress/jaeger-ingress.yaml
	kubectl apply -f development/ingress/calculator-ingress.yaml
