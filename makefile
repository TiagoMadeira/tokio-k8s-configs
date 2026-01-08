start_staging_cluster:

	@echo enable ingress
	minikube addons enable ingress
	@echo creating docker registry secret
	kubectl create secret docker-registry regcred --docker-server=https://index.docker.io/v1/ --docker-username=tiagomadeiradock --docker-password=dckr_pat_2xcyli5_19JkkO7lLtf_SygBgJE --docker-email=tiagopmadeira@gmail.com
	@echo applying config files
	kubectl apply -f staging/configmaps/rest-service-configmap.yaml
	kubectl apply -f staging/rest-service-deployment.yaml
	kubectl apply -f staging/calculator-service-deployment.yaml
	kubectl apply -f staging/ingress.yaml

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