codecov_token = 63ec2962-9d38-4ae3-9216-ff305b69a502

.PHONY: check format tests

check:
	black --check --line-length 100 exercise.py
	black --check --line-length 100 tests.py
	flake8 --max-line-length 100 exercise.py
	flake8 --max-line-length 100 tests.py

coverage:
	pytest tests.py --cov=exercise.py --cov-report=xml --verbose && \
	codecov --token=${codecov_token}

format:
	black --line-length 100 exercise.py
	black --line-length 100 tests.py

tests:
	pytest tests.py --verbose