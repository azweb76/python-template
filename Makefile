PYTHON=python
COVERAGE=coverage

.PHONY: test

test:
	@echo "*** Running unittests with $(PYTHON) ***"
	PYTHONPATH=.:tests/ $(PYTHON) -m unittest discover -v -s tests/ -s tests/lib/ -p '*_test.py'

coverage:
	@which $(COVERAGE) || (echo "*** Please install coverage ***"; exit 2)
	@echo "*** Running unittests with $(COVERAGE) for $(PYTHON) ***"
	PYTHONPATH=.:tests/ $(COVERAGE) run --branch -m unittest discover -v \
	  -s tests/ -s tests/lib/ -p '*_test.py'
	$(COVERAGE) report --include="./lib/*"
	$(COVERAGE) xml --include="./lib/*"
