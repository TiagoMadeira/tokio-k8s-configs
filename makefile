start_staging_cluster:

	@echo enable ingress
	minikube addons enable ingress
	@echo create observability namespace
	kubectl create namespace observability
	@echo creating docker registry secret
	kubectl create secret docker-registry regcred --docker-server=https://index.docker.io/v1/ --docker-username=tiagomadeiradock --docker-password=dckr_pat_2xcyli5_19JkkO7lLtf_SygBgJE --docker-email=tiagopmadeira@gmail.com
	@echo applying config files
	kubectl apply -f staging/configmaps/calculator-service-configmap.yaml
	kubectl apply -f staging/configmaps/rest-service-configmap.yaml
	kubectl apply -f staging/rest-service-deployment.yaml
	kubectl apply -f staging/calculator-service-deployment.yaml
	kubectl apply -f staging/ingress/calculator-ingress.yaml
	@echo apply observability configs
	kubectl apply -f staging/configmaps/otel-collector-agent-configmap.yaml
	kubectl apply -f staging/jaeger-deployment.yaml
	kubectl apply -f staging/ingress/jaeger-ingress.yaml

start_production_cluster:

	@echo enable ingress
	minikube addons enable ingress
	@echo creating docker registry secret
	kubectl create secret docker-registry regcred --docker-server=https://index.docker.io/v1/ --docker-username=tiagomadeiradock --docker-password=dckr_pat_2xcyli5_19JkkO7lLtf_SygBgJE --docker-email=tiagopmadeira@gmail.com
	@echo applying config files
	kubectl apply -f production/configmaps/rest-service-configmap.yaml
	kubectl apply -f production/rest-service-deployment.yaml
	kubectl apply -f production/calculator-service-deployment.yaml
	kubectl apply -f production/ingress.yaml 