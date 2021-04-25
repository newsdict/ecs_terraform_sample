# 
# This makefile for executing the terraform command.
# 
# ex) $ make [staging|production] [terraform command. For example `apply`]
# 

ARG = plan
SERVICE = backend

staging:
	cd services/${SERVICE}/staging && \
		terraform ${ARG}

production:
	cd services/${SERVICE}/production && \
		terraform ${ARG}