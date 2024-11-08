.PHONE: help
help: Makefile ## show list of commands
	@echo "Choose a command to run:"
	@echo ""
	@awk 'BEGIN {FS = ":.*?## "} /[a-zA-Z_-]+:.*?## / {sub("\\\\n",sprintf("\n%22c"," "), $$2);printf "\033[36m%-40s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST) | sort

.PHONE: run/chatbot
run/chatbot: ## run UI app
	@streamlit run ./app/streamlit_app.py

.PHONE: run/create_vector_store
run/create-vector-store: ## create a vector store for the trace file
  @python ./app/create_vector_store.py --trace-file=$(PWD)/data/trace.json --preprocessed-trace-file=$(PWD)/data/trace-description.txt
